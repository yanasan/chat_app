// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatPageState {
  int get tabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatPageStateCopyWith<ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageStateCopyWith<$Res> {
  factory $ChatPageStateCopyWith(
          ChatPageState value, $Res Function(ChatPageState) then) =
      _$ChatPageStateCopyWithImpl<$Res, ChatPageState>;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class _$ChatPageStateCopyWithImpl<$Res, $Val extends ChatPageState>
    implements $ChatPageStateCopyWith<$Res> {
  _$ChatPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_value.copyWith(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RootPageStateCopyWith<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  factory _$$_RootPageStateCopyWith(
          _$_RootPageState value, $Res Function(_$_RootPageState) then) =
      __$$_RootPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$$_RootPageStateCopyWithImpl<$Res>
    extends _$ChatPageStateCopyWithImpl<$Res, _$_RootPageState>
    implements _$$_RootPageStateCopyWith<$Res> {
  __$$_RootPageStateCopyWithImpl(
      _$_RootPageState _value, $Res Function(_$_RootPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_$_RootPageState(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RootPageState implements _RootPageState {
  const _$_RootPageState({this.tabIndex = 0});

  @override
  @JsonKey()
  final int tabIndex;

  @override
  String toString() {
    return 'ChatPageState(tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RootPageState &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RootPageStateCopyWith<_$_RootPageState> get copyWith =>
      __$$_RootPageStateCopyWithImpl<_$_RootPageState>(this, _$identity);
}

abstract class _RootPageState implements ChatPageState {
  const factory _RootPageState({final int tabIndex}) = _$_RootPageState;

  @override
  int get tabIndex;
  @override
  @JsonKey(ignore: true)
  _$$_RootPageStateCopyWith<_$_RootPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
