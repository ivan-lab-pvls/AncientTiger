part of 'match_pairs_levels_bloc.dart';

@immutable
abstract class MatchPairsLevelsState {}

class MatchPairsLevelsInitial extends MatchPairsLevelsState {}

class LoadedMatchPairsLevelsState extends MatchPairsLevelsState {
  final List<LevelModel> levels;

  LoadedMatchPairsLevelsState({required this.levels});

}

