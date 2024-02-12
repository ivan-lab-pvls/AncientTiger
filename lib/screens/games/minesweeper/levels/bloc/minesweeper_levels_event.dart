part of 'minesweeper_levels_bloc.dart';

@immutable
abstract class MinesweeperLevelsEvent {}

class GetMinesweeperLevelsEvent extends MinesweeperLevelsEvent {
  final LevelDifficult difficult;

  GetMinesweeperLevelsEvent({required this.difficult});
}
