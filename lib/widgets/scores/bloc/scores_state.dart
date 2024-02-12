part of 'scores_bloc.dart';

@immutable
abstract class ScoresState {}

class ScoresInitial extends ScoresState {}

class UpdateScoresState extends ScoresState {
  final int coins;
  final int hearts;

  UpdateScoresState({required this.coins, required this.hearts});
}