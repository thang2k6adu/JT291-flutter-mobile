import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/social_connection_manager_provider.dart';

class SearchUserController extends AutoDisposeNotifier<void> {
  @override
  void build() {
    // Controller initialization
  }

  /// Follow user với error handling
  Future<bool> followUser(
    BuildContext context,
    String currentUserId,
    String targetUserId,
  ) async {
    try {
      print('SearchUserController: followUser $currentUserId -> $targetUserId');
      final success = await ref
          .read(socialConnectionManagerProvider.notifier)
          .followUser(currentUserId, targetUserId);

      print('SearchUserController: followUser success: $success');

      if (!success) {
        _showErrorSnackBar(context, "Không thể follow user. Vui lòng thử lại.");
      }

      return success;
    } catch (e) {
      print('SearchUserController: followUser error: $e');
      _showErrorSnackBar(context, "Có lỗi xảy ra khi follow user");
      return false;
    }
  }

  /// Unfollow user với error handling
  Future<bool> unfollowUser(
    BuildContext context,
    String currentUserId,
    String targetUserId,
  ) async {
    try {
      print(
        'SearchUserController: unfollowUser $currentUserId -> $targetUserId',
      );
      final success = await ref
          .read(socialConnectionManagerProvider.notifier)
          .unfollowUser(currentUserId, targetUserId);

      print('SearchUserController: unfollowUser success: $success');

      if (!success) {
        _showErrorSnackBar(
          context,
          "Không thể unfollow user. Vui lòng thử lại.",
        );
      }

      return success;
    } catch (e) {
      print('SearchUserController: unfollowUser error: $e');
      _showErrorSnackBar(context, "Có lỗi xảy ra khi unfollow user");
      return false;
    }
  }

  /// Hiển thị error snackbar
  void _showErrorSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red[600],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Đóng',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

/// Provider controller để inject vào UI
final searchUserControllerProvider =
    AutoDisposeNotifierProvider<SearchUserController, void>(
      SearchUserController.new,
    );
