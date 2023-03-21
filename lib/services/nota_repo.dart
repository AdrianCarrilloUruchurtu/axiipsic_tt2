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
        .snapshots()
        .map((event) {
      return event.docs.map((e) => NotaData.fromDocument(e)).toList();
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> notaEdit(
      int colorId, String creationDate, String noteContent, String noteTitle) {
    final currentUSer = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUSer!.uid)
        .collection('notes')
        .add({
      'userId': currentUSer.uid,
      'noteTitle': noteTitle,
      "creationDate": creationDate,
      "noteContent": noteContent,
      "colorId": colorId,
    });
  }


}
