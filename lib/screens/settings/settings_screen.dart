import 'package:ancient_excavations_app/screens/games/minesweeper/difficulty/minesweeper_difficulty_screen.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/scores/scores_panel.dart';
import 'package:ancient_excavations_app/widgets/home_button.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/background-3.png"),
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
                    Spacer(flex: 3),
                    Text(
                      'settings'.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(flex: 1),
                    ScoresPanel(),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 230,
                  width: 380,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/elements/card.png'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Terms(
                                    data:
                                        'https://docs.google.com/document/d/1dPCWHbO5rzf6glNK2zfM76uoRcbHv27p3PKxoZPsOYw/edit?usp=sharing'),
                              ));
                            },
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  color: AppColors.brown,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                               Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Terms(
                                    data:
                                        'https://docs.google.com/document/d/1ahz_6bTYZweD8cGbdUrhf090yPTOpwJReVwEIANJCl4/edit?usp=sharing'),
                              ));
                            },
                            child: Text(
                              'Terms of use',
                              style: TextStyle(
                                  color: AppColors.brown,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              InAppReview.instance.openStoreListing(appStoreId: '6477779041');
                            },
                            child: Text(
                              'Rate app',
                              style: TextStyle(
                                  color: AppColors.brown,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment(0.85, -0.9),
                        child: TextButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: AppColors.brown,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
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
