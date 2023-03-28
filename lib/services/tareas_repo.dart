import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../ui/pages/usuarios/view/tareas/model/tareas_model.dart';

@singleton
class TareasRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<TareasData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tareas')
        .doc(id)
        .get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return TareasData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }

  Stream<List<TareasData>> tareasChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tareas')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => TareasData.fromDocument(e)).toList();
    });
  }

  Future<void> deleteTarea(String id) async {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tarea')
        .doc(id)
        .delete();
  }

  Future<DocumentReference<Map<String, dynamic>>> tareaAdd(
      int colorId,
      String creationDate,
      String tareaContent,
      String tareaTitle,
      String pacienteId) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tarea')
        .add({
      'userId': currentUser.uid,
      'tareaTitle': tareaTitle,
      "creationDate": creationDate,
      "tareaContent": tareaContent,
      "colorId": colorId,
      "pacienteId": pacienteId,
    });
  }
}
