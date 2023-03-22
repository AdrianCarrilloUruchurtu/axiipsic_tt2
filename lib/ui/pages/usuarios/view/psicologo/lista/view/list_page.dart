import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:axiipsic_tt2/lib/get_it.dart';
import '../../../../../auth/view_model/auth_mobx.dart';
import 'list_item.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final AuthMobx _authMobx = getIt.get<AuthMobx>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "SearchBar",
            style: TextStyle(backgroundColor: Colors.grey),
          ),
          actions: [_profileImage()],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) => Builder(builder: ((context) {
                return _authMobx.userLista?[index] != null
                    ? ListItem(
                        doc: _authMobx.userLista![index],
                      )
                    : const Center(child: CircularProgressIndicator());
              }))),
          itemCount: _authMobx.userLista!.length.toInt(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/profilePage');
        },
        child: const Text(""),
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemBuilder: ((context, index) => Builder(builder: ((context) {
            return _authMobx.userLista?[index] != null
                ? ListItem(
                    doc: _authMobx.userLista![index],
                  )
                : const Center(child: CircularProgressIndicator());
          }))),
      itemCount: 20,
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
