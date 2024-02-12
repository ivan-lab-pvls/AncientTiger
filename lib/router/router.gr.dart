// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
    LobbyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LobbyScreen(),
      );
    },
    LostRoute.name: (routeData) {
      final args = routeData.argsAs<LostRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LostScreen(
          key: args.key,
          level: args.level,
          lostType: args.lostType,
          gameType: args.gameType,
        ),
      );
    },
    MatchPairsDifficultyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MatchPairsDifficultyScreen(),
      );
    },
    MatchPairsGameRoute.name: (routeData) {
      final args = routeData.argsAs<MatchPairsGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MatchPairsGameScreen(
          key: args.key,
          level: args.level,
        ),
      );
    },
    MatchPairsLevelsRoute.name: (routeData) {
      final args = routeData.argsAs<MatchPairsLevelsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MatchPairsLevelsScreen(
          key: args.key,
          difficult: args.difficult,
        ),
      );
    },
    MinesweeperDifficultyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MinesweeperDifficultyScreen(),
      );
    },
    MinesweeperGameRoute.name: (routeData) {
      final args = routeData.argsAs<MinesweeperGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MinesweeperGameScreen(
          key: args.key,
          level: args.level,
        ),
      );
    },
    MinesweeperLevelsRoute.name: (routeData) {
      final args = routeData.argsAs<MinesweeperLevelsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MinesweeperLevelsScreen(
          key: args.key,
          difficult: args.difficult,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    WinRoute.name: (routeData) {
      final args = routeData.argsAs<WinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WinScreen(
          key: args.key,
          gameType: args.gameType,
          levelDifficult: args.levelDifficult,
        ),
      );
    },
  };
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LobbyScreen]
class LobbyRoute extends PageRouteInfo<void> {
  const LobbyRoute({List<PageRouteInfo>? children})
      : super(
          LobbyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LobbyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LostScreen]
class LostRoute extends PageRouteInfo<LostRouteArgs> {
  LostRoute({
    Key? key,
    required LevelModel level,
    required LostType lostType,
    required GameType gameType,
    List<PageRouteInfo>? children,
  }) : super(
          LostRoute.name,
          args: LostRouteArgs(
            key: key,
            level: level,
            lostType: lostType,
            gameType: gameType,
          ),
          initialChildren: children,
        );

  static const String name = 'LostRoute';

  static const PageInfo<LostRouteArgs> page = PageInfo<LostRouteArgs>(name);
}

class LostRouteArgs {
  const LostRouteArgs({
    this.key,
    required this.level,
    required this.lostType,
    required this.gameType,
  });

  final Key? key;

  final LevelModel level;

  final LostType lostType;

  final GameType gameType;

  @override
  String toString() {
    return 'LostRouteArgs{key: $key, level: $level, lostType: $lostType, gameType: $gameType}';
  }
}

/// generated route for
/// [MatchPairsDifficultyScreen]
class MatchPairsDifficultyRoute extends PageRouteInfo<void> {
  const MatchPairsDifficultyRoute({List<PageRouteInfo>? children})
      : super(
          MatchPairsDifficultyRoute.name,
          initialChildren: children,
        );

  static const String name = 'MatchPairsDifficultyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MatchPairsGameScreen]
class MatchPairsGameRoute extends PageRouteInfo<MatchPairsGameRouteArgs> {
  MatchPairsGameRoute({
    Key? key,
    required LevelModel level,
    List<PageRouteInfo>? children,
  }) : super(
          MatchPairsGameRoute.name,
          args: MatchPairsGameRouteArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'MatchPairsGameRoute';

  static const PageInfo<MatchPairsGameRouteArgs> page =
      PageInfo<MatchPairsGameRouteArgs>(name);
}

class MatchPairsGameRouteArgs {
  const MatchPairsGameRouteArgs({
    this.key,
    required this.level,
  });

  final Key? key;

  final LevelModel level;

  @override
  String toString() {
    return 'MatchPairsGameRouteArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [MatchPairsLevelsScreen]
class MatchPairsLevelsRoute extends PageRouteInfo<MatchPairsLevelsRouteArgs> {
  MatchPairsLevelsRoute({
    Key? key,
    required LevelDifficult difficult,
    List<PageRouteInfo>? children,
  }) : super(
          MatchPairsLevelsRoute.name,
          args: MatchPairsLevelsRouteArgs(
            key: key,
            difficult: difficult,
          ),
          initialChildren: children,
        );

  static const String name = 'MatchPairsLevelsRoute';

  static const PageInfo<MatchPairsLevelsRouteArgs> page =
      PageInfo<MatchPairsLevelsRouteArgs>(name);
}

class MatchPairsLevelsRouteArgs {
  const MatchPairsLevelsRouteArgs({
    this.key,
    required this.difficult,
  });

  final Key? key;

  final LevelDifficult difficult;

  @override
  String toString() {
    return 'MatchPairsLevelsRouteArgs{key: $key, difficult: $difficult}';
  }
}

/// generated route for
/// [MinesweeperDifficultyScreen]
class MinesweeperDifficultyRoute extends PageRouteInfo<void> {
  const MinesweeperDifficultyRoute({List<PageRouteInfo>? children})
      : super(
          MinesweeperDifficultyRoute.name,
          initialChildren: children,
        );

  static const String name = 'MinesweeperDifficultyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MinesweeperGameScreen]
class MinesweeperGameRoute extends PageRouteInfo<MinesweeperGameRouteArgs> {
  MinesweeperGameRoute({
    Key? key,
    required LevelModel level,
    List<PageRouteInfo>? children,
  }) : super(
          MinesweeperGameRoute.name,
          args: MinesweeperGameRouteArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'MinesweeperGameRoute';

  static const PageInfo<MinesweeperGameRouteArgs> page =
      PageInfo<MinesweeperGameRouteArgs>(name);
}

class MinesweeperGameRouteArgs {
  const MinesweeperGameRouteArgs({
    this.key,
    required this.level,
  });

  final Key? key;

  final LevelModel level;

  @override
  String toString() {
    return 'MinesweeperGameRouteArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [MinesweeperLevelsScreen]
class MinesweeperLevelsRoute extends PageRouteInfo<MinesweeperLevelsRouteArgs> {
  MinesweeperLevelsRoute({
    Key? key,
    required LevelDifficult difficult,
    List<PageRouteInfo>? children,
  }) : super(
          MinesweeperLevelsRoute.name,
          args: MinesweeperLevelsRouteArgs(
            key: key,
            difficult: difficult,
          ),
          initialChildren: children,
        );

  static const String name = 'MinesweeperLevelsRoute';

  static const PageInfo<MinesweeperLevelsRouteArgs> page =
      PageInfo<MinesweeperLevelsRouteArgs>(name);
}

class MinesweeperLevelsRouteArgs {
  const MinesweeperLevelsRouteArgs({
    this.key,
    required this.difficult,
  });

  final Key? key;

  final LevelDifficult difficult;

  @override
  String toString() {
    return 'MinesweeperLevelsRouteArgs{key: $key, difficult: $difficult}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WinScreen]
class WinRoute extends PageRouteInfo<WinRouteArgs> {
  WinRoute({
    Key? key,
    required GameType gameType,
    required LevelDifficult levelDifficult,
    List<PageRouteInfo>? children,
  }) : super(
          WinRoute.name,
          args: WinRouteArgs(
            key: key,
            gameType: gameType,
            levelDifficult: levelDifficult,
          ),
          initialChildren: children,
        );

  static const String name = 'WinRoute';

  static const PageInfo<WinRouteArgs> page = PageInfo<WinRouteArgs>(name);
}

class WinRouteArgs {
  const WinRouteArgs({
    this.key,
    required this.gameType,
    required this.levelDifficult,
  });

  final Key? key;

  final GameType gameType;

  final LevelDifficult levelDifficult;

  @override
  String toString() {
    return 'WinRouteArgs{key: $key, gameType: $gameType, levelDifficult: $levelDifficult}';
  }
}
