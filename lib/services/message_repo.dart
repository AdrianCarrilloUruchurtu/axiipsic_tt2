import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../ui/pages/usuarios/view/chat/model/message_model.dart';

@singleton
class MessageRepo {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<MessageData?> get(String messageId, String chatId) async {
    final currentUser = _auth.currentUser;

    final cid = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .collection('chats')
        .doc(chatId)
        .get();

    final jsonCid = cid.data();
    if (jsonCid != null) {
      return MessageData.fromJson({...jsonCid, messageId: cid.id});
    } else {
      return null;
    }
  }

  Stream<List<MessageData>> messageChanges() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('messages')
        .doc()
        .collection('chats')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => MessageData.fromDocument(e)).toList();
    });
  }

  Future<void> currentUserOnMessageSent(String friendId, String message) {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('messages')
        .doc(friendId)
        .collection('chats')
        .add({
      "senderId": _auth.currentUser?.uid,
      "receiverId": friendId,
      "message": message,
      "type": "text",
      "date": DateTime.now(),
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('messages')
          .doc(friendId)
          .set({
        'last_msg': message,
      });
    });
  }

  Future<void> friendUserOnMessageSent(String friendId, String message) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(friendId)
        .collection('messages')
        .doc(_auth.currentUser?.uid)
        .collection("chats")
        .add({
      "senderId": _auth.currentUser?.uid,
      "receiverId": friendId,
      "message": message,
      "type": "text",
      "date": DateTime.now(),
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(friendId)
          .collection('messages')
          .doc(_auth.currentUser?.uid)
          .set({"last_msg": message});
    });
  }
}
