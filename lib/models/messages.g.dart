// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      userId: json['userId'] as String? ?? '',
      description: json['description'] as String? ?? '',
      created: const FireTimestampConverterNonNull().fromJson(json['created']),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'description': instance.description,
      'created': const FireTimestampConverterNonNull().toJson(instance.created),
    };
