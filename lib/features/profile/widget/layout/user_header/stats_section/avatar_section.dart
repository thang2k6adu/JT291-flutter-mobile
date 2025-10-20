import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/avatar.dart';

class UserAvatarSection extends StatelessWidget {
  final String? avatarUrl;
  
  const UserAvatarSection({super.key, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      image: avatarUrl != null 
          ? NetworkImage(avatarUrl!)
          : const AssetImage('assets/images/splash/splash.png') as ImageProvider,
      size: 90,
      borderWidth: 1,
      showGlow: false,
    );
  }
}

