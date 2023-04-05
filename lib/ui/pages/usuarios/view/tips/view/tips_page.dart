import 'package:auto_route/auto_route.dart';
import 'package:axiipsic_tt2/ui/pages/usuarios/view/tips/view/tip_item.dart';
import 'package:flutter/material.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../routes/router.gr.dart';
import '../../../../auth/model/user_data.dart';
import '../view-model/tipsMobx.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key, required this.doc}) : super(key: key);
  final UserData
      doc; // Este doc es el doc del paciente, lo recibe FuncsPage, FuncsPage lo recibe de ListPage y este último lo recibe del índice de la lista de los pacientes.

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final TipsMobx _tipsMobx = getIt.get<TipsMobx>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Row(
            children: const [Icon(Icons.add), Text("Añadir tip")],
          ),
          onPressed: () {
            context.router.push(AddTipRoute(doc: widget.doc));
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
                return _tipsMobx.tipList?[index] != null
                    ? TipItem(
                        doc: _tipsMobx.tipList![index],
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
