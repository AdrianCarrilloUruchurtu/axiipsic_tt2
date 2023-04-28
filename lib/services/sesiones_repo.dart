import 'package:axiipsic_tt2/ui/pages/usuarios/view/sesiones/model/sesiones_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class SesionesRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<SesionesData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(id)
        .get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return SesionesData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }

  // Read
  Stream<List<SesionesData>> sesionesChanges(String pacienteId) {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones').where("owners" , arrayContains: pacienteId)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => SesionesData.fromDocument(e)).toList();
    });
  }

  // Create
  Future<DocumentReference<Map<String, dynamic>>> sesionesAdd(
      final List<String> owners,
      final String titulo,
      final String descripcion,
      final String date,
      String pacienteId,
      String time) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .add({
      'userId': currentUser.uid,
      "owners": owners,
      "titulo": titulo,
      "descripcion": descripcion,
      "date": date,
      "time": time
    }).then((value) {
      return _firestore
          .collection('users')
          .doc(pacienteId)
          .collection('sesiones')
          .add({
        'userId': currentUser.uid,
        "owners": owners,
        "titulo": titulo,
        "descripcion": descripcion,
        "date": date,
        "time": time
      });
    });
  }

  // Delete
  Future<void> deleteSesiones(String id) async {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('sesiones')
        .doc(id)
        .delete();
  }
}
