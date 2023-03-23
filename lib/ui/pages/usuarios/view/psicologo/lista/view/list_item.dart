import 'package:flutter/material.dart';

import '../../../../../auth/model/user_data.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.doc, this.onTap});

  final Function()? onTap;
  final UserData doc;

  @override
  Widget build(BuildContext context) {
    String nombre = doc.nombre;
    String apellido = doc.apellido;
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
          "$nombre $apellido",
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          doc.email,
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
