import 'package:chat_app/models/fire_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    @Default('') String userId,
    @Default('') String message,
    @FireTimestampConverterNonNull() required DateTime created,
  }) = _Message;
  const Message._();

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
