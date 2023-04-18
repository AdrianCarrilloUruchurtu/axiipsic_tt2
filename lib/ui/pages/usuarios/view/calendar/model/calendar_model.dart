import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';
part 'calendar_model.g.dart';

@freezed
class CalendarData with _$CalendarData {
  factory CalendarData(final String title, final String? description,
      final DateTime date, final String id, final String time) = _CalendarData;

  factory CalendarData.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      _$CalendarDataFromJson({
        ...?doc.data(),
        "id": doc.id,
        "date": (doc.get("date") as Timestamp).toDate().toIso8601String()
      });
  factory CalendarData.fromJson(Map<String, dynamic> json) =>
      _$CalendarDataFromJson(json);
}
