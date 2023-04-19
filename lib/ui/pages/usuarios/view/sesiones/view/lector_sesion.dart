import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart';
import 'package:flutter/material.dart';

import '../../../../../../style/app_style.dart';
import '../model/sesiones_model.dart';

class LectorSesPage extends StatefulWidget {
  const LectorSesPage({super.key, this.docSes});

  final SesionesData? docSes;
  @override
  State<LectorSesPage> createState() => _LectorSesPageState();
}

class _LectorSesPageState extends State<LectorSesPage> {
  final _sesionMobx = getIt.get<SesionesStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final delete = await showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Eliminar Nota"),
                content:
                    const Text("¿Estás seguro que deseas eliminar la nota?"),
                actions: [
                  TextButton(
                    onPressed: () => context.router.pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text("Si"),
                  ),
                ],
              ),
            );

            // Cambiar también
            if (delete ?? false) {}
          },
          child: const Icon(Icons.delete)),
      appBar: _appbar(),
      body: _body(),
    );
  }

// Appbar
  AppBar _appbar() {
    int numSes = widget.docSes!.id;
    return AppBar(
        title: Text(
          "Sesión $numSes",
          style: AppStyle.mainTitle,
          textAlign: TextAlign.center,
        ),
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
                    context.router.pop();
                  },
                ));
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 130, 0),
            color: Colors.black,
            height: 1.0,
          ),
        ));
  }

  Widget _body() {
    int numSes = widget.docSes!.id;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: 290,
          //   height: 40,
          //   margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          //   decoration: BoxDecoration(
          //       color: Colors.brown.shade300,
          //       borderRadius: BorderRadius.circular(20)),
          //   child: Center(
          //     child: Text(
          //       "Sesión $numSes",
          //       style: const TextStyle(
          //           color: Colors.white,
          //           fontSize: 22.0,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            child: Column(
              children: [
                btn("Placeholder", Icons.calendar_month, (() {}), 1),
                btn("Placeholder", Icons.check_box, (() {}), 2),
                btn("Placeholder", Icons.tips_and_updates, (() {}), 3),
                btn("Placeholder", Icons.meeting_room, (() {}), 7),
                btn("Placeholder", Icons.book, (() {}), 5),
                btn("Placeholder", Icons.history, (() {}), 6),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget btn(String texto, IconData? icono, Function()? onTap, int colorid) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 75, 176, 223),
          borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: AppStyle.iconColors[colorid],
              borderRadius: BorderRadius.circular(16)),
          child: Icon(
            icono,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          texto,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_right_sharp,
          color: Colors.pink.shade50,
          size: 50,
        ),
        onTap: onTap,
      ),
    );
  }
}
