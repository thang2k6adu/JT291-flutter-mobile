import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_section/avatar_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_section/profile_section.dart';

class UserHeaderSection extends StatelessWidget {
  const UserHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatarSection(),
        SizedBox(width: 8),
        UserProfileSection(),
      ],
    );
  }
}
