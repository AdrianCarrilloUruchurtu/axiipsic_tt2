import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view/tip_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../routes/router.gr.dart';
import '../../../../auth/model/user_data.dart';
import '../view-model/tipsMobx.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key, required this.doc}) : super(key: key);
  final UserData? doc;
  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  late final TipsMobx _tipsMobx = TipsMobx(widget.doc!.email);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          width: 150,
          child: Visibility(
            visible: true, //Cambiar visibilidad según tipo de usuario
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text(
                    "Añadir tip",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onPressed: () {
                context.router.push(AddTipRoute(doc: widget.doc));
              },
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
                return _tipsMobx.tipList?[index] != null
                    ? TipItem(
                        doc: _tipsMobx.tipList![index],
                        docUser: widget.doc,
                        onTap: () {},
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              })),
          itemCount: _tipsMobx.tipList?.length.toInt(),
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
