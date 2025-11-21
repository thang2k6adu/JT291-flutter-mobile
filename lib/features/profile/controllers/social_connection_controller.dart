import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/social_connection_manager_provider.dart';

class SocialConnectionController extends AutoDisposeNotifier<void> {
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
      print('followUser controller: $currentUserId, $targetUserId');
      final success = await ref
          .read(socialConnectionManagerProvider.notifier)
          .followUser(currentUserId, targetUserId);

      print('followUser success: $success');

      if (!success) {
        _showErrorSnackBar(context, "Không thể follow user. Vui lòng thử lại.");
      }

      return success;
    } catch (e) {
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
      final success = await ref
          .read(socialConnectionManagerProvider.notifier)
          .unfollowUser(currentUserId, targetUserId);

      if (!success) {
        _showErrorSnackBar(context, "Không thể unfollow user. Vui lòng thử lại.");
      }

      return success;
    } catch (e) {
      _showErrorSnackBar(context, "Có lỗi xảy ra khi unfollow user.");
      return false;
    }
  }

  /// Unfriend user với error handling
  Future<bool> unfriendUser(
    BuildContext context,
    String currentUserId,
    String targetUserId,
  ) async {
    try {
      final success = await ref
          .read(socialConnectionManagerProvider.notifier)
          .unfriendUser(currentUserId, targetUserId);

      if (!success) {
        _showErrorSnackBar(context, "Không thể unfriend user. Vui lòng thử lại.");
      }

      return success;
    } catch (e) {
      _showErrorSnackBar(context, "Có lỗi xảy ra khi unfriend user.");
      return false;
    }
  }

  /// Hiển thị error snackbar
  void _showErrorSnackBar(BuildContext context, String message) {
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

  // Alternative: Sử dụng UOverlay thay vì SnackBar
  // Uncomment để sử dụng UOverlay (để consistent với các controller khác)
  // void _showErrorOverlay(BuildContext context, String message) {
  //   final overlay = UOverlay(context);
  //   overlay.showWithTimeout(
  //     message: message,
  //     duration: const Duration(seconds: 3),
  //   );
  // }
}

/// Provider controller để inject vào UI
final socialConnectionControllerProvider =
    AutoDisposeNotifierProvider<SocialConnectionController, void>(
        SocialConnectionController.new);

