// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarData _$$_CalendarDataFromJson(Map<String, dynamic> json) =>
    _$_CalendarData(
      json['title'] as String,
      json['description'] as String?,
      DateTime.parse(json['date'] as String),
      json['id'] as String,
      json['time'] as String,
    );

Map<String, dynamic> _$$_CalendarDataToJson(_$_CalendarData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'time': instance.time,
    };
