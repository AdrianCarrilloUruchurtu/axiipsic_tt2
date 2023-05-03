// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatData _$$_ChatDataFromJson(Map<String, dynamic> json) => _$_ChatData(
      json['senderId'] as String,
      json['recieverId'] as String,
      json['message'] as String,
      json['type'] as String,
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_ChatDataToJson(_$_ChatData instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'recieverId': instance.recieverId,
      'message': instance.message,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
    };
