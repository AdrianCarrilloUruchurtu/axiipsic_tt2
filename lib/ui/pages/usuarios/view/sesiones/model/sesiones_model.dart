import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sesiones_model.freezed.dart';
part 'sesiones_model.g.dart';

@freezed
class SesionesData with _$SesionesData {
  factory SesionesData(
    final String id,
    final List<String> owners,
    final List<int> rapport,
    final List<int> evaluacion,
  ) = _SesionesData;

  factory SesionesData.fromJson(Map<String, dynamic> json) =>
      _$SesionesDataFromJson(json);

  factory SesionesData.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$$_SesionesDataFromJson({...?doc.data(), "id": doc.id});
}
