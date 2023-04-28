// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progreso_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgresoData _$$_ProgresoDataFromJson(Map<String, dynamic> json) =>
    _$_ProgresoData(
      json['conducta'] as String,
      (json['lunes'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      (json['martes'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      (json['miercoles'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      (json['jueves'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      (json['viernes'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      (json['sabado'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      (json['domingo'] as List<dynamic>)
          .map((e) => (e as num?)?.toDouble())
          .toList(),
      json['id'] as String,
    );

Map<String, dynamic> _$$_ProgresoDataToJson(_$_ProgresoData instance) =>
    <String, dynamic>{
      'conducta': instance.conducta,
      'lunes': instance.lunes,
      'martes': instance.martes,
      'miercoles': instance.miercoles,
      'jueves': instance.jueves,
      'viernes': instance.viernes,
      'sabado': instance.sabado,
      'domingo': instance.domingo,
      'id': instance.id,
    };
