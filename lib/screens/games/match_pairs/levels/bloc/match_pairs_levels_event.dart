part of 'match_pairs_levels_bloc.dart';

@immutable
abstract class MatchPairsLevelsEvent {}

class GetMatchPairsLevelsEvent extends MatchPairsLevelsEvent {
  final LevelDifficult difficult;

  GetMatchPairsLevelsEvent({required this.difficult});
}

