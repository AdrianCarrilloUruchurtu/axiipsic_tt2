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
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
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
        .collection('chats')
        .doc()
        .collection('messages')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => MessageData.fromDocument(e)).toList();
    });
  }

  Future<void> currentUserOnMessageSent(
      String friendId, String message, String friendName) {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .collection('chats')
        .doc(friendId)
        .collection('messages')
        .add({
      "senderId": _auth.currentUser?.uid,
      "recieverId": friendId,
      "message": message,
      "type": "text",
      "date": DateTime.now().toString(),
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('chats')
          .doc(friendId)
          .set({
        'last_msg': message,
        'friendId': friendId,
        'friendName': friendName
      });
    });
  }

  Future<void> friendUserOnMessageSent(
      String friendId, String message, String friendName) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(friendId)
        .collection('chats')
        .doc(_auth.currentUser?.uid)
        .set({
      "last_msg": message,
      'friendId': friendId,
      'friendName': friendName
    }).then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(friendId)
          .collection('chats')
          .doc(_auth.currentUser?.uid)
          .collection("messages")
          .add({
        "senderId": _auth.currentUser?.uid,
        "recieverId": friendId,
        "message": message,
        "type": "text",
        "date": DateTime.now().toString(),
      });
    });
  }

  Stream<List<MessageData>> getMessages(String friendId) {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection("users")
        .doc(currentUser?.uid)
        .collection('chats')
        .doc(friendId)
        .collection('messages')
        .orderBy('date', descending: true)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => MessageData.fromDocument(e)).toList());
  }
}
