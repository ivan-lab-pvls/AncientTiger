import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/action_button_widget.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MinesweeperDifficultyScreen extends StatefulWidget {
  const MinesweeperDifficultyScreen({super.key});

  @override
  State<MinesweeperDifficultyScreen> createState() => _MinesweeperDifficultyScreenState();
}

class _MinesweeperDifficultyScreenState extends State<MinesweeperDifficultyScreen> {
  final controller = PageController();
  int current = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/background-2.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeButton(),
                    SettingsButton(),
                    Spacer(flex: 3),
                    Text(
                      'Minesweeper'.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(flex: 1),
                    ScoresPanel(),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/elements/card.png'),
                    Column(
                      children: [
                        Container(
                          width: 185,
                          height: 90,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {
                                current = index;
                              });
                            },
                            controller: controller,
                            children: [
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'simple'.toUpperCase(),
                                    style: TextStyle(
                                        color: AppColors.brown,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/difficulty/simple.svg',
                                    width: 76,
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'middle'.toUpperCase(),
                                    style: TextStyle(
                                        color: AppColors.brown,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/difficulty/middle.svg',
                                    width: 76,
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'advanced'.toUpperCase(),
                                    style: TextStyle(
                                        color: AppColors.brown,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/difficulty/advanced.svg',
                                    width: 76,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (current <= 2) {
                                  controller.previousPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/images/elements/left-button.svg',
                              ),
                            ),
                            ActionButtonWidget(
                                text: 'Play',
                                onTap: () {
                                  switch (current) {
                                    case 0:
                                      context.router
                                          .push(MinesweeperLevelsRoute(difficult: LevelDifficult.simple));
                                    case 1:
                                      context.router
                                          .push(MinesweeperLevelsRoute(difficult: LevelDifficult.middle));
                                    case 2:
                                      context.router
                                          .push(MinesweeperLevelsRoute(difficult: LevelDifficult.advanced));
                                  }
                                }),
                            GestureDetector(
                              onTap: () {
                                if (current >= 0) {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/images/elements/right-button.svg',
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Terms extends StatefulWidget {
  const Terms({super.key, required this.data});
  final String data;

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source:
                        "javascript:(function() { var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');ele[0].parentNode.removeChild(ele[0]);var footer = document.getelementsbytagname('footer')[0];footer.parentnode.removechild(footer);})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.data),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}