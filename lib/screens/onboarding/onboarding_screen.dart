import 'dart:ffi';

import 'package:ancient_excavations_app/router/router.dart';
import 'package:ancient_excavations_app/theme/colors.dart';
import 'package:ancient_excavations_app/widgets/action_button_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int i = 0;
  final List<String> _dialogs = [
    'Roar! Salutations, aspiring adventurer! I am Tut, a curious archaeologist tiger from the sands of ancient Egypt. Welcome to our grand expedition! Exciting levels and ancient marvels await you here. Are you ready to embark on an adventure alongside a tiger archaeologist?',
    'Our journey through ancient Egypt is laden with mysteries waiting to be unearthed! Seek out bomb matches to safeguard our archaeological finds. But beware, they lurk within the sands, and every move counts! Ready to solve puzzles and preserve the treasures of Egypt?',
    'Wonderful, companion! Together, we shall conquer the sands of time. Prepare for an extraordinary expedition through the ancient lands of Egypt, where incredible adventures and ancient discoveries await! Let us commence this journey, and remember – we are bound by the threads of history, intrepid explorer!',
  ];

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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/elements/tiger.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardYellow,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Tiger'.toUpperCase(),
                            style: TextStyle(
                                color: AppColors.brown,
                                fontSize: 28,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              _dialogs[i],
                              style: TextStyle(
                                  color: AppColors.darkBrown,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ActionButtonWidget(
                    text: 'Continue',
                    onTap: () {
                      if (i == 2) {
                        context.router.push(LobbyRoute());
                      } else {
                        setState(() {
                          i++;
                        });
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
