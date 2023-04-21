import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SesionItem extends StatelessWidget {
  const SesionItem(
      {super.key, required this.doc, this.onTap, required this.docSes});

  final Function()? onTap;
  final UserData doc;
  final SesionesData docSes;

  @override
  Widget build(BuildContext context) {
    String nombre = doc.nombre;
    String apellido = doc.apellido;

    return InkWell(
      onTap: onTap,
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
              docSes.titulo,
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              docSes.descripcion,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
