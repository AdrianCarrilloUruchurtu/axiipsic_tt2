import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

//Messages es chats y chats es messages, no olvidar xd

@freezed
class MessageData with _$MessageData {
  factory MessageData(
      final DateTime date,
      final String message,
      final String recieverId,
      final String senderId,
      final String type) = _MessageData;

  factory MessageData.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$MessageDataFromJson({...?doc.data(), "id": doc.id});
  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);
}
