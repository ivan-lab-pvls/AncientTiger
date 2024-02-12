import 'dart:async';

import 'package:ancient_excavations_app/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardModel card;
  final int index;
  final ValueChanged<int> onCardPressed;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _handleCardTap() {
    if (widget.card.state == CardState.hidden) {
      Timer(const Duration(milliseconds: 100), () {
        widget.onCardPressed(widget.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleCardTap,
      child: Center(
          child: widget.card.state == CardState.hidden
              ? SvgPicture.asset(
                  'assets/images/elements/game-card-close.svg',
                  width: 75,
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      widget.card.image ==
                              'assets/images/minesweeper/diamond.png'
                          ? 'assets/images/elements/game-card-open.svg'
                          : 'assets/images/elements/game-card-bomb.svg',
                      width: 75,
                    ),
                    Image.asset(
                      widget.card.image,
                      width: 40,
                    )
                  ],
                )),
    );
  }
}
