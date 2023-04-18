import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/view-model/notaMobx.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../../style/app_style.dart';
import '../model/note_model.dart';

class LectorPage extends StatefulWidget {
  LectorPage(this.doc, {super.key});
  NotaData doc;
  @override
  State<LectorPage> createState() => _LectorPageState();
}

class _LectorPageState extends State<LectorPage> {
  final _notaMobx = getIt.get<NotaStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final delete = await showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Eliminar Nota"),
                content:
                    const Text("¿Estás seguro que deseas eliminar la nota?"),
                actions: [
                  TextButton(
                    onPressed: () => context.popRoute(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text("Si"),
                  ),
                ],
              ),
            );

            // Cambiar también
            if (delete ?? false) {
              _notaMobx.eliminarNota(widget.doc.id);
            }
          },
          child: const Icon(Icons.delete)),
      appBar: _appbar(),
      body: _body(),
    );
  }

// Appbar
  AppBar _appbar() {
    int colorId = widget.doc.colorId;
    return AppBar(
        title: Text(
          widget.doc.noteTitle,
          style: AppStyle.mainTitle,
          textAlign: TextAlign.center,
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
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 130, 0),
            color: Colors.black,
            height: 1.0,
          ),
        ));
  }

  Widget _body() {
    int colorId = widget.doc.colorId;
    return Container(
      color: AppStyle.cardsColor[colorId],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4.0,
          ),
          Text(
            widget.doc.creationDate,
            style: AppStyle.dateTitle,
          ),
          const Divider(
            height: 6,
            thickness: 2,
            indent: 0,
            endIndent: 130,
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
