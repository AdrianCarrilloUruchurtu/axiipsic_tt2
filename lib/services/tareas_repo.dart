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

  Stream<List<TareasData>> tareasChanges(String pac) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser?.uid)
        .collection('tareas')
        .where(
            'owners', //Guardar el mail del paciente en cada tip, todos los tips que cree el psicólogo se guardarán en la misma colección
            arrayContains:
                pac) //El current user en ese momento será el psicólogo
        .snapshots()
        .map((event) {
      return event.docs.map((e) => TareasData.fromDocument(e)).toList();
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> tareasAdd(
    String title,
    String content,
    List<String> owners,
    String creationDate,
    String pacienteId
  ) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tareas')
        .add({
      'userId': currentUser.uid,
      "creationDate": creationDate,
      "tareaContent": content,
      "owners": owners,
      "tareaTitle": title
    }).then((value) async {
      return _firestore
          .collection('users')
          .doc(pacienteId)
          .collection('tareas')
          .add({
        'userId': currentUser.uid,
        "creationDate": creationDate,
        "tareaContent": content,
        "owners": owners,
        "tareaTitle": title
      });
    });
  }

  Future<void> editarTarea(String title, String content, List<String> owners,
      String creationDate, String id) {
    final currentUser = _auth.currentUser;
    final tareaRef = _firestore
        .collection("users")
        .doc(currentUser!.uid)
        .collection("tareas")
        .doc(id);
    return tareaRef.update({
      'userId': currentUser.uid,
      "creationDate": creationDate,
      "tareaContent": content,
      "owners": owners,
      "tareaTitle": title
    });
  }

  Future<void> deleteTarea(String id) {
    final currentUser = _auth.currentUser;
    final tareaRef = _firestore
        .collection("users")
        .doc(currentUser!.uid)
        .collection("tareas")
        .doc(id);
    return tareaRef.delete();
  }
}
