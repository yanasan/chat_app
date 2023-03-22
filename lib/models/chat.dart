import 'package:chat_app/models/fire_timestamp_converter.dart';
import 'package:chat_app/models/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    @Default([]) List<String> member,
    @Default('') String roomId,
    @Default([]) List<Message> message,
    @FireTimestampConverterNonNull() required DateTime created,
  }) = _Chat;
  const Chat._();

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
