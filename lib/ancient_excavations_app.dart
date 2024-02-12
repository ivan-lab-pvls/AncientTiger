import 'package:ancient_excavations_app/router/router.dart';
import 'package:flutter/material.dart';

class AncientExcavationsApp extends StatelessWidget {
  AncientExcavationsApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Gentium Basic'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
