import 'package:chat_app/models/fire_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default(FireImage()) FireImage profileImage,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
