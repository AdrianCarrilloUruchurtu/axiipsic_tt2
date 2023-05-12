import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'historia_model.freezed.dart';
part 'historia_model.g.dart';

@freezed
class HistoriaData with _$HistoriaData {
  factory HistoriaData(
      String edad,
      String estadoCivil,
      String escolaridad,
      String nombreContacto,
      String telefonoContacto,
      String motivo,
      String antecedentes,
      bool isCompleted) = _HistoriaData;

  factory HistoriaData.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$HistoriaDataFromJson({
        ...?doc.data(),
        "id": doc.id,
      });

  factory HistoriaData.fromJson(Map<String, dynamic> json) =>
      _$HistoriaDataFromJson(json);
}
