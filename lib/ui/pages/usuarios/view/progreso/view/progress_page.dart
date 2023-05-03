import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/progreso/view-model/progresoMobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  final _conductaNombre = TextEditingController();

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
              _progresoMobx.addProgreso(
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
                  widget.docSes
                      .id); //El id de la sesión del paciente de donde lo saco?

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
            child: _progresoMobx.progresoLista!.isNotEmpty
                ? ChartPage(conductaDoc: _progresoMobx.progresoLista)
                : const Center(
                    child: Text(
                        "Cuando empieces a ingresar conductas aparecerán aquí"),
                  )),
        //ConductaItem (¿Qué va a mostrar el item? El puro nombre?)
        Card(
          child: SizedBox(
            height: 250,
            child: ListView.builder(
              itemBuilder: (((context, index) {
                return _progresoMobx.progresoLista?[index] != null
                    ? ConductaItem(
                        conducta: _progresoMobx.progresoLista![index],
                        onTap: () {
                          context.router.push(ConductaLectorRoute(
                              docProg: _progresoMobx.progresoLista![index],
                              docSes: widget.docSes,
                              docPac: widget.docPac));
                        },
                        docSes: widget.docSes,
                      )
                    : const Center(child: CircularProgressIndicator());
              })),
              itemCount: _progresoMobx.progresoLista?.length.toInt(),
            ),
          ),
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
