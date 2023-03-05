import 'package:axiipsic_tt2/ui/routes/ispat_guard.dart';
import 'package:axiipsic_tt2/ui/routes/ispsic_guard.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'guest_guard.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter(
      checkIfUserIsGuest: CheckIfUserIsGuest(),
      checkIfUserIsPsic: CheckIfUserIsPsic(),
      checkIfUserIsPat: CheckIfUserIsPat());

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
