// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TipsData _$$_TipsDataFromJson(Map<String, dynamic> json) => _$_TipsData(
      json['colorId'] as int,
      json['creationDate'] as String,
      json['id'] as String,
      json['tipContent'] as String,
      json['userId'] as String,
      json['pacienteId'] as String,
    );

Map<String, dynamic> _$$_TipsDataToJson(_$_TipsData instance) =>
    <String, dynamic>{
      'colorId': instance.colorId,
      'creationDate': instance.creationDate,
      'id': instance.id,
      'tipContent': instance.tipContent,
      'userId': instance.userId,
      'pacienteId': instance.pacienteId,
    };
