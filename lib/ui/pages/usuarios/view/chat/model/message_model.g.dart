// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageData _$$_MessageDataFromJson(Map<String, dynamic> json) =>
    _$_MessageData(
      json['date'] as String,
      json['message'] as String,
      json['recieverId'] as String,
      json['senderId'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$$_MessageDataToJson(_$_MessageData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'message': instance.message,
      'recieverId': instance.recieverId,
      'senderId': instance.senderId,
      'type': instance.type,
    };
