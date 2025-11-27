import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/data/models/social/notification_model.dart';

/// Notification item widget với UI giống design
class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
  });

  /// Get icon overlay cho notification type
  Widget _getTypeIcon(NotificationType type) {
    IconData iconData;
    Color iconColor;
    Color backgroundColor;

    switch (type) {
      case NotificationType.like:
        iconData = Icons.favorite;
        iconColor = Colors.white;
        backgroundColor = const Color(0xFFFF69B4); // Pink
        break;
      case NotificationType.comment:
        iconData = Icons.chat_bubble_outline;
        iconColor = Colors.white;
        backgroundColor = const Color(0xFFFF9500); // Orange
        break;
      case NotificationType.follow:
        iconData = Icons.favorite;
        iconColor = Colors.white;
        backgroundColor = const Color(0xFFFF69B4); // Pink
        break;
      case NotificationType.share:
        iconData = Icons.send;
        iconColor = Colors.white;
        backgroundColor = const Color(0xFF9B59B6); // Purple
        break;
      case NotificationType.mention:
        iconData = Icons.alternate_email;
        iconColor = Colors.white;
        backgroundColor = const Color(0xFF1DA1F2); // Blue
        break;
      case NotificationType.system:
        iconData = Icons.notifications;
        iconColor = Colors.white;
        backgroundColor = Colors.grey;
        break;
    }

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Icon(
        iconData,
        size: 12,
        color: iconColor,
      ),
    );
  }

  // TODO: Implement thumbnail khi có post data
  // /// Get thumbnail URL từ notification data
  // /// Parse JSON data để lấy post_id, sau đó có thể fetch post để lấy thumbnail
  // String? _getThumbnailUrl() {
  //   // Parse data JSON và fetch post để lấy thumbnail
  //   return null;
  // }
  //
  // /// Check xem notification có thumbnail không
  // bool _hasThumbnail() {
  //   // Chỉ hiển thị thumbnail cho LIKE, COMMENT, SHARE, MENTION
  //   return notification.type == NotificationType.like ||
  //       notification.type == NotificationType.comment ||
  //       notification.type == NotificationType.share ||
  //       notification.type == NotificationType.mention;
  // }

  @override
  Widget build(BuildContext context) {
    final sender = notification.sender;
    final avatarImage = sender.avatar != null && sender.avatar!.isNotEmpty
        ? NetworkImage(sender.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar với icon overlay
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: avatarImage,
                  backgroundColor: Colors.grey[300],
                ),
                Positioned(
                  right: -4,
                  bottom: -4,
                  child: _getTypeIcon(notification.type),
                ),
              ],
            ),
            const SizedBox(width: 12),
            // Content và timestamp
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: '${sender.nickname} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: notification.content,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeago.format(notification.createdAt, locale: 'en_short'),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Thumbnail (nếu có)
            // TODO: Implement thumbnail khi có post data
            // if (hasThumbnail && thumbnailUrl != null) ...[
            //   const SizedBox(width: 12),
            //   ClipRRect(
            //     borderRadius: BorderRadius.circular(4),
            //     child: Image.network(
            //       thumbnailUrl,
            //       width: 60,
            //       height: 60,
            //       fit: BoxFit.cover,
            //       errorBuilder: (context, error, stackTrace) {
            //         return Container(
            //           width: 60,
            //           height: 60,
            //           color: Colors.grey[200],
            //           child: Icon(Icons.image, color: Colors.grey[400], size: 24),
            //         );
            //       },
            //     ),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}

