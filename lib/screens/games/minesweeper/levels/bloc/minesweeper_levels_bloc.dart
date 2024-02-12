import 'dart:async';

import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/repository/minesweeper_levels_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'minesweeper_levels_event.dart';
part 'minesweeper_levels_state.dart';

class MinesweeperLevelsBloc extends Bloc<MinesweeperLevelsEvent, MinesweeperLevelsState> {
  final MinesweeperLevelsRepository _minesweeperLevelsRepository;
  MinesweeperLevelsBloc(this._minesweeperLevelsRepository) : super(MinesweeperLevelsInitial()) {
    on<GetMinesweeperLevelsEvent>(_getMinesweeperLevelsHandler);
  }

  void _getMinesweeperLevelsHandler(GetMinesweeperLevelsEvent event,
      Emitter<MinesweeperLevelsState> emit) async {
    final List<LevelModel> _levels;

    switch (event.difficult) {
      case LevelDifficult.simple:
        _levels = _minesweeperLevelsRepository.getSimpleLevels;
      case LevelDifficult.middle:
        _levels = _minesweeperLevelsRepository.getMiddleLevels;
      case LevelDifficult.advanced:
        _levels = _minesweeperLevelsRepository.getAdvancedLevels;
    };
    emit(LoadedMinesweeperLevelsState(
        levels: _levels));
  }
}
