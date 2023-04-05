import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../../../../style/app_style.dart';

class FuncsPage extends StatefulWidget {
  const FuncsPage({super.key, required this.doc});
  final UserData doc;

  @override
  State<FuncsPage> createState() => _FuncsPageState();
}

class _FuncsPageState extends State<FuncsPage> {
  @override
  Widget build(BuildContext context) {
    String? nombre = widget.doc.nombre;
    String? apellido = widget.doc.apellido;

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: 290,
            height: 40,
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            decoration: BoxDecoration(
                color: Colors.brown.shade300,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "Paciente: $nombre $apellido",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                btn("Agendar cita", Icons.calendar_month, (() {
                  context.router.push(const CalendarRoute());
                }), 1),
                btn("Asignar tarea", Icons.check_box, (() {}), 2),
                btn("Tips", Icons.tips_and_updates, (() {
                  context.router.push(TipsRoute(doc: widget.doc));
                }), 3),
                btn("Rapport", Icons.supervised_user_circle, (() {}), 7),
                btn("Plan de trabajo", Icons.book, (() {}), 5),
                btn("Historia clínica", Icons.history, (() {}), 6),
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
