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
  String get creationDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get tipContent => throw _privateConstructorUsedError;
  List<String> get owners => throw _privateConstructorUsedError;

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
      {String creationDate, String id, String tipContent, List<String> owners});
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
    Object? creationDate = null,
    Object? id = null,
    Object? tipContent = null,
    Object? owners = null,
  }) {
    return _then(_value.copyWith(
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
      owners: null == owners
          ? _value.owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String creationDate, String id, String tipContent, List<String> owners});
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
    Object? creationDate = null,
    Object? id = null,
    Object? tipContent = null,
    Object? owners = null,
  }) {
    return _then(_$_TipsData(
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
      null == owners
          ? _value._owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipsData implements _TipsData {
  _$_TipsData(
      this.creationDate, this.id, this.tipContent, final List<String> owners)
      : _owners = owners;

  factory _$_TipsData.fromJson(Map<String, dynamic> json) =>
      _$$_TipsDataFromJson(json);

  @override
  final String creationDate;
  @override
  final String id;
  @override
  final String tipContent;
  final List<String> _owners;
  @override
  List<String> get owners {
    if (_owners is EqualUnmodifiableListView) return _owners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_owners);
  }

  @override
  String toString() {
    return 'TipsData(creationDate: $creationDate, id: $id, tipContent: $tipContent, owners: $owners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TipsData &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tipContent, tipContent) ||
                other.tipContent == tipContent) &&
            const DeepCollectionEquality().equals(other._owners, _owners));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, creationDate, id, tipContent,
      const DeepCollectionEquality().hash(_owners));

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
  factory _TipsData(final String creationDate, final String id,
      final String tipContent, final List<String> owners) = _$_TipsData;

  factory _TipsData.fromJson(Map<String, dynamic> json) = _$_TipsData.fromJson;

  @override
  String get creationDate;
  @override
  String get id;
  @override
  String get tipContent;
  @override
  List<String> get owners;
  @override
  @JsonKey(ignore: true)
  _$$_TipsDataCopyWith<_$_TipsData> get copyWith =>
      throw _privateConstructorUsedError;
}
