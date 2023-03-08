import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../style/app_style.dart';
import 'model/note_model.dart';

class LectorPage extends StatefulWidget {
  LectorPage(this.doc, {super.key});
  NotaData doc;
  @override
  State<LectorPage> createState() => _LectorPageState();
}

class _LectorPageState extends State<LectorPage> {
  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc.colorId;
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

// Appbar
  AppBar _appbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  context.popRoute();
                },
              ));
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.doc.noteTitle,
            style: AppStyle.mainTitle,
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 50,
            color: Colors.black,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            widget.doc.creationDate,
            style: AppStyle.dateTitle,
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 50,
            color: Colors.black,
          ),
          const SizedBox(
            height: 28.0,
          ),
          Text(
            widget.doc.noteContent,
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
