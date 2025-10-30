import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_section/avatar_section.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';

/// Floating avatar component cho Profile Screen
class ProfileFloatingAvatar extends ConsumerWidget {
  const ProfileFloatingAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draggableState = ref.watch(draggableSheetControllerProvider);
    final userGeneralAsync = ref.watch(userGeneralProvider);

    final position = _getFloatingAvatarPosition(context, draggableState.currentExtent);

    return Positioned(
      top: position.dy,
      left: position.dx,
      child: userGeneralAsync.when(
        data: (user) => UserAvatarSection(avatarUrl: user?.avatarUrl),
        loading: () => const SizedBox.shrink(),
        error: (error, stack) => const SizedBox.shrink(),
      ),
    );
  }

  /// Calculate floating avatar position based on current extent
  Offset _getFloatingAvatarPosition(BuildContext context, double currentExtent) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    final top = screenHeight - 
        ProfileConstants.avatarAnimationRange * 
        (currentExtent - ProfileConstants.minChildSize) / 
        (ProfileConstants.maxChildSize - ProfileConstants.minChildSize) - 
        ProfileConstants.avatarOffset;
    
    final left = screenWidth / 6.8 - ProfileConstants.avatarSize / 2;
    
    return Offset(left, top);
  }
}
