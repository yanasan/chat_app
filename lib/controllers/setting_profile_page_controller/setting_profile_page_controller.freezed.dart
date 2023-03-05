// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_profile_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingProfilePageState {
  User get user => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingProfilePageStateCopyWith<SettingProfilePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingProfilePageStateCopyWith<$Res> {
  factory $SettingProfilePageStateCopyWith(SettingProfilePageState value,
          $Res Function(SettingProfilePageState) then) =
      _$SettingProfilePageStateCopyWithImpl<$Res, SettingProfilePageState>;
  @useResult
  $Res call({User user, File? file});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SettingProfilePageStateCopyWithImpl<$Res,
        $Val extends SettingProfilePageState>
    implements $SettingProfilePageStateCopyWith<$Res> {
  _$SettingProfilePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
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
abstract class _$$_SettingProfilePageStateCopyWith<$Res>
    implements $SettingProfilePageStateCopyWith<$Res> {
  factory _$$_SettingProfilePageStateCopyWith(_$_SettingProfilePageState value,
          $Res Function(_$_SettingProfilePageState) then) =
      __$$_SettingProfilePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, File? file});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_SettingProfilePageStateCopyWithImpl<$Res>
    extends _$SettingProfilePageStateCopyWithImpl<$Res,
        _$_SettingProfilePageState>
    implements _$$_SettingProfilePageStateCopyWith<$Res> {
  __$$_SettingProfilePageStateCopyWithImpl(_$_SettingProfilePageState _value,
      $Res Function(_$_SettingProfilePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? file = freezed,
  }) {
    return _then(_$_SettingProfilePageState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_SettingProfilePageState implements _SettingProfilePageState {
  const _$_SettingProfilePageState({required this.user, this.file});

  @override
  final User user;
  @override
  final File? file;

  @override
  String toString() {
    return 'SettingProfilePageState(user: $user, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingProfilePageState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingProfilePageStateCopyWith<_$_SettingProfilePageState>
      get copyWith =>
          __$$_SettingProfilePageStateCopyWithImpl<_$_SettingProfilePageState>(
              this, _$identity);
}

abstract class _SettingProfilePageState implements SettingProfilePageState {
  const factory _SettingProfilePageState(
      {required final User user,
      final File? file}) = _$_SettingProfilePageState;

  @override
  User get user;
  @override
  File? get file;
  @override
  @JsonKey(ignore: true)
  _$$_SettingProfilePageStateCopyWith<_$_SettingProfilePageState>
      get copyWith => throw _privateConstructorUsedError;
}
