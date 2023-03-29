// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tips_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TipsData _$TipsDataFromJson(Map<String, dynamic> json) {
  return _TipsData.fromJson(json);
}

/// @nodoc
mixin _$TipsData {
  int get colorId => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get tipContent => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get pacienteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipsDataCopyWith<TipsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsDataCopyWith<$Res> {
  factory $TipsDataCopyWith(TipsData value, $Res Function(TipsData) then) =
      _$TipsDataCopyWithImpl<$Res, TipsData>;
  @useResult
  $Res call(
      {int colorId,
      String creationDate,
      String id,
      String tipContent,
      String userId,
      String pacienteId});
}

/// @nodoc
class _$TipsDataCopyWithImpl<$Res, $Val extends TipsData>
    implements $TipsDataCopyWith<$Res> {
  _$TipsDataCopyWithImpl(this._value, this._then);

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
    Object? tipContent = null,
    Object? userId = null,
    Object? pacienteId = null,
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
      tipContent: null == tipContent
          ? _value.tipContent
          : tipContent // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pacienteId: null == pacienteId
          ? _value.pacienteId
          : pacienteId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipsDataCopyWith<$Res> implements $TipsDataCopyWith<$Res> {
  factory _$$_TipsDataCopyWith(
          _$_TipsData value, $Res Function(_$_TipsData) then) =
      __$$_TipsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int colorId,
      String creationDate,
      String id,
      String tipContent,
      String userId,
      String pacienteId});
}

/// @nodoc
class __$$_TipsDataCopyWithImpl<$Res>
    extends _$TipsDataCopyWithImpl<$Res, _$_TipsData>
    implements _$$_TipsDataCopyWith<$Res> {
  __$$_TipsDataCopyWithImpl(
      _$_TipsData _value, $Res Function(_$_TipsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? creationDate = null,
    Object? id = null,
    Object? tipContent = null,
    Object? userId = null,
    Object? pacienteId = null,
  }) {
    return _then(_$_TipsData(
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
      null == tipContent
          ? _value.tipContent
          : tipContent // ignore: cast_nullable_to_non_nullable
              as String,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      null == pacienteId
          ? _value.pacienteId
          : pacienteId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipsData implements _TipsData {
  _$_TipsData(this.colorId, this.creationDate, this.id, this.tipContent,
      this.userId, this.pacienteId);

  factory _$_TipsData.fromJson(Map<String, dynamic> json) =>
      _$$_TipsDataFromJson(json);

  @override
  final int colorId;
  @override
  final String creationDate;
  @override
  final String id;
  @override
  final String tipContent;
  @override
  final String userId;
  @override
  final String pacienteId;

  @override
  String toString() {
    return 'TipsData(colorId: $colorId, creationDate: $creationDate, id: $id, tipContent: $tipContent, userId: $userId, pacienteId: $pacienteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TipsData &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tipContent, tipContent) ||
                other.tipContent == tipContent) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pacienteId, pacienteId) ||
                other.pacienteId == pacienteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, colorId, creationDate, id, tipContent, userId, pacienteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipsDataCopyWith<_$_TipsData> get copyWith =>
      __$$_TipsDataCopyWithImpl<_$_TipsData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TipsDataToJson(
      this,
    );
  }
}

abstract class _TipsData implements TipsData {
  factory _TipsData(
      final int colorId,
      final String creationDate,
      final String id,
      final String tipContent,
      final String userId,
      final String pacienteId) = _$_TipsData;

  factory _TipsData.fromJson(Map<String, dynamic> json) = _$_TipsData.fromJson;

  @override
  int get colorId;
  @override
  String get creationDate;
  @override
  String get id;
  @override
  String get tipContent;
  @override
  String get userId;
  @override
  String get pacienteId;
  @override
  @JsonKey(ignore: true)
  _$$_TipsDataCopyWith<_$_TipsData> get copyWith =>
      throw _privateConstructorUsedError;
}
