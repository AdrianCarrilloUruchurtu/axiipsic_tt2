// Obtener uno, todos, crear uno
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/model/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class NotaRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<NotaData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .doc(id)
        .get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return NotaData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }

  Stream<List<NotaData>> noteChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .where('isses', isEqualTo: "")
        .snapshots()
        .map((event) {
      return event.docs.map((e) => NotaData.fromDocument(e)).toList();
    });
  }

  Stream<List<NotaData>> sesionNote(String sesId) {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .where('isses', isEqualTo: sesId)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => NotaData.fromDocument(e)).toList();
    });
  }

  // Delete pendiente, el id no es así
  Future<void> deleteNota(String id) async {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .doc(id)
        .delete();
  }

  Future<DocumentReference<Map<String, dynamic>>> notaEdit(int colorId,
      String creationDate, String noteContent, String noteTitle, String isses) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .add({
      'userId': currentUser.uid,
      'noteTitle': noteTitle,
      "creationDate": creationDate,
      "noteContent": noteContent,
      "colorId": colorId,
      "isses": isses
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> notaAddToPsicIfPatient(
      int colorId,
      String creationDate,
      String noteContent,
      String noteTitle,
      String isses,
      String psicId) {
    final currentUser = _auth.currentUser;

    return _firestore.collection('users').doc(psicId).collection('notes').add({
      'userId': currentUser?.uid,
      'noteTitle': noteTitle,
      "creationDate": creationDate,
      "noteContent": noteContent,
      "colorId": colorId,
      "isses": isses
    });
  }
}
