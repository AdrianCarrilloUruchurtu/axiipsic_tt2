import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotaEditPage extends StatefulWidget {
  const NotaEditPage({super.key});

  @override
  State<NotaEditPage> createState() => _NotaEditPageState();
}

class _NotaEditPageState extends State<NotaEditPage> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
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
          FirebaseFirestore.instance
              .collection('users')
              .add({
                "note_title": _titleController.text,
                "creation_date": date,
                "note_content": _contentController.text,
                "color_id": color_id,
              })
              .then((value) => context.popRoute())
              .catchError((e) => print("Fallo x.x $e"));
        }),
        child: const Icon(Icons.save),
      ),
    );
  }

// Appbar
  AppBar _appbar() {
    return AppBar(
      title: const Text(
        "Nueva nota",
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
