import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/avatar.dart';

class UserAvatarSection extends StatelessWidget {
  const UserAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const AvatarWidget(
      image: NetworkImage(
        'https://jbagy.me/wp-content/uploads/2025/03/anh-avatar-vo-tri-meo-1.jpg',
      ),
      size: 90,
      borderWidth: 1,
      showGlow: false,
    );
  }
}

