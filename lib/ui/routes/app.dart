import 'package:axiipsic_tt2/main.dart';
import 'package:axiipsic_tt2/ui/routes/ispat_guard.dart';
import 'package:axiipsic_tt2/ui/routes/ispsic_guard.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
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
    @override
    void initState() {
      super.initState();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                  android: AndroidNotificationDetails(channel.id, channel.name,
                      color: Colors.blue,
                      playSound: true,
                      icon: ' "assets/logo/logo.png"')));
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessagedOpenApp event was published!');
        RemoteNotification notification = message.notification!;
        AndroidNotification android = message.notification!.android!;
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text(notification.body!)],
                )),
              );
            }));
      });
    }

    void showNotification() {
      flutterLocalNotificationsPlugin.show(
          0,
          'testing',
          'How you doin?',
          NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description,
                  importance: Importance.high,
                  color: Colors.blue,
                  playSound: true,
                  icon: "assets/logo/logo.png")));
    }

    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
