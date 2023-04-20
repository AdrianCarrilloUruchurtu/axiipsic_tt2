import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/model/tareas_model.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../auth/model/user_data.dart';

class TareaItem extends StatelessWidget {
  const TareaItem(
      {super.key, this.onTap, required this.doc, required this.docUser});

  final Function()? onTap;
  final TareasData doc;
  final UserData docUser;

  @override
  Widget build(BuildContext context) {
    bool leadingIconPressed = false;
    IconData leadingIcon = Icons.check_box_outline_blank;
    if (leadingIconPressed == true) {
      
      leadingIcon = Icons.check_box_outlined;
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(12.0, 12, 12, 12),
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
      decoration: BoxDecoration(
          color: Colors.blueAccent.shade100,
          borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        onTap: onTap,
        leading: IconButton(
          icon: Icon(
            leadingIcon,
            size: 40,
          ),
          color: Colors.white,
          onPressed: () {
            leadingIconPressed = true;
          },
        ),
        title: Text(
          doc.tareaTitle,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          doc.tareaContent,
          style: const TextStyle(
              color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            size: 44,
          ),
          color: Colors.pink.shade50,
          onPressed: () {
            context.router.push(TareaEditRoute(doc: doc, docUser: docUser));
          },
        ),
      ),
    );
  }
}
