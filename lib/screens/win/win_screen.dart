import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/action_button_widget.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WinScreen extends StatefulWidget {
  final GameType gameType;
  final LevelDifficult levelDifficult;

  const WinScreen(
      {super.key, required this.gameType, required this.levelDifficult});

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/background-5.png"),
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
                    Row(
                      children: [
                        HomeButton(),
                        SettingsButton(),
                      ],
                    ),
                    ScoresPanel(),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 230,
                  width: 380,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/elements/card.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level complete!'.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.brown,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Image.asset('assets/images/elements/prize.png'),
                          ActionButtonWidget(
                              text: 'Continue',
                              onTap: () {
                                switch (widget.gameType) {
                                  case GameType.matchPairs:
                                    context.router.push(MatchPairsLevelsRoute(
                                        difficult: widget.levelDifficult));
                                  case GameType.minesweeper:
                                    context.router.push(MinesweeperLevelsRoute(
                                        difficult: widget.levelDifficult));
                                }
                              })
                        ],
                      ),
                    ],
                  ),
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
