import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/profile_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_section/avatar_section.dart';

/// Floating avatar component cho Profile Screen
class ProfileFloatingAvatar extends ConsumerWidget {
  const ProfileFloatingAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileData = ref.watch(profileScreenProvider);
    final profileController = ref.read(profileControllerProvider.notifier);

    final position = profileController.getFloatingAvatarPosition(context);

    return Positioned(
      top: position.dy,
      left: position.dx,
      child: profileData.userGeneralAsync.when(
        data: (user) => UserAvatarSection(avatarUrl: user?.avatarUrl),
        loading: () => const SizedBox.shrink(),
        error: (error, stack) => const SizedBox.shrink(),
      ),
    );
  }
}
