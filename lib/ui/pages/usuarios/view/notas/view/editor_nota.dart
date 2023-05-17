import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/style/app_style.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../auth/view_model/auth_mobx.dart';

class NotaEditPage extends StatefulWidget {
  const NotaEditPage({super.key, required this.isses, this.docSesTitulo});
  final String isses;
  final String? docSesTitulo;
  @override
  State<NotaEditPage> createState() => _NotaEditPageState();
}

class _NotaEditPageState extends State<NotaEditPage> {
  int colorId = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  late final _notaMobx = NotaStore(widget.isses);
  final _authMobx = getIt.get<AuthMobx>();

  Future<void> addToPsicIfPatient() async {
    final QuerySnapshot psic = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: _authMobx.user?.psicMail)
        .get();
    final String psicId = psic.docs[0].id;
    final snap = FirebaseFirestore.instance
        .collection('users')
        .doc(psicId)
        .collection('sesiones');
    snap.where('titulo', isEqualTo: widget.docSesTitulo).get().then((value) {
      var doc = value.docs[0];
      var docId = doc.id;
      _notaMobx.notaAddToPsicIfPatient(colorId, date, _contentController.text,
          _titleController.text, docId, psicId);
    });
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: _appbar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          // Corregir
          _notaMobx.crearNota(colorId, date, _contentController.text,
              _titleController.text, widget.isses);

          addToPsicIfPatient();

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
                  context.router.pop();
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
