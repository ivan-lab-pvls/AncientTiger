import 'package:ancient_excavations_app/ancient_excavations_app.dart';
import 'package:ancient_excavations_app/domain/configuration.dart';
import 'package:ancient_excavations_app/domain/notifx.dart';
import 'package:ancient_excavations_app/repository/match_pairs_levels_repository.dart';
import 'package:ancient_excavations_app/repository/minesweeper_levels_repository.dart';
import 'package:ancient_excavations_app/screens/games/match_pairs/levels/bloc/match_pairs_levels_bloc.dart';
import 'package:ancient_excavations_app/screens/games/minesweeper/levels/bloc/minesweeper_levels_bloc.dart';
import 'package:ancient_excavations_app/widgets/scores/bloc/scores_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: AppFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 15),
      minimumFetchInterval: const Duration(
        seconds: 145,
      ),
    ),
  );

  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await NotificationsFb().activate();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  GetIt.instance.registerSingleton(MinesweeperLevelsRepository());
  GetIt.instance.registerSingleton(MatchPairsLevelsRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<MatchPairsLevelsBloc>(
          create: (context) =>
              MatchPairsLevelsBloc(GetIt.I<MatchPairsLevelsRepository>())),
      BlocProvider<MinesweeperLevelsBloc>(
          create: (context) =>
              MinesweeperLevelsBloc(GetIt.I<MinesweeperLevelsRepository>())),
      BlocProvider<ScoresBloc>(create: (context) => ScoresBloc()),
    ],
    child: AncientExcavationsApp(),
  ));
}
