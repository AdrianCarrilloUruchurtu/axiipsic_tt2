import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tareas_model.freezed.dart';
part 'tareas_model.g.dart';

@freezed
class TareasData with _$TareasData {
  factory TareasData(
    String tareaTitle,
    String tareaContent,
    String id,
    List<String> owners,
    String creationDate,
  ) = _TareasData;

  factory TareasData.fromJson(Map<String, dynamic> json) =>
      _$TareasDataFromJson(json);
  factory TareasData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$TareasDataFromJson({...?doc.data(), "id": doc.id});
}
