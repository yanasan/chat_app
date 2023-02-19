import 'package:chat_app/models/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends.freezed.dart';
part 'friends.g.dart';

@freezed
class Friends with _$Friends {
  const factory Friends({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<Message> message,
  }) = _Friends;
  const Friends._();

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);
}
