import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../style/app_style.dart';

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

    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.blueAccent.shade100,
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sesión $numSesion",
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4.0,
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
