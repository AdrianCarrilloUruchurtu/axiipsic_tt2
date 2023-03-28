// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tareas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TareasData _$TareasDataFromJson(Map<String, dynamic> json) {
  return _TareasData.fromJson(json);
}

/// @nodoc
mixin _$TareasData {
  int get colorId => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get tareaContent => throw _privateConstructorUsedError;
  String get tareaTitle => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get pacienteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TareasDataCopyWith<TareasData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TareasDataCopyWith<$Res> {
  factory $TareasDataCopyWith(
          TareasData value, $Res Function(TareasData) then) =
      _$TareasDataCopyWithImpl<$Res, TareasData>;
  @useResult
  $Res call(
      {int colorId,
      String creationDate,
      String id,
      String tareaContent,
      String tareaTitle,
      String userId,
      String pacienteId});
}

/// @nodoc
class _$TareasDataCopyWithImpl<$Res, $Val extends TareasData>
    implements $TareasDataCopyWith<$Res> {
  _$TareasDataCopyWithImpl(this._value, this._then);

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
    Object? tareaContent = null,
    Object? tareaTitle = null,
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
      tareaContent: null == tareaContent
          ? _value.tareaContent
          : tareaContent // ignore: cast_nullable_to_non_nullable
              as String,
      tareaTitle: null == tareaTitle
          ? _value.tareaTitle
          : tareaTitle // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TareasDataCopyWith<$Res>
    implements $TareasDataCopyWith<$Res> {
  factory _$$_TareasDataCopyWith(
          _$_TareasData value, $Res Function(_$_TareasData) then) =
      __$$_TareasDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int colorId,
      String creationDate,
      String id,
      String tareaContent,
      String tareaTitle,
      String userId,
      String pacienteId});
}

/// @nodoc
class __$$_TareasDataCopyWithImpl<$Res>
    extends _$TareasDataCopyWithImpl<$Res, _$_TareasData>
    implements _$$_TareasDataCopyWith<$Res> {
  __$$_TareasDataCopyWithImpl(
      _$_TareasData _value, $Res Function(_$_TareasData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? creationDate = null,
    Object? id = null,
    Object? tareaContent = null,
    Object? tareaTitle = null,
    Object? userId = null,
    Object? pacienteId = null,
  }) {
    return _then(_$_TareasData(
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
      null == tareaContent
          ? _value.tareaContent
          : tareaContent // ignore: cast_nullable_to_non_nullable
              as String,
      null == tareaTitle
          ? _value.tareaTitle
          : tareaTitle // ignore: cast_nullable_to_non_nullable
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
class _$_TareasData implements _TareasData {
  _$_TareasData(this.colorId, this.creationDate, this.id, this.tareaContent,
      this.tareaTitle, this.userId, this.pacienteId);

  factory _$_TareasData.fromJson(Map<String, dynamic> json) =>
      _$$_TareasDataFromJson(json);

  @override
  final int colorId;
  @override
  final String creationDate;
  @override
  final String id;
  @override
  final String tareaContent;
  @override
  final String tareaTitle;
  @override
  final String userId;
  @override
  final String pacienteId;

  @override
  String toString() {
    return 'TareasData(colorId: $colorId, creationDate: $creationDate, id: $id, tareaContent: $tareaContent, tareaTitle: $tareaTitle, userId: $userId, pacienteId: $pacienteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TareasData &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tareaContent, tareaContent) ||
                other.tareaContent == tareaContent) &&
            (identical(other.tareaTitle, tareaTitle) ||
                other.tareaTitle == tareaTitle) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pacienteId, pacienteId) ||
                other.pacienteId == pacienteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, colorId, creationDate, id,
      tareaContent, tareaTitle, userId, pacienteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TareasDataCopyWith<_$_TareasData> get copyWith =>
      __$$_TareasDataCopyWithImpl<_$_TareasData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TareasDataToJson(
      this,
    );
  }
}

abstract class _TareasData implements TareasData {
  factory _TareasData(
      final int colorId,
      final String creationDate,
      final String id,
      final String tareaContent,
      final String tareaTitle,
      final String userId,
      final String pacienteId) = _$_TareasData;

  factory _TareasData.fromJson(Map<String, dynamic> json) =
      _$_TareasData.fromJson;

  @override
  int get colorId;
  @override
  String get creationDate;
  @override
  String get id;
  @override
  String get tareaContent;
  @override
  String get tareaTitle;
  @override
  String get userId;
  @override
  String get pacienteId;
  @override
  @JsonKey(ignore: true)
  _$$_TareasDataCopyWith<_$_TareasData> get copyWith =>
      throw _privateConstructorUsedError;
}
