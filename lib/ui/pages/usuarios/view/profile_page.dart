import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../routes/router.gr.dart';
import '../../auth/view/login_page.dart';
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
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/logo/logo.png"),
                ),
                Text(_authMobx.user?.nombre ?? ''),
                Text(
                  _authMobx.user?.apellido ?? '',
                  style: const TextStyle(fontSize: 20),
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
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
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
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
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
    );
  }

  void _signOut() async {
   // await FirebaseAuth.instance.signOut().then((value) =>    (route) => false))
  }
}
