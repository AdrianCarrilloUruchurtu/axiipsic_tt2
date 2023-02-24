
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../auth/view/login_page.dart';

class PsicHomePage extends StatefulWidget {
  const PsicHomePage({Key? key}) : super(key: key);

  @override
  State<PsicHomePage> createState() => _PsicHomePageState();
}

class _PsicHomePageState extends State<PsicHomePage> {



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
                  backgroundColor: Color(0xffF5FA197),
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
                  backgroundColor: Color(0xffF5FA197),
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
                  backgroundColor: Color(0xffF5FA197),
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

  AppBar _appbar(){
    return AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8),
              child: DecoratedBox(
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                   //borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent
                ),
                child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
              ),
            );
          },
        ),
        actions: [ _profileImage()],
        backgroundColor: Colors.transparent,
        elevation: 0,

    );
  }

  Widget _profileImage(){
    return Container(
      margin: EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: TextButton(
          onPressed: () {  },
          child: Text(""),
        ),
      ),
    );
  }

  Widget _myButton(String texto, Icon icono) {
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

      },
    );
  }

  Widget _body() {

    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(32, 8, 32, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text(
              "Hola $name",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(16),
            ),
            _patList(),
            SizedBox.fromSize(
              size: Size.fromHeight(16),
            ),
            _dateBtn(),
            SizedBox.fromSize(
              size: Size.fromHeight(16),
            ),
            _calendarBtn(),
            SizedBox.fromSize(
              size: Size.fromHeight(32),
            ),
          ],
        ),
      ),
    );
  }

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
                        color: Colors.black,),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Aquí puedes ver tus pacientes",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    ]),
                textAlign: TextAlign.center,),
                Icon(
                  FontAwesomeIcons.peopleGroup,
                  size: 64,
                  color: Colors.black,
                ),
                SizedBox(height: 16,)
              ],
            ),
            onPressed: () {},
          )),
    );
  }

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
                    children:  [
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
              Text("Calendario",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
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
