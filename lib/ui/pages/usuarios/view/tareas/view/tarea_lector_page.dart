import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../../style/app_style.dart';
import '../../../../auth/model/user_data.dart';
import '../model/tareas_model.dart';
import '../view_model/tareasMobx.dart';

class TareaLectorPage extends StatefulWidget {
  const TareaLectorPage({super.key, required this.doc});
  final TareasData doc;

  @override
  State<TareaLectorPage> createState() => _TareaLectorPageState();
}

class _TareaLectorPageState extends State<TareaLectorPage> {
  final _tareaMobx = getIt.get<TareasStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final delete = await showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Eliminar tarea"),
                content:
                    const Text("¿Estás seguro que deseas eliminar la tarea?"),
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
            if (delete ?? false) {}
          },
          child: const Icon(Icons.delete)),
      appBar: _appbar(),
      body: _body(),
    );
  }

  // Appbar
  AppBar _appbar() {
    return AppBar(
        title: Text(
          "Sesion ",
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
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4.0,
          ),
          Text(widget.doc.tareaTitle),
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
            widget.doc.tareaContent,
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
