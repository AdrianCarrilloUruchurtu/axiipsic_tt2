import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import '../../../../auth/model/user_data.dart';
import '../../calendar/view-model/calendar_mobx.dart';
import 'package:http/http.dart' as http;

class SesionesAdd extends StatefulWidget {
  const SesionesAdd({super.key, required this.doc});

  final UserData? doc;

  @override
  State<SesionesAdd> createState() => _SesionesAddState();
}

class _SesionesAddState extends State<SesionesAdd> {
  String id = "uno";
  late String _selectedTime;
  late DateTime _eventDate;
  late final _sesionesMobx = SesionesStore(widget.doc!.email);
  final _calendarMobx = getIt.get<CalendarStore>();

  final TextEditingController _dateInput = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
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
        .doc(widget.doc?.id)
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
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _titleController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              labelText: 'Título de la sesión',
                              icon: Icon(Icons.title)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _descriptionController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              labelText: 'Descripción',
                              icon: Icon(Icons.description)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          onTap: _timeDialog,
                          textAlign: TextAlign.center,
                          controller: _timeController,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.punch_clock),
                              hintText: "Horario de la sesión"),
                          readOnly: true,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _dateInput,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Día de la sesión"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyy').format(pickedDate);
                              setState(() {
                                _eventDate = pickedDate;
                                _dateInput.text = formattedDate;
                              });
                            } else {
                              const SnackBar(
                                content: Text("La fecha no fue seleccionada"),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          sendPushMessage(_descriptionController.text, "Recordatorio de cita");
          _sesionesMobx.crearSesion(
              [widget.doc!.email, widget.doc!.psicMail],
              _titleController.text,
              _descriptionController.text,
              _dateInput.text,
              widget.doc!.id,
              _selectedTime);
          _calendarMobx.crearEventoPaciente(_eventDate, _titleController.text,
              _descriptionController.text, _selectedTime, widget.doc!.id, "");
          _calendarMobx.crearEvento(_eventDate, _titleController.text,
              _descriptionController.text, _selectedTime, widget.doc!.nombre);
          context.router.pop();
        }),
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<void> _timeDialog() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        cancelText: "Cancelar",
        helpText: "Hora");
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

// Appbar
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.router.pop();
                },
              ));
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
//❤️