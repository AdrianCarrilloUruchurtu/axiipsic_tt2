// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoriaData _$$_HistoriaDataFromJson(Map<String, dynamic> json) =>
    _$_HistoriaData(
      json['edad'] as String,
      json['estadoCivil'] as String,
      json['escolaridad'] as String,
      json['nombreContacto'] as String,
      json['telefonoContacto'] as String,
      json['motivo'] as String,
      json['antecedentes'] as String,
      json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$_HistoriaDataToJson(_$_HistoriaData instance) =>
    <String, dynamic>{
      'edad': instance.edad,
      'estadoCivil': instance.estadoCivil,
      'escolaridad': instance.escolaridad,
      'nombreContacto': instance.nombreContacto,
      'telefonoContacto': instance.telefonoContacto,
      'motivo': instance.motivo,
      'antecedentes': instance.antecedentes,
      'isCompleted': instance.isCompleted,
    };
