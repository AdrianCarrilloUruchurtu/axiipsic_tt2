import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthMobx _authMobx = getIt.get<AuthMobx>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appbar(),
        body: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(tag: 'profile', child: _profileImage(90)),
                  Text(
                    _authMobx.user?.nombre ?? '',
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    _authMobx.user?.apellido ?? '',
                    style: const TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 200,
                    child: Divider(
                      color: Colors.teal[100],
                    ),
                  ),
                  Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.teal[900],
                        ),
                        title: const Text(
                          "Habilitar notificaciones",
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                  Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.personArrowDownToLine,
                          color: Colors.teal[900],
                        ),
                        title: const Text(
                          "Codigo del psicólogo",
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _signOut();
                      },
                      child: const Text("Cerrar sesión"))
                ],
              ),
            ),
          ),
        ),
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
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.popRoute();
                },
              ));
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Imagen del perfil del usuario
  Widget _profileImage(double? size) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.grey.shade800,
        child: TextButton(
          onPressed: () {},
          child: const Text(""),
        ),
      ),
    );
  }

  void _signOut() async {
    // await FirebaseAuth.instance.signOut().then((value) =>    (route) => false))
  }
}
