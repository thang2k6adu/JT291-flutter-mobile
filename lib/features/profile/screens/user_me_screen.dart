// lib/features/profile/screens/user_me_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background_indicator.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_floating_avatar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_top_bar.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_relationship_provider.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/profile_action_buttons.dart';

class UserMeScreen extends ConsumerWidget {
  /// ID của user cần xem profile
  /// Nếu null => hiển thị profile của chính mình
  /// Nếu có giá trị => hiển thị profile của user khác
  final String? userId;

  UserMeScreen({
    super.key,
    this.userId,
  });

  final List<String> images = [
    'lib/assets/images/demo1.jpg',
    'lib/assets/images/demo2.jpg',
    'lib/assets/images/demo3.jpg',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lấy relationship data
    final relationshipAsync = ref.watch(userRelationshipProvider(userId));
    final userService = ref.read(userGeneralServiceProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background
          ProfileBackground(images: images),

          // Background progress indicator (small line ~2px)
          const ProfileBackgroundIndicator(maxWidth: 60),

          // Draggable Sheet - truyền userId xuống
          ProfileDraggableSheet(userId: userId),

          // Floating Avatar - truyền userId xuống
          ProfileFloatingAvatar(userId: userId),

          // Top Bar - truyền userId xuống
          ProfileTopBar(userId: userId),

          // Fixed Bottom Action Buttons
          relationshipAsync.when(
            data: (relationship) {
              // Chỉ hiển thị nếu không phải chính mình
              if (relationship.isMe) {
                return const SizedBox.shrink();
              }
              
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
                      relationship: relationship,
                      onFollowPressed: () async {
                        if (userId != null) {
                          await userService.followUser('current_user', userId!);
                          ref.invalidate(userRelationshipProvider(userId));
                        }
                      },
                      onMessagePressed: () {
                        print('Message user: $userId');
                        // TODO: Navigate to message screen
                      },
                      onGiftPressed: () {
                        print('Gift to user: $userId');
                        // TODO: Open gift dialog
                      },
                    ),
                  ),
                ),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
