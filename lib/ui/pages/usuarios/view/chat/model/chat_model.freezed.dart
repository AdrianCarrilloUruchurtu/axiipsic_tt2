// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatData _$ChatDataFromJson(Map<String, dynamic> json) {
  return _ChatData.fromJson(json);
}

/// @nodoc
mixin _$ChatData {
  String get senderId => throw _privateConstructorUsedError;
  String get recieverId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDataCopyWith<ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDataCopyWith<$Res> {
  factory $ChatDataCopyWith(ChatData value, $Res Function(ChatData) then) =
      _$ChatDataCopyWithImpl<$Res, ChatData>;
  @useResult
  $Res call(
      {String senderId,
      String recieverId,
      String message,
      String type,
      DateTime date});
}

/// @nodoc
class _$ChatDataCopyWithImpl<$Res, $Val extends ChatData>
    implements $ChatDataCopyWith<$Res> {
  _$ChatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? recieverId = null,
    Object? message = null,
    Object? type = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverId: null == recieverId
          ? _value.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatDataCopyWith<$Res> implements $ChatDataCopyWith<$Res> {
  factory _$$_ChatDataCopyWith(
          _$_ChatData value, $Res Function(_$_ChatData) then) =
      __$$_ChatDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderId,
      String recieverId,
      String message,
      String type,
      DateTime date});
}

/// @nodoc
class __$$_ChatDataCopyWithImpl<$Res>
    extends _$ChatDataCopyWithImpl<$Res, _$_ChatData>
    implements _$$_ChatDataCopyWith<$Res> {
  __$$_ChatDataCopyWithImpl(
      _$_ChatData _value, $Res Function(_$_ChatData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? recieverId = null,
    Object? message = null,
    Object? type = null,
    Object? date = null,
  }) {
    return _then(_$_ChatData(
      null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      null == recieverId
          ? _value.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatData implements _ChatData {
  _$_ChatData(
      this.senderId, this.recieverId, this.message, this.type, this.date);

  factory _$_ChatData.fromJson(Map<String, dynamic> json) =>
      _$$_ChatDataFromJson(json);

  @override
  final String senderId;
  @override
  final String recieverId;
  @override
  final String message;
  @override
  final String type;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ChatData(senderId: $senderId, recieverId: $recieverId, message: $message, type: $type, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatData &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recieverId, recieverId) ||
                other.recieverId == recieverId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderId, recieverId, message, type, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatDataCopyWith<_$_ChatData> get copyWith =>
      __$$_ChatDataCopyWithImpl<_$_ChatData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatDataToJson(
      this,
    );
  }
}

abstract class _ChatData implements ChatData {
  factory _ChatData(
      final String senderId,
      final String recieverId,
      final String message,
      final String type,
      final DateTime date) = _$_ChatData;

  factory _ChatData.fromJson(Map<String, dynamic> json) = _$_ChatData.fromJson;

  @override
  String get senderId;
  @override
  String get recieverId;
  @override
  String get message;
  @override
  String get type;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ChatDataCopyWith<_$_ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}
