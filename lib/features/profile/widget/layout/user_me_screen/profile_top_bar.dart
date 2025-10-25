import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/profile_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/animated_header.dart';

/// Top bar component cho Profile Screen
class ProfileTopBar extends ConsumerWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileData = ref.watch(profileScreenProvider);

    return profileData.userGeneralAsync.when(
      data: (user) => AnimatedCustomTopBar(
        extent: profileData.draggableState.currentExtent,
        avatarUrl: user?.avatarUrl,
        nickname: user?.nickname,
        uid: user?.unionId,
        onBackPressed: () => GoRouter.of(context).pop(),
      ),
      loading: () => AnimatedCustomTopBar(
        extent: profileData.draggableState.currentExtent,
        onBackPressed: () => GoRouter.of(context).pop(),
      ),
      error: (error, stack) => AnimatedCustomTopBar(
        extent: profileData.draggableState.currentExtent,
        onBackPressed: () => GoRouter.of(context).pop(),
      ),
    );
  }
}
