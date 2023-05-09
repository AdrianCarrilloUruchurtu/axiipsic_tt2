// Obtener uno, todos, crear uno
import 'package:axiipsic_tt2/ui/pages/auth/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<UserData?> get(String id) async {
    final uid = await _firestore.collection('users').doc(id).get();
    final jsonUid = uid.data();
    if (jsonUid != null) {
      return UserData.fromJson(jsonUid);
    } else {
      return null;
    }
  }

  Stream<List<UserData>> userList() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .where('psicMail', isEqualTo: currentUser!.email)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => UserData.fromDocument(e)).toList();
    });
  }

  Stream<List<UserData>> psicList() {
    return _firestore
        .collection('users')
        .where('ispsic', isEqualTo: "Psicologo")
        .snapshots()
        .map((event) {
      return event.docs.map((e) => UserData.fromDocument(e)).toList();
    });
  }

  Stream<List<UserData>> searchList(String name) {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .where('nombre', isEqualTo: name)
        .where('nombre', isNotEqualTo: currentUser?.uid)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => UserData.fromDocument(e)).toList();
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserByFriendId(
      String? friendId) {
    return _firestore.collection('users').doc(friendId).get();
  }
}
