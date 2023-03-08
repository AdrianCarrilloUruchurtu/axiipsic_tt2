import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../auth/view_model/auth_mobx.dart';

class PatHomePage extends StatefulWidget {
  const PatHomePage({Key? key}) : super(key: key);

  @override
  State<PatHomePage> createState() => _PatHomePageState();
}

class _PatHomePageState extends State<PatHomePage> {
  final AuthMobx _authMobx = getIt.get<AuthMobx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlue.shade200,
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: () {},
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
                  backgroundColor: Colors.lightBlue.shade200,
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlue.shade200,
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: () {},
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
      bottomNavigationBar: _bottomAppBar(),
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
          ListTile(
            title: const Text(
              "Salir",
              style: TextStyle(fontSize: 24, color: Colors.redAccent),
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
  Widget _myButton(String texto, Icon icono, ruta) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue.shade100,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            texto,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          icono
        ],
      ),
      onPressed: () {
        context.pushRoute(const AyudaRoute());
      },
    );
  }

// Body del scaffold
  Widget _body() {
    String nombre = _authMobx.user?.nombre ?? '';
    return SafeArea(
      child: Container(
        //padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                    '/progressPage'),
                _myButton(
                    'Notas',
                    const Icon(
                      FontAwesomeIcons.noteSticky,
                      size: 56,
                      color: Colors.black,
                    ),
                    context.pushRoute(const MainNotes())),
                _myButton(
                    'Tareas',
                    const Icon(
                      FontAwesomeIcons.listCheck,
                      size: 56,
                      color: Colors.black,
                    ),
                    '/tareas'),
                _myButton(
                    'Próxima cita',
                    const Icon(
                      FontAwesomeIcons.solidBell,
                      size: 56,
                      color: Colors.black,
                    ),
                    '/citas'),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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
            context.pushRoute(const ProgressRoute());
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
              FontAwesomeIcons.calendarDay,
              size: 60,
              color: Colors.black,
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  //Sign out function
  void _signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => AutoRouter.of(context).pushNamed('/'));
  }

// Appbar de navegación inferior, su uso realmente es hacer espacio
  Widget _bottomAppBar() {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: Colors.black,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
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
