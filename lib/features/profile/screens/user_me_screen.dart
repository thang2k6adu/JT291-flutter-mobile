// lib/features/profile/screens/user_me_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background_indicator.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_floating_avatar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_top_bar.dart';

class UserMeScreen extends ConsumerWidget {
  const UserMeScreen({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          const ProfileBackground(),

          // Background progress indicator (small line ~2px)
          const ProfileBackgroundIndicator(maxWidth: 60),

          // Draggable Sheet
          const ProfileDraggableSheet(),

          // Floating Avatar
          const ProfileFloatingAvatar(),

          // Top Bar
          const ProfileTopBar(),
        ],
      ),
    );
  }
}
