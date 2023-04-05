// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TipsData _$$_TipsDataFromJson(Map<String, dynamic> json) => _$_TipsData(
      json['creationDate'] as String,
      json['id'] as String,
      json['tipContent'] as String,
      (json['owners'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_TipsDataToJson(_$_TipsData instance) =>
    <String, dynamic>{
      'creationDate': instance.creationDate,
      'id': instance.id,
      'tipContent': instance.tipContent,
      'owners': instance.owners,
    };
