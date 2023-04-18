import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view-model/sesiones_mobx.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view/sesion_add.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/view/sesion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../../style/app_style.dart';
import '../../../../auth/model/user_data.dart';

class SesionesPage extends StatefulWidget {
  const SesionesPage({super.key, required this.doc});
  final UserData doc;
  @override
  State<SesionesPage> createState() => _SesionesPageState();
}

class _SesionesPageState extends State<SesionesPage> {
  final _sesionesMobx = getIt.get<SesionesStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          floatingActionButton: Container(
            margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            width: 150,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => { }),
                  const Text(
                    "Nueva sesión",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
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
                Builder(builder: ((BuildContext context) {
                  return _sesionesMobx.sesionesList?[index] != null
                      ? SesionItem(
                          //Crear el creador de los items de las sesiones
                          doc: widget.doc,
                          docSes: _sesionesMobx.sesionesList?[index],
                          onTap: () => {})
                      : const Center(child: CircularProgressIndicator());
                }))),
          ));
    });
  }

  Widget btn(String texto, IconData? icono, Function()? onTap, int colorid) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 75, 176, 223),
          borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: AppStyle.iconColors[colorid],
              borderRadius: BorderRadius.circular(16)),
          child: Icon(
            icono,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          texto,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_right_sharp,
          color: Colors.pink.shade50,
          size: 50,
        ),
        onTap: onTap,
      ),
    );
  }
}
