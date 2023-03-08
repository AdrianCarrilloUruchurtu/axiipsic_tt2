// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotaData _$NotaDataFromJson(Map<String, dynamic> json) {
  return _NotaData.fromJson(json);
}

/// @nodoc
mixin _$NotaData {
  int get colorId => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get noteContent => throw _privateConstructorUsedError;
  String get noteTitle => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotaDataCopyWith<NotaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotaDataCopyWith<$Res> {
  factory $NotaDataCopyWith(NotaData value, $Res Function(NotaData) then) =
      _$NotaDataCopyWithImpl<$Res, NotaData>;
  @useResult
  $Res call(
      {int colorId,
      String creationDate,
      String id,
      String noteContent,
      String noteTitle,
      String userId});
}

/// @nodoc
class _$NotaDataCopyWithImpl<$Res, $Val extends NotaData>
    implements $NotaDataCopyWith<$Res> {
  _$NotaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? creationDate = null,
    Object? id = null,
    Object? noteContent = null,
    Object? noteTitle = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      noteContent: null == noteContent
          ? _value.noteContent
          : noteContent // ignore: cast_nullable_to_non_nullable
              as String,
      noteTitle: null == noteTitle
          ? _value.noteTitle
          : noteTitle // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotaDataCopyWith<$Res> implements $NotaDataCopyWith<$Res> {
  factory _$$_NotaDataCopyWith(
          _$_NotaData value, $Res Function(_$_NotaData) then) =
      __$$_NotaDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int colorId,
      String creationDate,
      String id,
      String noteContent,
      String noteTitle,
      String userId});
}

/// @nodoc
class __$$_NotaDataCopyWithImpl<$Res>
    extends _$NotaDataCopyWithImpl<$Res, _$_NotaData>
    implements _$$_NotaDataCopyWith<$Res> {
  __$$_NotaDataCopyWithImpl(
      _$_NotaData _value, $Res Function(_$_NotaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? creationDate = null,
    Object? id = null,
    Object? noteContent = null,
    Object? noteTitle = null,
    Object? userId = null,
  }) {
    return _then(_$_NotaData(
      null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == noteContent
          ? _value.noteContent
          : noteContent // ignore: cast_nullable_to_non_nullable
              as String,
      null == noteTitle
          ? _value.noteTitle
          : noteTitle // ignore: cast_nullable_to_non_nullable
              as String,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotaData implements _NotaData {
  _$_NotaData(this.colorId, this.creationDate, this.id, this.noteContent,
      this.noteTitle, this.userId);

  factory _$_NotaData.fromJson(Map<String, dynamic> json) =>
      _$$_NotaDataFromJson(json);

  @override
  final int colorId;
  @override
  final String creationDate;
  @override
  final String id;
  @override
  final String noteContent;
  @override
  final String noteTitle;
  @override
  final String userId;

  @override
  String toString() {
    return 'NotaData(colorId: $colorId, creationDate: $creationDate, id: $id, noteContent: $noteContent, noteTitle: $noteTitle, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotaData &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.noteContent, noteContent) ||
                other.noteContent == noteContent) &&
            (identical(other.noteTitle, noteTitle) ||
                other.noteTitle == noteTitle) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, colorId, creationDate, id, noteContent, noteTitle, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotaDataCopyWith<_$_NotaData> get copyWith =>
      __$$_NotaDataCopyWithImpl<_$_NotaData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotaDataToJson(
      this,
    );
  }
}

abstract class _NotaData implements NotaData {
  factory _NotaData(
      final int colorId,
      final String creationDate,
      final String id,
      final String noteContent,
      final String noteTitle,
      final String userId) = _$_NotaData;

  factory _NotaData.fromJson(Map<String, dynamic> json) = _$_NotaData.fromJson;

  @override
  int get colorId;
  @override
  String get creationDate;
  @override
  String get id;
  @override
  String get noteContent;
  @override
  String get noteTitle;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_NotaDataCopyWith<_$_NotaData> get copyWith =>
      throw _privateConstructorUsedError;
}
