import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/style/app_style.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view-model/tarea_mobx.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';

class ItemAddPage extends StatefulWidget {
  const ItemAddPage({super.key, required this.docUser});

  final UserData docUser;
  @override
  State<ItemAddPage> createState() => _ItemAddPageState();
}

class _ItemAddPageState extends State<ItemAddPage> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  final _tareaMobx = getIt.get<TareaStore>();

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
          _tareaMobx.crearTarea(color_id, date, _contentController.text,
              _titleController.text, widget.docUser.email);
          context.popRoute();
        }),
        child: const Icon(Icons.save),
      ),
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
              border: InputBorder.none,
              hintText: 'La tarea para tu paciente aquí'),
          style: AppStyle.mainContent,
        ),
      ]),
    );
  }
}
