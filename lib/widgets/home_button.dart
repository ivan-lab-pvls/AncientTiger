import 'package:ancient_excavations_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.popAndPush(LobbyRoute());
      },
      child: Image.asset(
        'assets/images/elements/home-button.png',
      ),
    );
  }
}
