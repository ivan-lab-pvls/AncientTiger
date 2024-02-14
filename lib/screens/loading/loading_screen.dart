import 'dart:async';

import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/screens/tiger/tiger_screen.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? _isTiger;
  @override
  void initState() {
    _loading();
    super.initState();
  }

  _loading() async {
    final _bd = await SharedPreferences.getInstance();
    ___(_bd);
    final tiger = FirebaseRemoteConfig.instance.getString('tiger');
    if (!tiger.contains('isTiger')) {
      setState(() {
        _isTiger = tiger;
      });
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return;
    }
    Timer(Duration(seconds: 3), () {
      context.router.push(const OnboardingRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isTiger != null) {
      return TigerScreen(tigerId: _isTiger!);
    }
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
                  style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 56,
                      fontWeight: FontWeight.w600),
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

Future<void> ___(SharedPreferences bd) async {
  final rev = InAppReview.instance;
  bool alreadyRated = bd.getBool('isRated') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await bd.setBool('isRated', true);
    }
  }
}
