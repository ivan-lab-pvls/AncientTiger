import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ActionButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/elements/action-button.svg',
          ),
          Text(
            text,
            style: TextStyle(color: AppColors.brown, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
