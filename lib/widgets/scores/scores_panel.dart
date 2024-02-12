import 'dart:async';

import 'package:ancient_excavations_app/services/shared_preferences.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoresPanel extends StatefulWidget {
  const ScoresPanel({super.key});

  @override
  State<ScoresPanel> createState() => _ScoresPanelState();
}

class _ScoresPanelState extends State<ScoresPanel> {
  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    _timer = Timer.periodic(const Duration(minutes: 15), (timer) {
      if (storage.hearts == 0) {
        storage.hearts += 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScoresBloc()..add(GetScoresEvent()),
      child: BlocConsumer<ScoresBloc, ScoresState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UpdateScoresState) {
            final _coins = state.coins;
            final _hearts = state.hearts;
            return Row(
              children: [
                Row(children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/elements/coins-panel.png',
                        ),
                        Text(
                          '${_coins}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
                SizedBox(width: 10),
                Row(children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/elements/hearts-panel.png',
                        ),
                        Text(
                          '${_hearts}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
