import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/screens/games/match_pairs/difficulty/match_pairs_difficulty_screen.dart';
import 'package:ancient_excavations_app/screens/games/match_pairs/levels/match_pairs_levels_screen.dart';
import 'package:ancient_excavations_app/screens/games/match_pairs/match_pairs_game/match_pairs_game_screen.dart';
import 'package:ancient_excavations_app/screens/games/minesweeper/difficulty/minesweeper_difficulty_screen.dart';
import 'package:ancient_excavations_app/screens/games/minesweeper/levels/minesweeper_levels_screen.dart';
import 'package:ancient_excavations_app/screens/games/minesweeper/minesweeper_game/minesweeper_game_screen.dart';
import 'package:ancient_excavations_app/screens/loading/loading_screen.dart';
import 'package:ancient_excavations_app/screens/lobby/lobby_screen.dart';
import 'package:ancient_excavations_app/screens/lost/lost_screen.dart';
import 'package:ancient_excavations_app/screens/onboarding/onboarding_screen.dart';
import 'package:ancient_excavations_app/screens/settings/settings_screen.dart';
import 'package:ancient_excavations_app/screens/win/win_screen.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: LobbyRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: MatchPairsDifficultyRoute.page),
    AutoRoute(page: MatchPairsLevelsRoute.page),
    AutoRoute(page: MatchPairsGameRoute.page),
    AutoRoute(page: MinesweeperDifficultyRoute.page),
    AutoRoute(page: MinesweeperLevelsRoute.page),
    AutoRoute(page: MinesweeperGameRoute.page),
    AutoRoute(page: WinRoute.page),
    AutoRoute(page: LostRoute.page),

  ];
}