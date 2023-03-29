// Obtener uno, todos, crear uno
import 'package:axiipsic_tt2/ui/pages/usuarios/view/notas/model/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../ui/pages/usuarios/view/psicologo/tips/model/tips_model.dart';

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

  Stream<List<TipsData>> tipsChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tips')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => TipsData.fromDocument(e)).toList();
    });
  }
}
