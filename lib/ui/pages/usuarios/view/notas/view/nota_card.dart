import 'package:axiipsic_tt2/style/app_style.dart';
import 'package:flutter/material.dart';
import '../model/note_model.dart';

class NotaCard extends StatelessWidget {
  const NotaCard(this.doc, {super.key, this.onTap});

  final Function()? onTap;
  final NotaData doc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: AppStyle.cardsColor[doc.colorId],
            borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc.noteTitle,
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              doc.creationDate,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              doc.noteContent,
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
