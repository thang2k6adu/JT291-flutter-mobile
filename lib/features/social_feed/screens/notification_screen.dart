import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/mixins/scroll_pagination_mixin.dart';
import 'package:jt291_flutter_mobile/data/models/social/notification_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/notification_provider.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/notification_item.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen>
    with ScrollPaginationMixin {
  @override
  Future<void> Function() get onLoadMore => () async {
    await ref.read(notificationProvider.notifier).loadMore();
  };

  @override
  bool Function() get hasNext => () => ref.read(notificationProvider.notifier).hasNext;

  @override
  bool Function() get isLoadingMore => () => ref.read(notificationProvider.notifier).isLoadingMore;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationProvider.notifier).fetchData(reset: true).then((_) {
        checkLoadMoreIfListNotFull();
      });
    });
  }

  void _handleNotificationTap(NotificationModel notification) async {
    // Mark as read nếu chưa đọc
    if (notification.status == NotificationStatus.unread) {
      await ref.read(notificationProvider.notifier).markAsRead(notification.id);
    }

    // Parse link để navigate
    try {
      final link = notification.link;
      if (link.startsWith('/posts/')) {
        final postId = link.replaceFirst('/posts/', '');
        context.push('${RouteConstants.postDetail.replaceAll(':postId', postId)}');
      }
      // Có thể handle các loại link khác ở đây
    } catch (e) {
      print('Error navigating from notification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationProvider);
    final notifier = ref.read(notificationProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(
        title: 'Notification',
        bottomBorder: true,
      ),
      body: notificationState.when(
        data: (notifications) {
          if (notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await notifier.refresh();
              checkLoadMoreIfListNotFull();
            },
            child: ListView.builder(
              controller: scrollController,
              itemCount: notifications.length + (notifier.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < notifications.length) {
                  final notification = notifications[index];
                  return NotificationItem(
                    notification: notification,
                    onTap: () => _handleNotificationTap(notification),
                  );
                } else {
                  // Loading indicator
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading notifications',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => notifier.refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

