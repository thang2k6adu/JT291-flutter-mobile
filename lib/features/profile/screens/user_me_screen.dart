// lib/features/profile/screens/user_me_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_bottom_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background_indicator.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_floating_avatar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_top_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/profile_action_buttons.dart';
import 'package:jt291_flutter_mobile/features/profile/providers/user_profile_notifier.dart';
import 'package:jt291_flutter_mobile/features/profile/providers/user_profile_state.dart';

class UserMeScreen extends ConsumerWidget {
  /// ID của user cần xem profile
  /// Nếu null => hiển thị profile của chính mình
  /// Nếu có giá trị => hiển thị profile của user khác
  final String? userId;

  const UserMeScreen({
    super.key,
    this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch profile state từ notifier
    final profileState = ref.watch(userProfileProvider(userId));
    final profileNotifier = ref.read(userProfileProvider(userId).notifier);

    // Show loading state
    if (profileState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Show error state
    if (profileState.error != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${profileState.error}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => profileNotifier.refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // Main UI với data
    return Scaffold(
      body: Stack(
        children: [
          // Background với profile images
          ProfileBackground(images: profileState.profileImages),

          // Background progress indicator (small line ~2px)
          const ProfileBackgroundIndicator(maxWidth: 60),

          // Draggable Sheet - truyền userId xuống
          ProfileDraggableSheet(userId: userId),

          // Floating Avatar - truyền userId xuống
          ProfileFloatingAvatar(userId: userId),

          // Top Bar - truyền userId xuống
          ProfileTopBar(userId: userId),

          // Fixed Bottom Action Buttons - chỉ hiển thị nếu không phải chính mình
          if (!profileState.isMe && profileState.relationship != null)
            _buildActionButtons(
              context: context,
              profileState: profileState,
              profileNotifier: profileNotifier,
            ),
        ],
      ),
    );
  }

  /// Build action buttons ở bottom
  Widget _buildActionButtons({
    required BuildContext context,
    required UserProfileState profileState,
    required UserProfileNotifier profileNotifier,
  }) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: ProfileActionButtons(
            relationship: profileState.relationship!,
            onFollowPressed: () async {
              // Handle follow/unfollow
              if (profileState.relationship!.isFollowing) {
                await profileNotifier.unfollowUser(currentUserId: userId!);
              } else {
                await profileNotifier.followUser(currentUserId: userId!);
              }
            },
            onMessagePressed: () {
              print('Message user: $userId');
              // TODO: Navigate to message screen
            },
            onGiftPressed: () {
              // Mở Gift Bottom Sheet
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => GiftBottomSheet(
                  userId: userId!,
                  userName: profileState.user?.nickname ?? 'User',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
