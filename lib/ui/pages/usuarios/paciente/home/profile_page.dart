import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../auth/view/login_page.dart';
import '../../view_model/datos_usuario.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GetUserData _nombreApellido = GetUserData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
          icon: Icon(
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
                  backgroundImage: AssetImage(
                  "assets/logo/logo.png"),
                ),
                _nombreApellido.nombreApellido(),
                _nombreApellido.correo(),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.bell,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        "Habilitar notificaciones",
                        style: TextStyle(
                            fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
                Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.personArrowDownToLine,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        "Codigo del psicólogo",
                        style: TextStyle(
                            fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
                ElevatedButton(onPressed: (){_signOut();}, child: Text("Cerrar sesión"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()), (
            route) => false));
  }
}