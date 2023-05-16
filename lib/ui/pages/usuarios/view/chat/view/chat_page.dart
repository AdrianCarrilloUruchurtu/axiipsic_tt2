import 'dart:convert';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/view-model/chat_mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import '../view-model/message_mobx.dart';

class ChatPage extends StatefulWidget {
  final UserData? user;
  final UserData? friendUser;
  final String friendId;
  final String friendName;

  const ChatPage({
    super.key,
    required this.user,
    required this.friendId,
    required this.friendName,
    this.friendUser,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final authMobx = getIt.get<AuthMobx>();
  final chatMobx = getIt.get<ChatStore>();
  late final messageMobx = MessageStore(widget.friendId);
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initInfo();
  }

  initInfo() {
    var androidInitialize = const AndroidInitializationSettings('@mipmap/logo');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {
        try {
          if (details.payload != null && details.payload!.isNotEmpty) {
          } else {}
        } catch (e) {
          if (kDebugMode) {
            print('error');
          }
        }
        return;
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('............onMessage.......');
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}");

      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: notification.title,
          htmlFormatContentTitle: true);

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('testId', 'testname',
              importance: Importance.high,
              styleInformation: bigTextStyleInformation,
              priority: Priority.high,
              playSound: true);

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        1, message.notification?.title, message.notification?.body,
        platformChannelSpecifics,
        //payload: message.data['body'] //esto es para navegar entre pantallas?
      );
    });
  }

  // getFriendToken() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(widget.friendId)
  //       .get();

  //   String token = snap['token'];
  //   print("Friend token: $token");
  // }

  sendPushMessage(String body, String title) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.friendId)
        .get();

    String token = snap['token'];

    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAAQsaSo4c:APA91bGOVRLzybqlA1qN5PcXQx2U4mPwAfI1WhlNbdzDzRfkGrfSizJEVpe-wdPYCF86ZPz8saZRTJinyNz35ilfiF4ZQ4viP-BJVPWq86Pft3ucTeXmlqpKE1MwOmGC51xlZe_f8yZu'
          },
          body: jsonEncode(<String, dynamic>{
            'priority': 'high',
            //The data param is for the onclick method for the notification
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "axiipsic"
            },
            "to": token,
          }));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Container(
                margin: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              elevation: 0,
              title: Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(80),
                  //   child: CachedNetworkImage(
                  //     imageUrl: friendImage,
                  //     placeholder: (conteext, url) =>
                  //         const CircularProgressIndicator(),
                  //     errorWidget: (context, url, error) => const Icon(
                  //       Icons.error,
                  //     ),
                  //     height: 40,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.friendName,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
            ),
            body: Chat(
              l10n: const ChatL10nEn(
                  inputPlaceholder: 'Mensaje',
                  emptyChatPlaceholder: 'Aún no hay mensajes'),
              theme: const DefaultChatTheme(
                  receivedMessageBodyBoldTextStyle:
                      TextStyle(color: Colors.blueAccent),
                  receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                  primaryColor: Colors.blueAccent,
                  secondaryColor: Color.fromARGB(255, 241, 237, 237),
                  inputTextColor: Colors.black,
                  inputBackgroundColor: Colors.white,
                  emptyChatPlaceholderTextStyle: TextStyle()),
              inputOptions: const InputOptions(
                  sendButtonVisibilityMode: SendButtonVisibilityMode.always),
              messages: messageMobx.chatMessages != null
                  ? messageMobx.chatMessages!
                      .map((e) => types.TextMessage(
                            author: types.User(id: e.senderId),
                            id: Random().toString(),
                            text: e.message,
                          ))
                      .toList()
                  : [],
              onSendPressed: (p0) {
                sendPushMessage(p0.text, widget.user!.nombre);
                messageMobx.onSavedMessage(
                    widget.friendId, p0.text, widget.friendName);
              },
              user: types.User(id: FirebaseAuth.instance.currentUser!.uid),
            )));
  }
}
