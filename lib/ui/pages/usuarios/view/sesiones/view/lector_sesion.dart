import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../../../style/app_style.dart';
import '../model/sesiones_model.dart';

class LectorSesPage extends StatefulWidget {
  const LectorSesPage({super.key, required this.docSes, required this.docPac});
  final UserData? docPac;
  final SesionesData docSes;
  @override
  State<LectorSesPage> createState() => _LectorSesPageState();
}

class _LectorSesPageState extends State<LectorSesPage> {
  late final _sesionMobx = SesionesStore(widget.docPac!.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final delete = await showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Eliminar Sesión"),
                content:
                    const Text("¿Estás seguro que deseas eliminar la sesión?"),
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
            if (delete ?? false) {
              _sesionMobx.deleteSesion(widget.docSes.id);
              context.router.pop();
            }
          },
          child: const Icon(Icons.delete)),
      appBar: _appbar(),
      body: _body(),
    );
  }

// Appbar
  AppBar _appbar() {
    return AppBar(
      title: Text(
        widget.docSes.titulo,
        style: AppStyle.mainTitle,
        textAlign: TextAlign.justify,
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
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                btn("Hora", widget.docSes.time, Icons.timelapse, (() {}), 1),
                btn("Día", widget.docSes.date, Icons.date_range, (() {}), 2),
                btn("Notificar", "", Icons.notification_add, (() {}), 3),
                btn("Notas", "", Icons.notes, (() {
                  context.router.push(NotasSesionesRoute(doc: widget.docSes));
                }), 7),
                btn("Progreso", "", Icons.insights, (() {
                  context.router.push(ProgressRoute(
                      docSes: widget.docSes, docPac: widget.docPac));
                }), 5),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget btn(String texto, String subtitle, IconData? icono, Function()? onTap,
      int colorid) {
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
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
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
