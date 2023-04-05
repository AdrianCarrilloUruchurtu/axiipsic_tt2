import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/model/tareas_model.dart';
import 'package:flutter/material.dart';

class TareaItem extends StatelessWidget {
  const TareaItem({super.key, this.onTap, required this.doc});

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
          Icons.check_box_outline_blank,
          color: Colors.white,
          size: 40,
        ),
        title: Text(
          doc.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          doc.content,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.edit,
          color: Colors.pink.shade50,
          size: 50,
        ),
      ),
    );
  }
}
