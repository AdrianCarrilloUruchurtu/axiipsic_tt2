import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageData with _$MessageData {
  factory MessageData(
          final String currentId, final String friendId, final String lastMsg) =
      _MessageData;

  factory MessageData.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$MessageDataFromJson({...?doc.data(), "id": doc.id});
  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);
}
