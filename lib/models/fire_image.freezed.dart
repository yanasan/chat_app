// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fire_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FireImage _$FireImageFromJson(Map<String, dynamic> json) {
  return _FireImage.fromJson(json);
}

/// @nodoc
mixin _$FireImage {
  String get ref => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FireImageCopyWith<FireImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireImageCopyWith<$Res> {
  factory $FireImageCopyWith(FireImage value, $Res Function(FireImage) then) =
      _$FireImageCopyWithImpl<$Res, FireImage>;
  @useResult
  $Res call({String ref, String url});
}

/// @nodoc
class _$FireImageCopyWithImpl<$Res, $Val extends FireImage>
    implements $FireImageCopyWith<$Res> {
  _$FireImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FireImageCopyWith<$Res> implements $FireImageCopyWith<$Res> {
  factory _$$_FireImageCopyWith(
          _$_FireImage value, $Res Function(_$_FireImage) then) =
      __$$_FireImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ref, String url});
}

/// @nodoc
class __$$_FireImageCopyWithImpl<$Res>
    extends _$FireImageCopyWithImpl<$Res, _$_FireImage>
    implements _$$_FireImageCopyWith<$Res> {
  __$$_FireImageCopyWithImpl(
      _$_FireImage _value, $Res Function(_$_FireImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? url = null,
  }) {
    return _then(_$_FireImage(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FireImage extends _FireImage {
  const _$_FireImage({this.ref = '', this.url = ''}) : super._();

  factory _$_FireImage.fromJson(Map<String, dynamic> json) =>
      _$$_FireImageFromJson(json);

  @override
  @JsonKey()
  final String ref;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'FireImage(ref: $ref, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FireImage &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ref, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FireImageCopyWith<_$_FireImage> get copyWith =>
      __$$_FireImageCopyWithImpl<_$_FireImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FireImageToJson(
      this,
    );
  }
}

abstract class _FireImage extends FireImage {
  const factory _FireImage({final String ref, final String url}) = _$_FireImage;
  const _FireImage._() : super._();

  factory _FireImage.fromJson(Map<String, dynamic> json) =
      _$_FireImage.fromJson;

  @override
  String get ref;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_FireImageCopyWith<_$_FireImage> get copyWith =>
      throw _privateConstructorUsedError;
}
