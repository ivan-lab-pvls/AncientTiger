
enum LevelDifficult {
  simple,
  middle,
  advanced,
}

enum GameType {
  matchPairs,
  minesweeper,
}

class LevelModel {
  final int number;
  final List<String> cardImages;
  final LevelDifficult difficult;
  bool isDone;
  int minutes;
  int seconds;

  LevelModel(
      {required this.cardImages,
        required this.isDone,
        required this.difficult,
        required this.minutes,
        required this.seconds,
        required this.number});
}