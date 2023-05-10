// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historia_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoriaData _$HistoriaDataFromJson(Map<String, dynamic> json) {
  return _HistoriaData.fromJson(json);
}

/// @nodoc
mixin _$HistoriaData {
  String get edad => throw _privateConstructorUsedError;
  String get estadoCivil => throw _privateConstructorUsedError;
  String get escolaridad => throw _privateConstructorUsedError;
  String get contacto => throw _privateConstructorUsedError;
  String get motivo => throw _privateConstructorUsedError;
  String get antecedentes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoriaDataCopyWith<HistoriaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoriaDataCopyWith<$Res> {
  factory $HistoriaDataCopyWith(
          HistoriaData value, $Res Function(HistoriaData) then) =
      _$HistoriaDataCopyWithImpl<$Res, HistoriaData>;
  @useResult
  $Res call(
      {String edad,
      String estadoCivil,
      String escolaridad,
      String contacto,
      String motivo,
      String antecedentes});
}

/// @nodoc
class _$HistoriaDataCopyWithImpl<$Res, $Val extends HistoriaData>
    implements $HistoriaDataCopyWith<$Res> {
  _$HistoriaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edad = null,
    Object? estadoCivil = null,
    Object? escolaridad = null,
    Object? contacto = null,
    Object? motivo = null,
    Object? antecedentes = null,
  }) {
    return _then(_value.copyWith(
      edad: null == edad
          ? _value.edad
          : edad // ignore: cast_nullable_to_non_nullable
              as String,
      estadoCivil: null == estadoCivil
          ? _value.estadoCivil
          : estadoCivil // ignore: cast_nullable_to_non_nullable
              as String,
      escolaridad: null == escolaridad
          ? _value.escolaridad
          : escolaridad // ignore: cast_nullable_to_non_nullable
              as String,
      contacto: null == contacto
          ? _value.contacto
          : contacto // ignore: cast_nullable_to_non_nullable
              as String,
      motivo: null == motivo
          ? _value.motivo
          : motivo // ignore: cast_nullable_to_non_nullable
              as String,
      antecedentes: null == antecedentes
          ? _value.antecedentes
          : antecedentes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoriaDataCopyWith<$Res>
    implements $HistoriaDataCopyWith<$Res> {
  factory _$$_HistoriaDataCopyWith(
          _$_HistoriaData value, $Res Function(_$_HistoriaData) then) =
      __$$_HistoriaDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String edad,
      String estadoCivil,
      String escolaridad,
      String contacto,
      String motivo,
      String antecedentes});
}

/// @nodoc
class __$$_HistoriaDataCopyWithImpl<$Res>
    extends _$HistoriaDataCopyWithImpl<$Res, _$_HistoriaData>
    implements _$$_HistoriaDataCopyWith<$Res> {
  __$$_HistoriaDataCopyWithImpl(
      _$_HistoriaData _value, $Res Function(_$_HistoriaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? edad = null,
    Object? estadoCivil = null,
    Object? escolaridad = null,
    Object? contacto = null,
    Object? motivo = null,
    Object? antecedentes = null,
  }) {
    return _then(_$_HistoriaData(
      null == edad
          ? _value.edad
          : edad // ignore: cast_nullable_to_non_nullable
              as String,
      null == estadoCivil
          ? _value.estadoCivil
          : estadoCivil // ignore: cast_nullable_to_non_nullable
              as String,
      null == escolaridad
          ? _value.escolaridad
          : escolaridad // ignore: cast_nullable_to_non_nullable
              as String,
      null == contacto
          ? _value.contacto
          : contacto // ignore: cast_nullable_to_non_nullable
              as String,
      null == motivo
          ? _value.motivo
          : motivo // ignore: cast_nullable_to_non_nullable
              as String,
      null == antecedentes
          ? _value.antecedentes
          : antecedentes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoriaData implements _HistoriaData {
  _$_HistoriaData(this.edad, this.estadoCivil, this.escolaridad, this.contacto,
      this.motivo, this.antecedentes);

  factory _$_HistoriaData.fromJson(Map<String, dynamic> json) =>
      _$$_HistoriaDataFromJson(json);

  @override
  final String edad;
  @override
  final String estadoCivil;
  @override
  final String escolaridad;
  @override
  final String contacto;
  @override
  final String motivo;
  @override
  final String antecedentes;

  @override
  String toString() {
    return 'HistoriaData(edad: $edad, estadoCivil: $estadoCivil, escolaridad: $escolaridad, contacto: $contacto, motivo: $motivo, antecedentes: $antecedentes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoriaData &&
            (identical(other.edad, edad) || other.edad == edad) &&
            (identical(other.estadoCivil, estadoCivil) ||
                other.estadoCivil == estadoCivil) &&
            (identical(other.escolaridad, escolaridad) ||
                other.escolaridad == escolaridad) &&
            (identical(other.contacto, contacto) ||
                other.contacto == contacto) &&
            (identical(other.motivo, motivo) || other.motivo == motivo) &&
            (identical(other.antecedentes, antecedentes) ||
                other.antecedentes == antecedentes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, edad, estadoCivil, escolaridad,
      contacto, motivo, antecedentes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoriaDataCopyWith<_$_HistoriaData> get copyWith =>
      __$$_HistoriaDataCopyWithImpl<_$_HistoriaData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoriaDataToJson(
      this,
    );
  }
}

abstract class _HistoriaData implements HistoriaData {
  factory _HistoriaData(
      final String edad,
      final String estadoCivil,
      final String escolaridad,
      final String contacto,
      final String motivo,
      final String antecedentes) = _$_HistoriaData;

  factory _HistoriaData.fromJson(Map<String, dynamic> json) =
      _$_HistoriaData.fromJson;

  @override
  String get edad;
  @override
  String get estadoCivil;
  @override
  String get escolaridad;
  @override
  String get contacto;
  @override
  String get motivo;
  @override
  String get antecedentes;
  @override
  @JsonKey(ignore: true)
  _$$_HistoriaDataCopyWith<_$_HistoriaData> get copyWith =>
      throw _privateConstructorUsedError;
}
