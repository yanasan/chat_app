import 'package:chat_app/models/fire_timestamp_converter.dart';
import 'package:chat_app/models/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Friends with _$Friends {
  const factory Friends({
    @Default([]) List<String> member,
    @Default('') String roomId,
    @FireTimestampConverterNonNull() required DateTime created,
    @Default([]) List<Message> message,
  }) = _Friends;
  const Friends._();

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);
}
