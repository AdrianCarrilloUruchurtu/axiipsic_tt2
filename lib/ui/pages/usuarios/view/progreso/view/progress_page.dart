import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view-model/progresoMobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../../style/app_style.dart';
import '../../../../../routes/router.gr.dart';
import '../../widget/chart.dart';
import 'conducta_item.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key, required this.docSes, required this.docPac});
  final SesionesData docSes;
  final UserData? docPac;

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final int _colorId = Random().nextInt(AppStyle.conductaColors.length);
  final _conductaNombre = TextEditingController();
  final _authMobx = getIt.get<AuthMobx>();

  late final _progresoMobx = ProgresoStore(widget.docSes.id);
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: Container(
                padding: const EdgeInsets.all(2),
                width: 220,
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onPressed: () {
                    _conductaDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(4, 4, 16, 4),
                        child: const Icon(
                          Icons.add_circle,
                          size: 32,
                        ),
                      ),
                      const Text(
                        "Añadir conducta",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              appBar: _appbar(),
              body: _body(),
            ));
  }

  Future<void> _onPressed() async {
    if (_authMobx.user?.ispsic == "Psicologo") {
      final snap = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.docPac!.id)
          .collection('sesiones');
      snap.where('titulo', isEqualTo: widget.docSes.titulo).get().then((value) {
        var doc = value.docs[0];
        var docId = doc.id;
        _progresoMobx.addProgreso(
            _colorId,
            _conductaNombre.text,
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            widget.docSes.id,
            widget.docPac!.id,
            docId);
      });
    } else {
      final QuerySnapshot psic = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: _authMobx.user?.psicMail)
          .get();
      final String psicId = psic.docs[0].id;
      final snap = FirebaseFirestore.instance
          .collection('users')
          .doc(psicId)
          .collection('sesiones');
      snap.where('titulo', isEqualTo: widget.docSes.titulo).get().then((value) {
        var doc = value.docs[0];
        var docId = doc.id;
        _progresoMobx.addProgresoPac(
            _colorId,
            _conductaNombre.text,
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            [0, 0],
            widget.docSes.id,
            psicId,
            docId);
      });
    }
  }

  _conductaDialog() {
    int? evaluar = 0;
    final addConducta = showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Añade una conducta que desees analizar"),
        content: TextField(
          controller: _conductaNombre,
          maxLines: 1,
          decoration: const InputDecoration(labelText: 'Nombre de la conducta'),
        ),
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              _onPressed();
              context.router.pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: const Text("Añadir"),
          ),
        ],
      ),
    );

    if (addConducta == true) {
      // _progresoMobx.addProgreso(_conductaNombre.text, [0], [evaluar]);
    }
  }

  _deleteDialog(String id) async {
    final delete = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Eliminar Conducta"),
        content: const Text("¿Estás seguro que deseas eliminar la conducta?"),
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
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
    if (delete == true) {
      _progresoMobx.deleteProgreso(id);
    }
  }

  Widget _body() {
    return ListView(
      children: [
        Card(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            shadowColor: Colors.black,
            child: _progresoMobx.progresoLista?.isNotEmpty == true
                ? ChartPage(conductaDoc: _progresoMobx.progresoLista)
                : const Center(
                    child: Text(
                        "Cuando empieces a ingresar conductas aparecerán aquí"),
                  )),
        //ConductaItem (¿Qué va a mostrar el item? El puro nombre?)
        Card(
          child: SizedBox(
              height: 250,
              child: _progresoMobx.progresoLista?.isNotEmpty == true
                  ? ListView.builder(
                      itemBuilder: (((context, index) {
                        return ConductaItem(
                          conducta: _progresoMobx.progresoLista![index],
                          onTap: () {
                            context.router.push(ConductaLectorRoute(
                                docProg: _progresoMobx.progresoLista![index],
                                docSes: widget.docSes,
                                docPac: widget.docPac));
                          },
                          docSes: widget.docSes,
                        );
                      })),
                      itemCount: _progresoMobx.progresoLista?.length.toInt(),
                    )
                  : const Center(child: CircularProgressIndicator())),
        )
      ],
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
}
