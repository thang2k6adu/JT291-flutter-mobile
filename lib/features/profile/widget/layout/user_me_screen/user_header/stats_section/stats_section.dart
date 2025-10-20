import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/user_general/user_general.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_section/avatar_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_section/profile_section.dart';

class StatsSection extends StatelessWidget {
  final UserGeneralModel? user;
  
  const StatsSection({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatarSection(avatarUrl: user?.avatarUrl),
        const SizedBox(width: 8),
        Expanded(
          child: UserProfileSection(
            nickname: user?.nickname,
            gender: user?.gender,
            currentLevel: user?.level?.currentLevel,
          ),
        ),
      ],
    );
  }
}
