import 'dart:async';

import 'package:ancient_excavations_app/services/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scores_event.dart';
part 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  ScoresBloc() : super(ScoresInitial()) {
    on<GetScoresEvent>(_getScoresHandler);
    on<IncrementCoinsEvent>(_incrementCoinsHandler);
    on<DecrementHeartEvent>(_decrementHeartHandler);
  }

  void _getScoresHandler(
      GetScoresEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts));
  }

  void _incrementCoinsHandler(
      IncrementCoinsEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.coins += event.coins;
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts));
  }

  void _decrementHeartHandler(
      DecrementHeartEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.hearts -= 1;
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts));
  }

}
