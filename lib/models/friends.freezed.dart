// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends.dart';

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
  String get id => throw _privateConstructorUsedError;
  String get pathId => throw _privateConstructorUsedError;
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
  $Res call({String id, String pathId, List<Message> message});
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
    Object? id = null,
    Object? pathId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pathId: null == pathId
          ? _value.pathId
          : pathId // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String id, String pathId, List<Message> message});
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
    Object? id = null,
    Object? pathId = null,
    Object? message = null,
  }) {
    return _then(_$_Friends(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pathId: null == pathId
          ? _value.pathId
          : pathId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {this.id = '', this.pathId = '', final List<Message> message = const []})
      : _message = message,
        super._();

  factory _$_Friends.fromJson(Map<String, dynamic> json) =>
      _$$_FriendsFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String pathId;
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
    return 'Friends(id: $id, pathId: $pathId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Friends &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pathId, pathId) || other.pathId == pathId) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, pathId, const DeepCollectionEquality().hash(_message));

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
      {final String id,
      final String pathId,
      final List<Message> message}) = _$_Friends;
  const _Friends._() : super._();

  factory _Friends.fromJson(Map<String, dynamic> json) = _$_Friends.fromJson;

  @override
  String get id;
  @override
  String get pathId;
  @override
  List<Message> get message;
  @override
  @JsonKey(ignore: true)
  _$$_FriendsCopyWith<_$_Friends> get copyWith =>
      throw _privateConstructorUsedError;
}
