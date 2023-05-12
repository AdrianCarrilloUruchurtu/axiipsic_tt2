import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progreso_model.freezed.dart';
part 'progreso_model.g.dart';

@freezed
class ProgresoData with _$ProgresoData {
  factory ProgresoData(
      int colorId,
      String conducta,
      List<double?> lunes,
      List<double?> martes,
      List<double?> miercoles,
      List<double?> jueves,
      List<double?> viernes,
      List<double?> sabado,
      List<double?> domingo,
      String id) = _ProgresoData;

  factory ProgresoData.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$ProgresoDataFromJson({
        ...?doc.data(),
        "id": doc.id,
      });
  factory ProgresoData.fromJson(Map<String, dynamic> json) =>
      _$ProgresoDataFromJson(json);
}
