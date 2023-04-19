import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart';
import 'package:flutter/material.dart';

import '../../../../../../style/app_style.dart';
import '../model/sesiones_model.dart';

class LectorSesPage extends StatefulWidget {
  const LectorSesPage({super.key, this.docSes});

  final SesionesData? docSes;
  @override
  State<LectorSesPage> createState() => _LectorSesPageState();
}

class _LectorSesPageState extends State<LectorSesPage> {
  final _sesionMobx = getIt.get<SesionesStore>();
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
            if (delete ?? false) {
             
            }
          },
          child: const Icon(Icons.delete)),
      appBar: _appbar(),
      body: _body(),
    );
  }

// Appbar
  AppBar _appbar() {
    int numSes = widget.docSes!.id;
    return AppBar(
        title: Text(
          "Sesión $numSes",
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
        backgroundColor: Colors.transparent,
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
    int numSes = widget.docSes!.id;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4.0,
          ),
          Text(
          "Sesión $numSes",
          style: AppStyle.mainTitle,
          textAlign: TextAlign.center,
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
          
        ],
      ),
    );
  }

}
