import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/social/notification_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// Provider for notifications with pagination
final notificationProvider = AsyncNotifierProvider<
    NotificationNotifier,
    List<NotificationModel>
>(NotificationNotifier.new);

class NotificationNotifier extends BasePaginatedNotifier<NotificationModel>
    with ListItemUpdateMixin<NotificationModel> {
  SocialFeedService? _service;

  SocialFeedService get service {
    _service ??= ref.read(socialFeedServiceProvider);
    return _service!;
  }

  @override
  Future<List<NotificationModel>> build() async {
    return super.build();
  }

  @override
  String getCacheKey(String? search) {
    return 'notifications';
  }

  @override
  Future<PaginatedResponse<NotificationModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await service.getNotifications(
      page: page,
      limit: limit,
    );
    return ApiPaginatedResponse(response);
  }

  /// Mark a notification as read
  Future<void> markAsRead(String notificationId) async {
    await updateItemAsync(
      (notification) => notification.id == notificationId,
      (notification) => notification, // No pending state needed
      () async {
        final response = await service.markNotificationAsRead(notificationId);
        return !response.error;
      },
      (notification, success) {
        if (success) {
          return notification.copyWith(
            status: NotificationStatus.read,
          );
        }
        return notification;
      },
    );
  }
}

