part of 'minesweeper_levels_bloc.dart';

@immutable
abstract class MinesweeperLevelsState {}

class MinesweeperLevelsInitial extends MinesweeperLevelsState {}

class LoadedMinesweeperLevelsState extends MinesweeperLevelsState {
  final List<LevelModel> levels;

  LoadedMinesweeperLevelsState({required this.levels});

}