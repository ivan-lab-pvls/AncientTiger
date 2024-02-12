import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/action_button_widget.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  final controller = PageController();
  int current = 0;

  @override
  void initState() {
    current = 0;
    super.initState();
  }

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
                    SettingsButton(),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Match pairs'.toUpperCase(),
                                    style: TextStyle(
                                        color: AppColors.brown,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/elements/match-pairs-icon.png'),
                                      SizedBox(width: 20),
                                      Image.asset('assets/images/elements/match-pairs-icon.png'),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Minesweeper'.toUpperCase(),
                                    style: TextStyle(
                                        color: AppColors.brown,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Image.asset('assets/images/elements/minesweeper-icon.png')
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
                                if (current == 1) {
                                  controller.previousPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/images/elements/left-button.svg',
                              ),
                            ),
                            ActionButtonWidget(text: 'Play', onTap: () {
                              if (current == 0) {
                                context.router.push(MatchPairsDifficultyRoute());
                              } else {
                                context.router.push(MinesweeperDifficultyRoute());
                              }
                            }),
                            GestureDetector(
                              onTap: () {
                                if (current == 0) {
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
