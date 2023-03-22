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

Friends _$FriendsFromJson(Map<String, dynamic> json) {
  return _Friends.fromJson(json);
}

/// @nodoc
mixin _$Friends {
  List<String> get member => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  @FireTimestampConverterNonNull()
  DateTime get created => throw _privateConstructorUsedError;
  List<Message> get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendsCopyWith<Friends> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsCopyWith<$Res> {
  factory $FriendsCopyWith(Friends value, $Res Function(Friends) then) =
      _$FriendsCopyWithImpl<$Res, Friends>;
  @useResult
  $Res call(
      {List<String> member,
      String roomId,
      @FireTimestampConverterNonNull() DateTime created,
      List<Message> message});
}

/// @nodoc
class _$FriendsCopyWithImpl<$Res, $Val extends Friends>
    implements $FriendsCopyWith<$Res> {
  _$FriendsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? roomId = null,
    Object? created = null,
    Object? message = null,
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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FriendsCopyWith<$Res> implements $FriendsCopyWith<$Res> {
  factory _$$_FriendsCopyWith(
          _$_Friends value, $Res Function(_$_Friends) then) =
      __$$_FriendsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> member,
      String roomId,
      @FireTimestampConverterNonNull() DateTime created,
      List<Message> message});
}

/// @nodoc
class __$$_FriendsCopyWithImpl<$Res>
    extends _$FriendsCopyWithImpl<$Res, _$_Friends>
    implements _$$_FriendsCopyWith<$Res> {
  __$$_FriendsCopyWithImpl(_$_Friends _value, $Res Function(_$_Friends) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? roomId = null,
    Object? created = null,
    Object? message = null,
  }) {
    return _then(_$_Friends(
      member: null == member
          ? _value._member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String>,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Friends extends _Friends {
  const _$_Friends(
      {final List<String> member = const [],
      this.roomId = '',
      @FireTimestampConverterNonNull() required this.created,
      final List<Message> message = const []})
      : _member = member,
        _message = message,
        super._();

  factory _$_Friends.fromJson(Map<String, dynamic> json) =>
      _$$_FriendsFromJson(json);

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
  final DateTime created;
  final List<Message> _message;
  @override
  @JsonKey()
  List<Message> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  String toString() {
    return 'Friends(member: $member, roomId: $roomId, created: $created, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Friends &&
            const DeepCollectionEquality().equals(other._member, _member) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.created, created) || other.created == created) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_member),
      roomId,
      created,
      const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FriendsCopyWith<_$_Friends> get copyWith =>
      __$$_FriendsCopyWithImpl<_$_Friends>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendsToJson(
      this,
    );
  }
}

abstract class _Friends extends Friends {
  const factory _Friends(
      {final List<String> member,
      final String roomId,
      @FireTimestampConverterNonNull() required final DateTime created,
      final List<Message> message}) = _$_Friends;
  const _Friends._() : super._();

  factory _Friends.fromJson(Map<String, dynamic> json) = _$_Friends.fromJson;

  @override
  List<String> get member;
  @override
  String get roomId;
  @override
  @FireTimestampConverterNonNull()
  DateTime get created;
  @override
  List<Message> get message;
  @override
  @JsonKey(ignore: true)
  _$$_FriendsCopyWith<_$_Friends> get copyWith =>
      throw _privateConstructorUsedError;
}
