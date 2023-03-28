import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tareas_model.freezed.dart';
part 'tareas_model.g.dart';

@freezed
class TareasData with _$TareasData {
  factory TareasData(
      final int colorId,
      final String creationDate,
      final String id,
      final String tareaContent,
      final String tareaTitle,
      final String userId,
      final String pacienteId) = _TareasData;

  factory TareasData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$TareasDataFromJson({...?doc.data(), "id": doc.id});
  factory TareasData.fromJson(Map<String, dynamic> json) =>
      _$TareasDataFromJson(json);
}
