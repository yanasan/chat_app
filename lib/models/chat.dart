import 'package:chat_app/models/fire_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    @Default([]) List<String> member,
    @Default('') String roomId,
    @FireTimestampConverterNonNull() required DateTime update,
  }) = _Chat;
  const Chat._();

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
