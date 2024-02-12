part of 'scores_bloc.dart';

@immutable
abstract class ScoresEvent {}

class GetScoresEvent extends ScoresEvent {}

class IncrementCoinsEvent extends ScoresEvent {
  final int coins;

  IncrementCoinsEvent({required this.coins});
}

class DecrementHeartEvent extends ScoresEvent {}