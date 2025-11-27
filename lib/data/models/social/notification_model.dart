import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

/// Notification type enum
enum NotificationType {
  @JsonValue('LIKE')
  like,
  @JsonValue('COMMENT')
  comment,
  @JsonValue('FOLLOW')
  follow,
  @JsonValue('SHARE')
  share,
  @JsonValue('MENTION')
  mention,
  @JsonValue('SYSTEM')
  system,
}

/// Notification status enum
enum NotificationStatus {
  @JsonValue('UNREAD')
  unread,
  @JsonValue('READ')
  read,
}

/// Notification model
@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'sender_id') required String senderId,
    required NotificationType type,
    required NotificationStatus status,
    required String title,
    required String content,
    required String data, // JSON string
    required String link,
    required UserModel sender,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

