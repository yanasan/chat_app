// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageState {
  List<Friends> get friendslist => throw _privateConstructorUsedError;
  List<User> get friendsData => throw _privateConstructorUsedError;
  List<Chat> get chatList => throw _privateConstructorUsedError;
  Chat? get chat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {List<Friends> friendslist,
      List<User> friendsData,
      List<Chat> chatList,
      Chat? chat});

  $ChatCopyWith<$Res>? get chat;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendslist = null,
    Object? friendsData = null,
    Object? chatList = null,
    Object? chat = freezed,
  }) {
    return _then(_value.copyWith(
      friendslist: null == friendslist
          ? _value.friendslist
          : friendslist // ignore: cast_nullable_to_non_nullable
              as List<Friends>,
      friendsData: null == friendsData
          ? _value.friendsData
          : friendsData // ignore: cast_nullable_to_non_nullable
              as List<User>,
      chatList: null == chatList
          ? _value.chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res>? get chat {
    if (_value.chat == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.chat!, (value) {
      return _then(_value.copyWith(chat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Friends> friendslist,
      List<User> friendsData,
      List<Chat> chatList,
      Chat? chat});

  @override
  $ChatCopyWith<$Res>? get chat;
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HomePageState>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendslist = null,
    Object? friendsData = null,
    Object? chatList = null,
    Object? chat = freezed,
  }) {
    return _then(_$_HomePageState(
      friendslist: null == friendslist
          ? _value._friendslist
          : friendslist // ignore: cast_nullable_to_non_nullable
              as List<Friends>,
      friendsData: null == friendsData
          ? _value._friendsData
          : friendsData // ignore: cast_nullable_to_non_nullable
              as List<User>,
      chatList: null == chatList
          ? _value._chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ));
  }
}

/// @nodoc

class _$_HomePageState implements _HomePageState {
  const _$_HomePageState(
      {final List<Friends> friendslist = const [],
      final List<User> friendsData = const [],
      final List<Chat> chatList = const [],
      this.chat})
      : _friendslist = friendslist,
        _friendsData = friendsData,
        _chatList = chatList;

  final List<Friends> _friendslist;
  @override
  @JsonKey()
  List<Friends> get friendslist {
    if (_friendslist is EqualUnmodifiableListView) return _friendslist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendslist);
  }

  final List<User> _friendsData;
  @override
  @JsonKey()
  List<User> get friendsData {
    if (_friendsData is EqualUnmodifiableListView) return _friendsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendsData);
  }

  final List<Chat> _chatList;
  @override
  @JsonKey()
  List<Chat> get chatList {
    if (_chatList is EqualUnmodifiableListView) return _chatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatList);
  }

  @override
  final Chat? chat;

  @override
  String toString() {
    return 'HomePageState(friendslist: $friendslist, friendsData: $friendsData, chatList: $chatList, chat: $chat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            const DeepCollectionEquality()
                .equals(other._friendslist, _friendslist) &&
            const DeepCollectionEquality()
                .equals(other._friendsData, _friendsData) &&
            const DeepCollectionEquality().equals(other._chatList, _chatList) &&
            (identical(other.chat, chat) || other.chat == chat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friendslist),
      const DeepCollectionEquality().hash(_friendsData),
      const DeepCollectionEquality().hash(_chatList),
      chat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final List<Friends> friendslist,
      final List<User> friendsData,
      final List<Chat> chatList,
      final Chat? chat}) = _$_HomePageState;

  @override
  List<Friends> get friendslist;
  @override
  List<User> get friendsData;
  @override
  List<Chat> get chatList;
  @override
  Chat? get chat;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
