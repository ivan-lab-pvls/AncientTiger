import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/services/shared_preferences.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/action_button_widget.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';
import 'package:ancient_excavations_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LostType {
  timeIsOver,
  exploded,
}

@RoutePage()
class LostScreen extends StatefulWidget {
  final GameType gameType;
  final LevelModel level;
  final LostType lostType;

  const LostScreen(
      {super.key,
      required this.level,
      required this.lostType,
      required this.gameType});

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {
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
                            widget.lostType == LostType.timeIsOver
                                ? 'Time is over'.toUpperCase()
                                : 'you exploded'.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.brown,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          ActionButtonWidget(
                              text: 'Start over',
                              onTap: () async {
                                SharedPreferencesService storage =
                                    await SharedPreferencesService.getInstance();
                                if (storage.hearts > 0) {
                                  context.read<ScoresBloc>().add(DecrementHeartEvent());
                                  switch (widget.gameType) {
                                    case GameType.matchPairs:
                                      context.router.push(MatchPairsGameRoute(
                                          level: widget.level));
                                    case GameType.minesweeper:
                                      context.router.push(MinesweeperGameRoute(level: widget.level));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.red,
                                      content: Text(
                                        'Oops... Not enough Health. Try Later.',
                                        style: TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                }
                              }),
                          ActionButtonWidget(
                              text: 'Exit',
                              onTap: () {
                                context.router.popAndPush(LobbyRoute());
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
