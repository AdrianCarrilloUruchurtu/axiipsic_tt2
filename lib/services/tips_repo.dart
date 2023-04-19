// Obtener uno, todos, crear uno
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../ui/pages/usuarios/view/tips/model/tips_model.dart';

@singleton
class TipsRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<TipsData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final uid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tips')
        .doc(id)
        .get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return TipsData.fromJson({...jsonUid, id: uid.id});
    } else {
      return null;
    }
  }

// Debería de mostrar solo los que tengan el mismo mail que el currentUser psicólogo?
// Hacer dos vistas?
  Stream<List<TipsData>> tipsChanges(String pac) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser?.uid)
        .collection('tips')
        .where(
            'owners', //Guardar el mail del paciente en cada tip, todos los tips que cree el psicólogo se guardarán en la misma colección
            arrayContains: pac)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => TipsData.fromDocument(e)).toList();
    });
  }

  Future<DocumentReference<Map<String, dynamic>>> tipAdd(
    String creationDate,
    String tipContent,
    List<String> owners,
  ) {
    final currentUser = _auth.currentUser;

    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tips')
        .add({
      'userId': currentUser.uid,
      "creationDate": creationDate,
      "tipContent": tipContent,
      "owners": owners
    });
  }
}
