// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      userId: json['userId'] as String? ?? '',
      messageId: json['messageId'] as String? ?? '',
      message: json['message'] as String? ?? '',
      created: const FireTimestampConverterNonNull().fromJson(json['created']),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'messageId': instance.messageId,
      'message': instance.message,
      'created': const FireTimestampConverterNonNull().toJson(instance.created),
    };
