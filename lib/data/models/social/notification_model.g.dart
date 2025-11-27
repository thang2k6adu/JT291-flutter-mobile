// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      userId: json['user_id'] as String,
      senderId: json['sender_id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      status: $enumDecode(_$NotificationStatusEnumMap, json['status']),
      title: json['title'] as String,
      content: json['content'] as String,
      data: json['data'] as String,
      link: json['link'] as String,
      sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user_id': instance.userId,
      'sender_id': instance.senderId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'title': instance.title,
      'content': instance.content,
      'data': instance.data,
      'link': instance.link,
      'sender': instance.sender,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'LIKE',
  NotificationType.comment: 'COMMENT',
  NotificationType.follow: 'FOLLOW',
  NotificationType.share: 'SHARE',
  NotificationType.mention: 'MENTION',
  NotificationType.system: 'SYSTEM',
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.unread: 'UNREAD',
  NotificationStatus.read: 'READ',
};
