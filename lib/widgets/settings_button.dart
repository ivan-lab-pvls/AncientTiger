import 'package:ancient_excavations_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.popAndPush(SettingsRoute());
      },
      child: Image.asset(
        'assets/images/elements/settings-button.png',
      ),
    );
  }
}
