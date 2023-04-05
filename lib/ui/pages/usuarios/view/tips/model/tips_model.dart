import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tips_model.freezed.dart';
part 'tips_model.g.dart';

@freezed
class TipsData with _$TipsData {
  factory TipsData(
    final String creationDate,
    final String id,
    final String tipContent,
    final List<String> owners,
  ) = _TipsData;

  factory TipsData.fromJson(Map<String, dynamic> json) =>
      _$TipsDataFromJson(json);

  factory TipsData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$TipsDataFromJson({...?doc.data(), "id": doc.id});
}
