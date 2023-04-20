import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/model/tareas_model.dart';
import 'package:flutter/material.dart';

import '../view_model/tareasMobx.dart';

class TareaEditPage extends StatefulWidget {
  const TareaEditPage({super.key, required this.doc, required this.docUser});
  final TareasData doc;
  final UserData docUser;

  @override
  State<TareaEditPage> createState() => _TareaEditPageState();
}

class _TareaEditPageState extends State<TareaEditPage> {
  final date = DateTime.now().toString();
  late final _tareaStore = TareasStore(widget.docUser.email);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          if (_titleController.text == "") {
            _tareaStore.editarTarea(
                widget.doc.tareaTitle,
                _contentController.text,
                [widget.docUser.psicMail, widget.docUser.email],
                date,
                widget.doc.id);
          } else if (_contentController.text == "") {
            _tareaStore.editarTarea(
                _titleController.text,
                widget.doc.tareaContent,
                [widget.docUser.psicMail, widget.docUser.email],
                date,
                widget.doc.id);
          } else if (_titleController.text == "" &&
              _contentController.text == "") {
            _tareaStore.editarTarea(
                widget.doc.tareaTitle,
                widget.doc.tareaContent,
                [widget.docUser.psicMail, widget.docUser.email],
                date,
                widget.doc.id);
          } else {
            _tareaStore.editarTarea(
                _titleController.text,
                _contentController.text,
                [widget.docUser.psicMail, widget.docUser.email],
                date,
                widget.doc.id);
          }

          context.router.pop();
        }),
        child: const Icon(Icons.save),
      ),
    );
  }

  // Appbar
  AppBar _appbar() {
    return AppBar(
      title: const Text(
        "Nueva tarea",
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
          decoration: InputDecoration(
              border: InputBorder.none, hintText: widget.doc.tareaTitle),
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
          decoration: InputDecoration(
              border: InputBorder.none, hintText: widget.doc.tareaContent),
        ),
      ]),
    );
  }
}
