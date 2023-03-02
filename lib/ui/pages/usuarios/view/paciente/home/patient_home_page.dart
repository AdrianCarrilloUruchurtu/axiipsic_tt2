
import 'package:axiipsic_tt2/ui/pages/auth/view/login_page.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../view_model/datos_usuario.dart';

class PatHomePage extends StatefulWidget {
  const PatHomePage({Key? key}) : super(key: key);

  @override
  State<PatHomePage> createState() => _PatHomePageState();
}

class _PatHomePageState extends State<PatHomePage> {

  final GetUserData _usuarioNombre = GetUserData();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usuarioNombre.usuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  child: Icon(FontAwesomeIcons.house),
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
                  child: Icon(Icons.add),
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
                  child: Icon(FontAwesomeIcons.noteSticky),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: _appbar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [Icon((Icons.person_add_alt_1_outlined))],
            )),
            ListTile(
              title: Text("Salir"),
              onTap: () {
                  _signOut();
              },
              selected: true,
            )
          ],
        ),
      ),
      body: _body(),
    );
  }

  PreferredSizeWidget _appbar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(35),
      child: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                  color: Colors.blueAccent
              ),
              child: SizedBox(
                width: 32,
                height: 32,
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                ),
              ),
            );
          },
        ),
        actions: [ _profileImage()],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  Widget _profileImage(){
    return CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/profilePage');
        },
        child: Text(""),
      ),
    );
  }

  Widget _myButton(String texto, Icon icono, ruta) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade900,
        alignment: Alignment.center,
        shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(texto, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          icono
        ],
      ),
      onPressed: (){
        Navigator.of(context).pushNamed(ruta);
      },
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        //padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _usuarioNombre.usuario(),
            SizedBox.fromSize(
              size: Size.fromHeight(8),
            ),
            _therapyBtn(),
            SizedBox.fromSize(
              size: Size.fromHeight(8),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: (1 / 1),
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
                        size: 60,
                      ),
                      '/progressPage'),
                  _myButton(
                      'Notas',
                      const Icon(
                        FontAwesomeIcons.noteSticky,
                        size: 60,
                      ),
                      '/notas'),
                  _myButton(
                      'Tareas',
                      Icon(
                        FontAwesomeIcons.listCheck,
                        size: 60,
                      ),
                      '/tareas'),
                  _myButton(
                      'Próxima cita',
                      Icon(
                        FontAwesomeIcons.solidBell,
                        size: 60,
                      ),
                      '/citas'),
                ],
              ),
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(5),
            ),
            _calendarBtn(),
            SizedBox.fromSize(
              size: Size.fromHeight(30),
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
              backgroundColor: Color(0xff078956),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text.rich(TextSpan(
                  text: "Progreso de Terapia\n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Aquí puedes ver tus avances \n en la terapia",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            fontWeight: FontWeight.normal)),
                  ])),
              Icon(
                FontAwesomeIcons.chartLine,
                size: 50,
              )
            ],
          ),
          onPressed: () {},
        ));
  }

  //Widget para el boton del calendario
  Widget _calendarBtn() {
    return SizedBox(
      width: 370,
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff078956),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Calendario",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            Icon(
              FontAwesomeIcons.calendarDay,
              size: 60,
            )
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  //Deprecated bottom bar
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

  //Sign out function
  void _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()), (
            route) => false));
  }

}
