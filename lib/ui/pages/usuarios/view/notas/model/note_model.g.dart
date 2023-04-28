// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotaData _$$_NotaDataFromJson(Map<String, dynamic> json) => _$_NotaData(
      json['colorId'] as int,
      json['creationDate'] as String,
      json['id'] as String,
      json['noteContent'] as String,
      json['noteTitle'] as String,
      json['userId'] as String,
      json['isses'] as String,
    );

Map<String, dynamic> _$$_NotaDataToJson(_$_NotaData instance) =>
    <String, dynamic>{
      'colorId': instance.colorId,
      'creationDate': instance.creationDate,
      'id': instance.id,
      'noteContent': instance.noteContent,
      'noteTitle': instance.noteTitle,
      'userId': instance.userId,
      'isses': instance.isses,
    };
