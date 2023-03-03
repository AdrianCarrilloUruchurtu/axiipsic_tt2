import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
