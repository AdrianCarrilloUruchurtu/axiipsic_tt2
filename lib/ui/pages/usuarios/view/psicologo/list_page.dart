import 'package:flutter/material.dart';
import 'package:axiipsic_tt2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "SearchBar",
          style: TextStyle(backgroundColor: Colors.grey),
        ),
        actions: [_profileImage()],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _profileImage() {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/profilePage');
        },
        child: Text(""),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _myButton("Nombre Apellido", _profileImage(), "/PatFunctions")
      ],
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(ruta);
      },
    );
  }
}
