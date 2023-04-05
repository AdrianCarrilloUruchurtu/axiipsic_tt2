import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/style/app_style.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';

import '../../../../auth/model/user_data.dart';
import '../view-model/tipsMobx.dart';

class AddTipPage extends StatefulWidget {
  const AddTipPage({super.key, required this.doc});
  final UserData doc;
  @override
  State<AddTipPage> createState() => _AddTipPageState();
}

class _AddTipPageState extends State<AddTipPage> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  final _tipMobx = getIt.get<TipsMobx>();

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
              [widget.doc.psicMail, widget.doc.email]);
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
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Título'),
          style: AppStyle.mainTitle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 50,
          color: Colors.black,
        ),
        Text(
          date,
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
        TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Tu nota aquí'),
          style: AppStyle.mainContent,
        ),
      ]),
    );
  }
}
