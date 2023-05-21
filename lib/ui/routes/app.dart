import 'package:axiipsic_tt2/ui/routes/ispat_guard.dart';
import 'package:axiipsic_tt2/ui/routes/ispsic_guard.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'guest_guard.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  
  final appRouter = AppRouter(
      checkIfUserIsGuest: CheckIfUserIsGuest(),
      checkIfUserIsPsic: CheckIfUserIsPsic(),
      checkIfUserIsPat: CheckIfUserIsPat());

  

  @override
  Widget build(BuildContext context) {
    
    // void showNotification() {
    //   flutterLocalNotificationsPlugin.show(
    //       0,
    //       'testing',
    //       'How you doin?',
    //       NotificationDetails(
    //           android: AndroidNotificationDetails(channel.id, channel.name,
    //               channelDescription: channel.description,
    //               importance: Importance.high,
    //               color: Colors.blue,
    //               playSound: true,
    //               icon: "assets/logo/logo.png")));
    // }

    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
