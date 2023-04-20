// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sesiones_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SesionesData _$$_SesionesDataFromJson(Map<String, dynamic> json) =>
    _$_SesionesData(
      json['id'] as String,
      (json['owners'] as List<dynamic>).map((e) => e as String).toList(),
      (json['rapport'] as List<dynamic>).map((e) => e as int).toList(),
      (json['evaluacion'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_SesionesDataToJson(_$_SesionesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owners': instance.owners,
      'rapport': instance.rapport,
      'evaluacion': instance.evaluacion,
    };
