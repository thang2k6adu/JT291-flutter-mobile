import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_section/avatar_section.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

/// Floating avatar component cho Profile Screen
class ProfileFloatingAvatar extends ConsumerWidget {
  final String? userId;

  const ProfileFloatingAvatar({
    super.key,
    this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draggableState = ref.watch(draggableSheetControllerProvider);
    
    // Sử dụng provider phù hợp tùy theo userId
    final userGeneralAsync = userId == null
        ? ref.watch(userGeneralProvider)
        : ref.watch(userProfileByIdProvider(userId));

    final position = _getFloatingAvatarPosition(context, draggableState.currentExtent);

    return Positioned(
      top: position.dy,
      left: position.dx,
      child: userGeneralAsync.when(
        data: (user) => UserAvatarSection(avatarUrl: user?.avatar),
        loading: () => const SizedBox.shrink(),
        error: (error, stack) => const SizedBox.shrink(),
      ),
    );
  }

  /// Calculate floating avatar position based on current extent
  Offset _getFloatingAvatarPosition(BuildContext context, double currentExtent) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    final top = screenHeight * (1 - currentExtent) - ProfileConstants.avatarSize / 3;
    
    final left = screenWidth / 7 - ProfileConstants.avatarSize / 2;
    
    return Offset(left, top);
  }
}
