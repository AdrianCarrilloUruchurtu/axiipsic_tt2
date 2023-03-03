import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/services/global_method.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view_model/datos_usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/view/login_page.dart';

class PsicHomePage extends StatefulWidget {
  const PsicHomePage({Key? key}) : super(key: key);

  @override
  State<PsicHomePage> createState() => _PsicHomePageState();
}

class _PsicHomePageState extends State<PsicHomePage> {
  var nombre = '';

// Obtener el nombre del usuario

  Future getUserData() async {
    final DocumentSnapshot userDoc = (await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get());

    setState(() {
      nombre = userDoc.get('nombre');
    });
  }

  GetUserData _usuarioNombre = GetUserData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: const Color(0xfff5fa197),
                  child: const Icon(
                    FontAwesomeIcons.house,
                    size: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: Color(0xffF5FA197),
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: Color(0xffF5FA197),
                  child: const Icon(
                    FontAwesomeIcons.noteSticky,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: _appbar(),
      drawer: _drawer(),
      body: _body(),
    );
  }

  // Drawer
  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: const [Icon((Icons.person_add_alt_1_outlined))],
          )),
          ListTile(
            title: const Text("Salir"),
            onTap: () {
              _signOut();
            },
            selected: true,
          )
        ],
      ),
    );
  }

  // Barra de navegación superior
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent),
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
      actions: [_profileImage()],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Botón del perfil en la parte superior derecha
  Widget _profileImage() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/profilePage');
          },
          child: const Text(""),
        ),
      ),
    );
  }

  // Botón obsoleto
  Widget _myButton(String texto, Icon icono) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade900,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            texto,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          icono
        ],
      ),
      onPressed: () {},
    );
  }

  //Widget para el cuerpo del Scaffold
  Widget _body() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _usuarioNombre.usuario(),
            SizedBox.fromSize(
              size: const Size.fromHeight(8),
            ),
            _patList(),
            SizedBox.fromSize(
              size: const Size.fromHeight(16),
            ),
            _dateBtn(),
            SizedBox.fromSize(
              size: const Size.fromHeight(16),
            ),
            _calendarBtn(),
            SizedBox.fromSize(
              size: const Size.fromHeight(52),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para el botón de lista de pacientes
  Widget _patList() {
    return Expanded(
      child: SizedBox(
          width: 370,
          height: 90,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC0EAE2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text.rich(
                  TextSpan(
                      text: "Lista de pacientes\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Aquí puedes ver tus pacientes",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                      ]),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  FontAwesomeIcons.peopleGroup,
                  size: 64,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/listPage');
            },
          )),
    );
  }

  // Widget para el botón de próxima cita
  Widget _dateBtn() {
    return Expanded(
      child: SizedBox(
          width: 370,
          height: 90,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC0EAE2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Container(
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.calendarDay,
                    size: 80,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(
                              FontAwesomeIcons.solidBell,
                              size: 16,
                            )),
                      ),
                      const Text.rich(TextSpan(
                          text: "Próxima cita\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Jueves 07/Enero/2060",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ])),
                    ],
                  ),
                ],
              ),
            ),
            onPressed: () {},
          )),
    );
  }

  // Widget para el botón del calendario
  Widget _calendarBtn() {
    return Expanded(
      child: SizedBox(
        width: 370,
        height: 90,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffC0EAE2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Calendario",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Icon(
                FontAwesomeIcons.calendarDays,
                size: 80,
                color: Colors.black,
              )
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  // Función para SignOut
   void _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) =>
        AutoRouter.of(context).pushNamed('/'));
  }

  // Obsoleto para la barra de navegación inferior
  Widget _bottomAction(IconData icon, callback) {
    return Container(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(icon),
        ),
        onTap: callback,
      ),
    );
  }
}
