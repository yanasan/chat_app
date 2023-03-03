import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_image.freezed.dart';
part 'fire_image.g.dart';

@freezed
class FireImage with _$FireImage {
  const factory FireImage({
    @Default('') String ref,
    @Default('') String url,
  }) = _FireImage;
  const FireImage._();

  factory FireImage.fromJson(Map<String, dynamic> json) =>
      _$FireImageFromJson(json);
}
