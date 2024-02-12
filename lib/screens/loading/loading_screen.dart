import 'dart:async';

import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      context.router.push(const OnboardingRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/background-1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Ancient excavations'.toUpperCase(),
                  style: TextStyle(color: AppColors.yellow, fontSize: 56, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 2000,
                    lineHeight: 4.0,
                    percent: 1.0,
                    backgroundColor: Colors.white60,
                    progressColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
