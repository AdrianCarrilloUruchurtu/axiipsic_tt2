// Obtener el nombre del usuario

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Obtener el nombre del usuario



class GetUserData {
  var nombre='';
  var apellido='';
  var email='';
  Future getUserData() async {
    final DocumentSnapshot userDoc = (await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get());
    nombre = userDoc.get('nombre');
    apellido = userDoc.get('apellido');
    email = userDoc.get('email');
  }

  Widget usuario(){
      getUserData();
    return Text("Hola, $nombre", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),);
  }

  Widget nombreApellido() {
    getUserData();
    return Text(
      "$nombre $apellido",
      style: const TextStyle(
        fontFamily: 'SourceSansPro',
        fontSize: 25,
      ),
    );
  }

  Widget correo(){
    getUserData();
   return Text(
      '$email',
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'SourceSansPro',
        color: Colors.red[400],
        letterSpacing: 2.5,
      ),
    );
  }

}
