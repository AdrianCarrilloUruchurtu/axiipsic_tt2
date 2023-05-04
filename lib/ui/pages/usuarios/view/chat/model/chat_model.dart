import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatData with _$ChatData {
  factory ChatData(final String last_msg) = _ChatData;

  factory ChatData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$ChatDataFromJson({...?doc.data(), "id": doc.id});
  factory ChatData.fromJson(Map<String, dynamic> json) =>
      _$ChatDataFromJson(json);
}
