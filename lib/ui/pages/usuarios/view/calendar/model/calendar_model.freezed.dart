// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarData _$CalendarDataFromJson(Map<String, dynamic> json) {
  return _CalendarData.fromJson(json);
}

/// @nodoc
mixin _$CalendarData {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarDataCopyWith<CalendarData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarDataCopyWith<$Res> {
  factory $CalendarDataCopyWith(
          CalendarData value, $Res Function(CalendarData) then) =
      _$CalendarDataCopyWithImpl<$Res, CalendarData>;
  @useResult
  $Res call({String title, String? description, DateTime date, String id});
}

/// @nodoc
class _$CalendarDataCopyWithImpl<$Res, $Val extends CalendarData>
    implements $CalendarDataCopyWith<$Res> {
  _$CalendarDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarDataCopyWith<$Res>
    implements $CalendarDataCopyWith<$Res> {
  factory _$$_CalendarDataCopyWith(
          _$_CalendarData value, $Res Function(_$_CalendarData) then) =
      __$$_CalendarDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? description, DateTime date, String id});
}

/// @nodoc
class __$$_CalendarDataCopyWithImpl<$Res>
    extends _$CalendarDataCopyWithImpl<$Res, _$_CalendarData>
    implements _$$_CalendarDataCopyWith<$Res> {
  __$$_CalendarDataCopyWithImpl(
      _$_CalendarData _value, $Res Function(_$_CalendarData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? id = null,
  }) {
    return _then(_$_CalendarData(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CalendarData implements _CalendarData {
  _$_CalendarData(this.title, this.description, this.date, this.id);

  factory _$_CalendarData.fromJson(Map<String, dynamic> json) =>
      _$$_CalendarDataFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime date;
  @override
  final String id;

  @override
  String toString() {
    return 'CalendarData(title: $title, description: $description, date: $date, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, date, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarDataCopyWith<_$_CalendarData> get copyWith =>
      __$$_CalendarDataCopyWithImpl<_$_CalendarData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CalendarDataToJson(
      this,
    );
  }
}

abstract class _CalendarData implements CalendarData {
  factory _CalendarData(final String title, final String? description,
      final DateTime date, final String id) = _$_CalendarData;

  factory _CalendarData.fromJson(Map<String, dynamic> json) =
      _$_CalendarData.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get date;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarDataCopyWith<_$_CalendarData> get copyWith =>
      throw _privateConstructorUsedError;
}
