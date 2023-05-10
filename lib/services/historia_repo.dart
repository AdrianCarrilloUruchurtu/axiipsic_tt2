import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../ui/pages/usuarios/view/historia_clinica.dart/model/historia_model.dart';

@singleton
class HistoriaRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<HistoriaData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('historia')
        .doc(id)
        .get();

    final jsonUid = uid.data();
    if (jsonUid != null) {
      return HistoriaData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }

  Stream<List<HistoriaData>> historiaChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('historia')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => HistoriaData.fromDocument(e)).toList();
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> addHistoria(
      String edad,
      String estadoCivil,
      String escolaridad,
      String contacto,
      String motivo,
      String antecedentes) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('historia')
        .add({
      "edad": edad,
      "estadoCivil": estadoCivil,
      "escolaridad": escolaridad,
      "contacto": contacto,
      "motivo": motivo,
      "antecedentes": antecedentes
    });
  }
}
