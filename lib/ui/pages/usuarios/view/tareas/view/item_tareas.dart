import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/model/tareas_model.dart';
import 'package:flutter/material.dart';

class TareasItem extends StatelessWidget {
  const TareasItem({super.key, required this.doc, this.onTap});

  final Function()? onTap;
  final TareasData doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(
          Icons.person,
          color: Colors.white,
          size: 40,
        ),
        title: Text(
          doc.tareaTitle,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          doc.tareaContent,
          style: const TextStyle(color: Colors.white70),
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
