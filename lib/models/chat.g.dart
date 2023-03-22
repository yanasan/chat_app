// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friends _$$_FriendsFromJson(Map<String, dynamic> json) => _$_Friends(
      member: (json['member'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      roomId: json['roomId'] as String? ?? '',
      created: const FireTimestampConverterNonNull().fromJson(json['created']),
      message: (json['message'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FriendsToJson(_$_Friends instance) =>
    <String, dynamic>{
      'member': instance.member,
      'roomId': instance.roomId,
      'created': const FireTimestampConverterNonNull().toJson(instance.created),
      'message': instance.message,
    };
