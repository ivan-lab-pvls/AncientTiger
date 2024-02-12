import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/screens/games/match_pairs/levels/bloc/match_pairs_levels_bloc.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/action_button_widget.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MatchPairsDifficultyScreen extends StatefulWidget {
  const MatchPairsDifficultyScreen({super.key});

  @override
  State<MatchPairsDifficultyScreen> createState() =>
      _MatchPairsDifficultyScreenState();
}

class _MatchPairsDifficultyScreenState
    extends State<MatchPairsDifficultyScreen> {
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
                      'Match Pairs'.toUpperCase(),
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
                                          .push(MatchPairsLevelsRoute(difficult: LevelDifficult.simple));
                                    case 1:
                                      context.router
                                          .push(MatchPairsLevelsRoute(difficult: LevelDifficult.middle));
                                    case 2:
                                      context.router
                                          .push(MatchPairsLevelsRoute(difficult: LevelDifficult.advanced));
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
