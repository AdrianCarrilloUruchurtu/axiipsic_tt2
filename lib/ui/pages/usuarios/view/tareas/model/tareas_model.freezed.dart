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
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get owners => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;

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
      {String title, String content, List<String> owners, String creationDate});
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
    Object? title = null,
    Object? content = null,
    Object? owners = null,
    Object? creationDate = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      owners: null == owners
          ? _value.owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
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
      {String title, String content, List<String> owners, String creationDate});
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
    Object? title = null,
    Object? content = null,
    Object? owners = null,
    Object? creationDate = null,
  }) {
    return _then(_$_TareasData(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      null == owners
          ? _value._owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TareasData implements _TareasData {
  _$_TareasData(
      this.title, this.content, final List<String> owners, this.creationDate)
      : _owners = owners;

  factory _$_TareasData.fromJson(Map<String, dynamic> json) =>
      _$$_TareasDataFromJson(json);

  @override
  final String title;
  @override
  final String content;
  final List<String> _owners;
  @override
  List<String> get owners {
    if (_owners is EqualUnmodifiableListView) return _owners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_owners);
  }

  @override
  final String creationDate;

  @override
  String toString() {
    return 'TareasData(title: $title, content: $content, owners: $owners, creationDate: $creationDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TareasData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._owners, _owners) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content,
      const DeepCollectionEquality().hash(_owners), creationDate);

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
  factory _TareasData(final String title, final String content,
      final List<String> owners, final String creationDate) = _$_TareasData;

  factory _TareasData.fromJson(Map<String, dynamic> json) =
      _$_TareasData.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  List<String> get owners;
  @override
  String get creationDate;
  @override
  @JsonKey(ignore: true)
  _$$_TareasDataCopyWith<_$_TareasData> get copyWith =>
      throw _privateConstructorUsedError;
}
