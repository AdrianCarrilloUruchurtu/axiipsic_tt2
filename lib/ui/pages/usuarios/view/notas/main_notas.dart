import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/editor_nota.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/nota_card.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../routes/router.gr.dart';

class MainNotes extends StatefulWidget {
  const MainNotes({super.key});

  @override
  State<MainNotes> createState() => _MainNotesState();
}

class _MainNotesState extends State<MainNotes> {
  final _notaMobx = getIt.get<NotaStore>();
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotaEditPage()));
                  },
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _notaMobx.notaList != null
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: ((context, index) =>
                        NotaCard(_notaMobx.notaList![index])),
                    itemCount: _notaMobx.notaList?.length)
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

// Appbar
  AppBar _appbar() {
    return AppBar(
      title: const Text("Notas de nombre"),
      centerTitle: true,
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
              //  _signOut();
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
