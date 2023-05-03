import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../routes/router.gr.dart';
import '../../../../auth/view_model/auth_mobx.dart';
import 'nota_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final _notaMobx = NotaStore("");
  final AuthMobx _authMobx = getIt.get<AuthMobx>();
  Color flBtnColor = Colors.lightBlue.shade200;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
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
                    backgroundColor: flBtnColor,
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
                    onPressed: () =>
                        context.pushRoute(NotaEditRoute(isses: "")),
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
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: ((context, index) =>
                          Builder(builder: (BuildContext context) {
                            return _notaMobx.notaList?[index] != null
                                ? NotaCard(_notaMobx.notaList![index],
                                    onTap: () => context.router.push(
                                          LectorRoute(
                                              doc: _notaMobx.notaList![
                                                  index]), // pedir ayuda
                                        ))
                                : const Center(
                                    child: CircularProgressIndicator());
                          })),
                      itemCount: _notaMobx.notaList?.length.toInt()),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _bottomAppBar(),
      ),
    );
  }

// Appbar
  AppBar _appbar() {
    String nombre = _authMobx.user!.nombre;
    return AppBar(
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: nombre != "" ? Text(
          "Notas de $nombre",
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ) : const Center(child: CircularProgressIndicator(),)
      ),
      centerTitle: true,
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
      actions: [_profileImage(30)],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Drawer obsoleto?
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
