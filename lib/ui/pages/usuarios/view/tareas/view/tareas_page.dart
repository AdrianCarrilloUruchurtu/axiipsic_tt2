import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tareas/view-model/tarea_mobx.dart';
import 'package:axiipsic_tt2/ui/routes/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'item_tareas.dart';

class TareasPage extends StatefulWidget {
  const TareasPage({Key? key, required this.doc})
      : super(key: key);
 
  final UserData doc;
  @override
  State<TareasPage> createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  final TareaStore _tareaMobx = getIt.get<TareaStore>();
  int? itemCnt = 0;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router
                .push(ItemAddRoute( docUser: widget.doc));
          },
          child: const Icon(Icons.add),
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
              Builder(builder: ((BuildContext context) {
                return _tareaMobx.tareaList?[index] != null
                    ? TareasItem(
                        doc: _tareaMobx.tareaList![index],
                      )
                    : const Center(child: CircularProgressIndicator());
              }))),
          itemCount: _tareaMobx.tareaList!.length.toInt(),
        ),
      );
    });
  }

  Widget _profileImage() {
    return Container(
      height: 30,
      margin: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/profilePage');
          },
          child: const Text(""),
        ),
      ),
    );
  }

  Widget _myButton(String texto, Widget profileImage, ruta) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade900,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          profileImage,
          Text(
            texto,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(ruta);
      },
    );
  }
}
