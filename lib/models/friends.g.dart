// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friends _$$_FriendsFromJson(Map<String, dynamic> json) => _$_Friends(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      message: (json['message'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FriendsToJson(_$_Friends instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'message': instance.message,
    };
