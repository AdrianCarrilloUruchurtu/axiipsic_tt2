import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
class NotaData with _$NotaData {
  factory NotaData(
    final int colorId,
    final String creationDate,
    final String id,
    final String noteContent,
    final String noteTitle,
    final String userId,
  ) = _NotaData;
  factory NotaData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$NotaDataFromJson({...?doc.data(), "id": doc.id});
  factory NotaData.fromJson(Map<String, dynamic> json) =>
      _$NotaDataFromJson(json);
}
