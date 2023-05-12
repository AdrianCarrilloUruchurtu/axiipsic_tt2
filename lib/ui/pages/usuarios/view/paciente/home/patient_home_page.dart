import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../auth/view_model/auth_mobx.dart';
import '../../historia_clinica.dart/view_model/historia_mobx.dart';

class PatHomePage extends StatefulWidget {
  const PatHomePage({Key? key}) : super(key: key);

  @override
  State<PatHomePage> createState() => _PatHomePageState();
}

class _PatHomePageState extends State<PatHomePage> {
  final AuthMobx _authMobx = getIt.get<AuthMobx>();
  late final historiaMobx =
      HistoriaStore(FirebaseAuth.instance.currentUser!.uid);

  String? mtoken = "";
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    requestPermission();
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
        } catch (e) {}
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

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or hasnt granted permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: _appbar(),
        drawer: _drawer(),
        body: _body(),
        //bottomNavigationBar: _bottomAppBar(),
      ),
    );
  }

  // Appbar
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(30),
                color: Colors.cyan,
              ),
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ),
          );
        },
      ),
      actions: [_profileImage(30)],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Drawer
  Widget _drawer() {
    bool isCompleted = false;

    if (historiaMobx.historia != null) {
      if (historiaMobx.historia?.isCompleted == false) {
        setState(() {
          isCompleted = true;
        });
      }
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Hero(
                tag: 'profile',
                child: _profileImage(120),
              ),
            ],
          )),
          Visibility(
            visible: historiaMobx.historia!.isCompleted,
            child: ListTile(
              title: const Text(
                "Completa tu perfil",
                style: TextStyle(fontSize: 24, color: Colors.blueAccent),
              ),
              onTap: () {
                context.router.push(const FillHistoriaRoute());
              },
              selected: true,
            ),
          ),
          ListTile(
            title: const Text(
              "Escoge tu psicólogo",
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            onTap: () {
              context.router.push(const ListPsicRoute());
            },
            selected: true,
          ),
          ListTile(
            title: const Text(
              "Tips",
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            onTap: () {
              context.router.push(TipsRoute(doc: _authMobx.user));
            },
            selected: true,
          ),
          ListTile(
            title: const Text(
              "Chat",
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            onTap: () {
              context.router.push(ChatMainRoute(user: _authMobx.user));
            },
            selected: true,
          ),
          ListTile(
            title: const Text(
              "Salir",
              style: TextStyle(fontSize: 22, color: Colors.redAccent),
            ),
            onTap: () {
              _signOut();
            },
            selected: true,
          )
        ],
      ),
    );
  }

  // Imagen del perfil del usuario
  Widget _profileImage(double? size) {
    return Container(
      height: size,
      margin: const EdgeInsets.all(8),
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.grey.shade800,
        child: TextButton(
          onPressed: () {
            context.pushRoute(const ProfileRoute());
          },
          child: const Text(""),
        ),
      ),
    );
  }

// Botones del gridview
  Widget _myButton(String texto, Icon icono, Function ruta) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue.shade100,
          alignment: Alignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              texto,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            icono
          ],
        ),
        onPressed: () {
          ruta();
        },
      ),
    );
  }

// Body del scaffold
  Widget _body() {
    String nombre = _authMobx.user?.nombre ?? '';
    return SafeArea(
      child: Container(
        //padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
        margin: const EdgeInsets.only(left: 20, right: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Hola, $nombre",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(0),
            ),
            _therapyBtn(),
            SizedBox.fromSize(
              size: const Size.fromHeight(0),
            ),
            GridView.count(
              childAspectRatio: (1 / 0.7),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              children: [
                _myButton(
                    'Línea de ayuda',
                    const Icon(
                      FontAwesomeIcons.heartPulse,
                      size: 56,
                      color: Colors.black,
                    ),
                    () => context.pushRoute(const AyudaRoute())),
                _myButton(
                    'Notas',
                    const Icon(
                      FontAwesomeIcons.noteSticky,
                      size: 56,
                      color: Colors.black,
                    ),
                    () => context.pushRoute(const NotesRoute())),
                _myButton(
                    'Tareas',
                    const Icon(
                      FontAwesomeIcons.listCheck,
                      size: 56,
                      color: Colors.black,
                    ),
                    () =>
                        context.router.push(TareasRoute(doc: _authMobx.user))),
                _myButton(
                    'Próxima cita',
                    const Icon(
                      FontAwesomeIcons.solidBell,
                      size: 56,
                      color: Colors.black,
                    ),
                    () => '/citas'),
              ],
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(0),
            ),
            _calendarBtn(),
            SizedBox.fromSize(
              size: const Size.fromHeight(5),
            ),
          ],
        ),
      ),
    );
  }

  //Widget para el botón del progreso de la terapia

  Widget _therapyBtn() {
    return SizedBox(
        width: 370,
        height: 90,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(
                  text: "Progreso de Terapia\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Aquí puedes ver tus avances \n en la terapia",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ])),
              Icon(
                FontAwesomeIcons.chartLine,
                size: 50,
                color: Colors.black,
              )
            ],
          ),
          onPressed: () {
            context.pushRoute(SesionesRoute(
                doc: _authMobx
                    .user)); //¿Cómo sé en qué lugar está? Hacer builder ?
          },
        ));
  }

  //Widget para el boton del calendario
  Widget _calendarBtn() {
    return SizedBox(
      width: 370,
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calendario",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Icon(
              FontAwesomeIcons.calendarDay,
              size: 60,
              color: Colors.black,
            )
          ],
        ),
        onPressed: () {
          context.router.push(const CalendarRoute());
        },
      ),
    );
  }

  //Sign out function
  void _signOut() async {
    _authMobx.signOut();
    context.router.popAndPush(const LoginRoute());
  }

// Appbar de navegación inferior, su uso realmente es hacer espacio
  Widget _bottomAppBar() {
    return const BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: Colors.black,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Casa",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
