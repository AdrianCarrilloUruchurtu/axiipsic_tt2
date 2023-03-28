// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tareas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TareasData _$$_TareasDataFromJson(Map<String, dynamic> json) =>
    _$_TareasData(
      json['colorId'] as int,
      json['creationDate'] as String,
      json['id'] as String,
      json['tareaContent'] as String,
      json['tareaTitle'] as String,
      json['userId'] as String,
      json['pacienteId'] as String,
    );

Map<String, dynamic> _$$_TareasDataToJson(_$_TareasData instance) =>
    <String, dynamic>{
      'colorId': instance.colorId,
      'creationDate': instance.creationDate,
      'id': instance.id,
      'tareaContent': instance.tareaContent,
      'tareaTitle': instance.tareaTitle,
      'userId': instance.userId,
      'pacienteId': instance.pacienteId,
    };
