import 'package:axiipsic_tt2/ui/pages/usuarios/view/chat/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<ChatData?> get(String id) async {
    final currentUser = _auth.currentUser;

    final cid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('messages')
        .doc(id)
        .get();

    final jsonCid = cid.data();
    if (jsonCid != null) {
      return ChatData.fromJson({...jsonCid, id: cid.id});
    } else {
      return null;
    }
  }

  Stream<List<ChatData>> chatChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('messages')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => ChatData.fromDocument(e)).toList();
    });
  }

  streamChats(String friendId) {
    return _firestore
        .collection('users')
        .doc(friendId)
        .collection('messages')
        .snapshots();
  }
}
