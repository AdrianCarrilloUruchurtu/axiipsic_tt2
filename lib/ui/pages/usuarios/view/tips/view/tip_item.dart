import 'package:flutter/material.dart';
import '../model/tips_model.dart';

class TipItem extends StatelessWidget {
  const TipItem({super.key, required this.doc, this.onTap});

  final Function()? onTap;
  final TipsData doc;

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
        title: Text(doc.tipContent,
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
