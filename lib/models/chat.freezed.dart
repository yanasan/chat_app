// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  List<String> get member => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  @FireTimestampConverterNonNull()
  DateTime get update => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {List<String> member,
      String roomId,
      @FireTimestampConverterNonNull() DateTime update});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? roomId = null,
    Object? update = null,
  }) {
    return _then(_value.copyWith(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String>,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> member,
      String roomId,
      @FireTimestampConverterNonNull() DateTime update});
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? roomId = null,
    Object? update = null,
  }) {
    return _then(_$_Chat(
      member: null == member
          ? _value._member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String>,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat extends _Chat {
  const _$_Chat(
      {final List<String> member = const [],
      this.roomId = '',
      @FireTimestampConverterNonNull() required this.update})
      : _member = member,
        super._();

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  final List<String> _member;
  @override
  @JsonKey()
  List<String> get member {
    if (_member is EqualUnmodifiableListView) return _member;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_member);
  }

  @override
  @JsonKey()
  final String roomId;
  @override
  @FireTimestampConverterNonNull()
  final DateTime update;

  @override
  String toString() {
    return 'Chat(member: $member, roomId: $roomId, update: $update)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            const DeepCollectionEquality().equals(other._member, _member) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.update, update) || other.update == update));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_member), roomId, update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatToJson(
      this,
    );
  }
}

abstract class _Chat extends Chat {
  const factory _Chat(
          {final List<String> member,
          final String roomId,
          @FireTimestampConverterNonNull() required final DateTime update}) =
      _$_Chat;
  const _Chat._() : super._();

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  List<String> get member;
  @override
  String get roomId;
  @override
  @FireTimestampConverterNonNull()
  DateTime get update;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
