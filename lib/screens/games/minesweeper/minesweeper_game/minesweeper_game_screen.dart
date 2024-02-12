import 'dart:math';

import 'package:ancient_excavations_app/models/card_model.dart';
import 'package:ancient_excavations_app/models/level_model.dart';
import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/screens/games/minesweeper/minesweeper_game/widgets/card_widget.dart';
import 'package:ancient_excavations_app/screens/lost/lost_screen.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/settings_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

@RoutePage()
class MinesweeperGameScreen extends StatefulWidget {
  final LevelModel level;

  const MinesweeperGameScreen({super.key, required this.level});

  @override
  State<MinesweeperGameScreen> createState() => _MinesweeperGameScreenState();
}

class _MinesweeperGameScreenState extends State<MinesweeperGameScreen> {
  int startGameTime = DateTime.now().millisecondsSinceEpoch;

  @override
  void initState() {
    super.initState();
    generateCards();
  }

  List<CardModel> cards = [];
  bool isGameOver = false;
  Set<String> images = {};


  void generateCards() {
    cards = [];
    for (int i = 0; i < widget.level.cardImages.length; i++) {
      final cardValue = i + 1;
      final String image = widget.level.cardImages[i];
      final CardModel newCard = _createCardModel(image, cardValue);
      cards.add(newCard);
    }
    cards.shuffle(Random());
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }


  void onCardPressed(int index) {
    setState(() {
      cards[index].state = CardState.visible;
    });
    if (cards[index].image == 'assets/images/minesweeper/bomb.png') {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.router.popAndPush(LostRoute(
            gameType: GameType.minesweeper,
            level: widget.level,
            lostType: LostType.exploded));
      });
    } else {
      cards[index].state = CardState.guessed;
      isGameOver = _isGameOver();
      if (isGameOver) {
        Future.delayed(const Duration(seconds: 1), () {
          widget.level.isDone = true;
          context.router.popAndPush(WinRoute(gameType: GameType.minesweeper, levelDifficult: widget.level.difficult));
        });
      }
    }
  }

  CardModel _createCardModel(String image, int cardValue) {
    return CardModel(
      value: cardValue,
      image: image,
    );
  }


  bool _isGameOver() {
    List<CardModel> _checkCards = [];
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].image == 'assets/images/minesweeper/diamond.png') {
        _checkCards.add(cards[i]);
      }
    }
    return _checkCards.every((card) => card.state == CardState.guessed);
  }

  int endTime() {
    final int levelCountdownTimer =
        widget.level.minutes * 60 * 1000 + widget.level.seconds * 1000;
    final int timeLeft = levelCountdownTimer -
        (DateTime.now().millisecondsSinceEpoch - startGameTime);
    return DateTime.now().millisecondsSinceEpoch + timeLeft;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/background-4.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeButton(),
                    SettingsButton(),
                    Spacer(flex: 3),
                    CountdownTimer(
                      textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      endTime: endTime(),
                      onEnd: () {
                        context.router.popAndPush(LostRoute(
                            gameType: GameType.minesweeper,
                            level: widget.level,
                            lostType: LostType.timeIsOver));
                      },
                    ),
                    Spacer(flex: 1),
                    ScoresPanel(),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: GridView.builder(
                    itemCount: cards.length,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return CardWidget(
                        index: index,
                        card: cards[index],
                        onCardPressed: onCardPressed,
                      );
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
