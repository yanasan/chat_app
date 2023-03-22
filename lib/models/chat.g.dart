// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      member: (json['member'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      roomId: json['roomId'] as String? ?? '',
      message: (json['message'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      created: const FireTimestampConverterNonNull().fromJson(json['created']),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'member': instance.member,
      'roomId': instance.roomId,
      'message': instance.message,
      'created': const FireTimestampConverterNonNull().toJson(instance.created),
    };
