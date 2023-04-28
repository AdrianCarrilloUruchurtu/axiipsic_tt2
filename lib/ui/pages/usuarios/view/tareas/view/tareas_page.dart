import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/auth/view_model/auth_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view/tarea_item.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view_model/tareasMobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../auth/model/user_data.dart';

class TareasPage extends StatefulWidget {
  const TareasPage({super.key, required this.doc});
  final UserData? doc;
  @override
  State<TareasPage> createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  late final TareasStore _tareaStore = TareasStore(widget.doc!.email);
  final _authMobx = getIt.get<AuthMobx>();

  @override
  Widget build(BuildContext context) {
    bool _checkType() {
      bool isPsic = false;
      if (_authMobx.user!.ispsic == "Psicologo") {
        isPsic = true;
      }
      return isPsic;
    }

    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          width: 150,
          child: Visibility(
            visible: _checkType(),
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                context.router.push(TareaAddRoute(doc: widget.doc));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add),
                  Text(
                    "Añadir tarea",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
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
                        docUser: widget.doc,
                        onTap: () {
                          context.router.push(TareaLectorRoute(
                              doc: _tareaStore.tareasList![index]));
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              })),
          itemCount: _tareaStore.tareasList?.length.toInt(),
        ),
      );
    });
  }
}
