import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends.freezed.dart';
part 'friends.g.dart';

@freezed
class Friends with _$Friends {
  const factory Friends({
    @Default('') String id,
    @Default('') String pathId,
  }) = _Friends;
  const Friends._();

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);
}
