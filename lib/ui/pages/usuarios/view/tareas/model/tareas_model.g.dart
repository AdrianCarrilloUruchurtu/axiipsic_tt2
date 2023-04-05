// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tareas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TareasData _$$_TareasDataFromJson(Map<String, dynamic> json) =>
    _$_TareasData(
      json['title'] as String,
      json['content'] as String,
      (json['owners'] as List<dynamic>).map((e) => e as String).toList(),
      json['creationDate'] as String,
    );

Map<String, dynamic> _$$_TareasDataToJson(_$_TareasData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'owners': instance.owners,
      'creationDate': instance.creationDate,
    };
