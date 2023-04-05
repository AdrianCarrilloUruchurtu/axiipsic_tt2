import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view/tarea_item.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view_model/tareasMobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../auth/model/user_data.dart';

class TareasPage extends StatefulWidget {
  const TareasPage({super.key, required this.doc});
  final UserData doc;
  @override
  State<TareasPage> createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  final TareasStore _tareaStore = getIt.get<TareasStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Row(
            children: const [Icon(Icons.add), Text("Añadir tip")],
          ),
          onPressed: () {
            context.router.push(TareaAddRoute(doc: widget.doc));
          },
        ),
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) =>
              Builder(builder: (BuildContext context) {
                return _tareaStore.tareasList?[index] != null
                    ? TareaItem(
                        doc: _tareaStore.tareasList![index],
                        onTap: () {},
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              })),
          itemCount: 1,
        ),
      );
    });
  }
}
