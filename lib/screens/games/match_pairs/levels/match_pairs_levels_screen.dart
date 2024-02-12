import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/repository/match_pairs_levels_repository.dart';
import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/screens/games/match_pairs/levels/bloc/match_pairs_levels_bloc.dart';
import 'package:ancient_excavations_app/services/shared_preferences.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';
import 'package:ancient_excavations_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MatchPairsLevelsScreen extends StatefulWidget {
  final LevelDifficult difficult;

  const MatchPairsLevelsScreen({super.key, required this.difficult});

  @override
  State<MatchPairsLevelsScreen> createState() => _MatchPairsLevelsScreenState();
}

class _MatchPairsLevelsScreenState extends State<MatchPairsLevelsScreen> {
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
                BlocProvider(
                  create: (context) => MatchPairsLevelsBloc(
                      GetIt.I<MatchPairsLevelsRepository>())
                    ..add(
                        GetMatchPairsLevelsEvent(difficult: widget.difficult)),
                  child:
                      BlocConsumer<MatchPairsLevelsBloc, MatchPairsLevelsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is LoadedMatchPairsLevelsState) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.brown,
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          width: 460,
                          height: 200,
                          child: GridView.builder(
                            itemCount: state.levels.length,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  SharedPreferencesService storage =
                                  await SharedPreferencesService.getInstance();
                                  if (storage.hearts > 0) {
                                    context.read<ScoresBloc>().add(DecrementHeartEvent());
                                    context.router.push(MatchPairsGameRoute(level: state.levels[index]));
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
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      state.levels[index].isDone ?
                                      'assets/images/elements/level-card-done.svg' :
                                      'assets/images/elements/level-card.svg',
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 25),
                                        Text('${state.levels[index].number}',
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Container();
                    },
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
