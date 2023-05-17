import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/style/app_style.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view-model/tipsMobx.dart';
import 'package:flutter/material.dart';

import '../../../../auth/model/user_data.dart';

class AddTipPage extends StatefulWidget {
  const AddTipPage({super.key, required this.doc});
  final UserData? doc;
  @override
  State<AddTipPage> createState() => _AddTipPageState();
}

class _AddTipPageState extends State<AddTipPage> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  late final _tipMobx = TipsMobx(widget.doc!.email);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: _appbar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          // Corregir
          _tipMobx.crearTip(date, _contentController.text,
              [widget.doc!.psicMail, widget.doc!.email], widget.doc!.id);
          context.popRoute();
        }),
        child: const Icon(Icons.save),
      ),
    );
  }

// Appbar
  AppBar _appbar() {
    return AppBar(
      title: const Text(
        "Nuevo tip",
        style: TextStyle(color: Colors.black),
      ),
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

  // Body
  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 28.0,
        ),
        TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Escribe el tip'),
          style: AppStyle.mainContent,
        ),
      ]),
    );
  }
}
