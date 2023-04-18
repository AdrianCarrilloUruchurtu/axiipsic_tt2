import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:flutter/material.dart';

class SesionItem extends StatelessWidget {
  const SesionItem(
      {super.key, required this.doc, this.onTap, required this.docSes});

  final Function()? onTap;
  final UserData doc;
  final SesionesData? docSes;

  @override
  Widget build(BuildContext context) {
    String nombre = doc.nombre;
    String apellido = doc.apellido;
    int? numSesion = docSes?.id.toInt();

    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        onTap: onTap,
        title: Text(
          "Sesión $numSesion",
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_right_sharp,
          color: Colors.pink.shade50,
          size: 50,
        ),
      ),
    );
  }
}
