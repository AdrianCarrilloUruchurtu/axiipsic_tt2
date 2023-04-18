// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sesiones_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SesionesData _$SesionesDataFromJson(Map<String, dynamic> json) {
  return _SesionesData.fromJson(json);
}

/// @nodoc
mixin _$SesionesData {
  int get id => throw _privateConstructorUsedError;
  List<String> get owners => throw _privateConstructorUsedError;
  List<int> get rapport => throw _privateConstructorUsedError;
  List<int> get evaluacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SesionesDataCopyWith<SesionesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SesionesDataCopyWith<$Res> {
  factory $SesionesDataCopyWith(
          SesionesData value, $Res Function(SesionesData) then) =
      _$SesionesDataCopyWithImpl<$Res, SesionesData>;
  @useResult
  $Res call(
      {int id, List<String> owners, List<int> rapport, List<int> evaluacion});
}

/// @nodoc
class _$SesionesDataCopyWithImpl<$Res, $Val extends SesionesData>
    implements $SesionesDataCopyWith<$Res> {
  _$SesionesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owners = null,
    Object? rapport = null,
    Object? evaluacion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      owners: null == owners
          ? _value.owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rapport: null == rapport
          ? _value.rapport
          : rapport // ignore: cast_nullable_to_non_nullable
              as List<int>,
      evaluacion: null == evaluacion
          ? _value.evaluacion
          : evaluacion // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SesionesDataCopyWith<$Res>
    implements $SesionesDataCopyWith<$Res> {
  factory _$$_SesionesDataCopyWith(
          _$_SesionesData value, $Res Function(_$_SesionesData) then) =
      __$$_SesionesDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, List<String> owners, List<int> rapport, List<int> evaluacion});
}

/// @nodoc
class __$$_SesionesDataCopyWithImpl<$Res>
    extends _$SesionesDataCopyWithImpl<$Res, _$_SesionesData>
    implements _$$_SesionesDataCopyWith<$Res> {
  __$$_SesionesDataCopyWithImpl(
      _$_SesionesData _value, $Res Function(_$_SesionesData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owners = null,
    Object? rapport = null,
    Object? evaluacion = null,
  }) {
    return _then(_$_SesionesData(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == owners
          ? _value._owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == rapport
          ? _value._rapport
          : rapport // ignore: cast_nullable_to_non_nullable
              as List<int>,
      null == evaluacion
          ? _value._evaluacion
          : evaluacion // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SesionesData implements _SesionesData {
  _$_SesionesData(this.id, final List<String> owners, final List<int> rapport,
      final List<int> evaluacion)
      : _owners = owners,
        _rapport = rapport,
        _evaluacion = evaluacion;

  factory _$_SesionesData.fromJson(Map<String, dynamic> json) =>
      _$$_SesionesDataFromJson(json);

  @override
  final int id;
  final List<String> _owners;
  @override
  List<String> get owners {
    if (_owners is EqualUnmodifiableListView) return _owners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_owners);
  }

  final List<int> _rapport;
  @override
  List<int> get rapport {
    if (_rapport is EqualUnmodifiableListView) return _rapport;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rapport);
  }

  final List<int> _evaluacion;
  @override
  List<int> get evaluacion {
    if (_evaluacion is EqualUnmodifiableListView) return _evaluacion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evaluacion);
  }

  @override
  String toString() {
    return 'SesionesData(id: $id, owners: $owners, rapport: $rapport, evaluacion: $evaluacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SesionesData &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._owners, _owners) &&
            const DeepCollectionEquality().equals(other._rapport, _rapport) &&
            const DeepCollectionEquality()
                .equals(other._evaluacion, _evaluacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_owners),
      const DeepCollectionEquality().hash(_rapport),
      const DeepCollectionEquality().hash(_evaluacion));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SesionesDataCopyWith<_$_SesionesData> get copyWith =>
      __$$_SesionesDataCopyWithImpl<_$_SesionesData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SesionesDataToJson(
      this,
    );
  }
}

abstract class _SesionesData implements SesionesData {
  factory _SesionesData(final int id, final List<String> owners,
      final List<int> rapport, final List<int> evaluacion) = _$_SesionesData;

  factory _SesionesData.fromJson(Map<String, dynamic> json) =
      _$_SesionesData.fromJson;

  @override
  int get id;
  @override
  List<String> get owners;
  @override
  List<int> get rapport;
  @override
  List<int> get evaluacion;
  @override
  @JsonKey(ignore: true)
  _$$_SesionesDataCopyWith<_$_SesionesData> get copyWith =>
      throw _privateConstructorUsedError;
}
