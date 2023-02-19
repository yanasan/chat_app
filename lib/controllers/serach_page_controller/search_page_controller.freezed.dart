// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchPageState {
  User get user => throw _privateConstructorUsedError;
  List<Friends> get friends => throw _privateConstructorUsedError;
  Query<Map<String, dynamic>> get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPageStateCopyWith<SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageStateCopyWith<$Res> {
  factory $SearchPageStateCopyWith(
          SearchPageState value, $Res Function(SearchPageState) then) =
      _$SearchPageStateCopyWithImpl<$Res, SearchPageState>;
  @useResult
  $Res call(
      {User user, List<Friends> friends, Query<Map<String, dynamic>> query});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SearchPageStateCopyWithImpl<$Res, $Val extends SearchPageState>
    implements $SearchPageStateCopyWith<$Res> {
  _$SearchPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? friends = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friends>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Query<Map<String, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchPageStateCopyWith<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  factory _$$_SearchPageStateCopyWith(
          _$_SearchPageState value, $Res Function(_$_SearchPageState) then) =
      __$$_SearchPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user, List<Friends> friends, Query<Map<String, dynamic>> query});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_SearchPageStateCopyWithImpl<$Res>
    extends _$SearchPageStateCopyWithImpl<$Res, _$_SearchPageState>
    implements _$$_SearchPageStateCopyWith<$Res> {
  __$$_SearchPageStateCopyWithImpl(
      _$_SearchPageState _value, $Res Function(_$_SearchPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? friends = null,
    Object? query = null,
  }) {
    return _then(_$_SearchPageState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friends>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as Query<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_SearchPageState implements _SearchPageState {
  const _$_SearchPageState(
      {this.user = const User(),
      final List<Friends> friends = const [],
      required this.query})
      : _friends = friends;

  @override
  @JsonKey()
  final User user;
  final List<Friends> _friends;
  @override
  @JsonKey()
  List<Friends> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  final Query<Map<String, dynamic>> query;

  @override
  String toString() {
    return 'SearchPageState(user: $user, friends: $friends, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPageState &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(_friends), query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchPageStateCopyWith<_$_SearchPageState> get copyWith =>
      __$$_SearchPageStateCopyWithImpl<_$_SearchPageState>(this, _$identity);
}

abstract class _SearchPageState implements SearchPageState {
  const factory _SearchPageState(
      {final User user,
      final List<Friends> friends,
      required final Query<Map<String, dynamic>> query}) = _$_SearchPageState;

  @override
  User get user;
  @override
  List<Friends> get friends;
  @override
  Query<Map<String, dynamic>> get query;
  @override
  @JsonKey(ignore: true)
  _$$_SearchPageStateCopyWith<_$_SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
