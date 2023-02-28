// Obtener el nombre del usuario

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

// Obtener el nombre del usuario



class GetUserData {
  var nombre='';
  Future getUserData() async {
    final DocumentSnapshot userDoc = (await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get());
    nombre = userDoc.get('nombre');
  }

  Widget usuario(){
      getUserData();
    return Text("Hola, $nombre");
  }
}
