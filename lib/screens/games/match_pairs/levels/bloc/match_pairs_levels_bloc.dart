import 'dart:async';

import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/repository/match_pairs_levels_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'match_pairs_levels_event.dart';

part 'match_pairs_levels_state.dart';

class MatchPairsLevelsBloc
    extends Bloc<MatchPairsLevelsEvent, MatchPairsLevelsState> {
  final MatchPairsLevelsRepository _matchPairsLevelsRepository;

  MatchPairsLevelsBloc(this._matchPairsLevelsRepository)
      : super(MatchPairsLevelsInitial()) {
    on<GetMatchPairsLevelsEvent>(_getMatchPairsLevelsHandler);
  }

  void _getMatchPairsLevelsHandler(GetMatchPairsLevelsEvent event,
      Emitter<MatchPairsLevelsState> emit) async {
    final List<LevelModel> _levels;

    switch (event.difficult) {
      case LevelDifficult.simple:
        _levels = _matchPairsLevelsRepository.getSimpleLevels;
      case LevelDifficult.middle:
        _levels = _matchPairsLevelsRepository.getMiddleLevels;
      case LevelDifficult.advanced:
        _levels = _matchPairsLevelsRepository.getAdvancedLevels;
    };
    emit(LoadedMatchPairsLevelsState(
        levels: _levels));
    }
}
