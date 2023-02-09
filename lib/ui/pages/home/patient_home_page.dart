
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatHomePage extends StatefulWidget {
  const PatHomePage({Key? key}) : super(key: key);

  @override
  State<PatHomePage> createState() => _PatHomePageState();
}

class _PatHomePageState extends State<PatHomePage> {
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
              title: Text("Home"),
              onTap: () {},
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
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
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
        onPressed: () {  },
        child: Text(""),
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Hola Adrian",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(5),
            ),
            _therapyBtn(),
            SizedBox.fromSize(
              size: Size.fromHeight(20),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: (1 / .7),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                children: [
                  _myButton('Línea de ayuda', Icon(FontAwesomeIcons.heartPulse,size: 60,)),
                  _myButton('Notas',Icon(FontAwesomeIcons.noteSticky,size: 60,)),
                  _myButton('Tareas', Icon(FontAwesomeIcons.listCheck,size: 60,)),
                  _myButton('Próxima cita', Icon(FontAwesomeIcons.solidBell,size: 60,)),
                ],
              ),
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(5),
            ),
            _calendarBtn(),
            SizedBox.fromSize(
              size: Size.fromHeight(22),
            ),
          ],
        ),
      ),
    );
  }

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
