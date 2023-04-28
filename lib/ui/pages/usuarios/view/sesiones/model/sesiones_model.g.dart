// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sesiones_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SesionesData _$$_SesionesDataFromJson(Map<String, dynamic> json) =>
    _$_SesionesData(
      json['id'] as String,
      (json['owners'] as List<dynamic>).map((e) => e as String).toList(),
      json['titulo'] as String,
      json['descripcion'] as String,
      json['date'] as String,
      json['time'] as String,
    );

Map<String, dynamic> _$$_SesionesDataToJson(_$_SesionesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owners': instance.owners,
      'titulo': instance.titulo,
      'descripcion': instance.descripcion,
      'date': instance.date,
      'time': instance.time,
    };
