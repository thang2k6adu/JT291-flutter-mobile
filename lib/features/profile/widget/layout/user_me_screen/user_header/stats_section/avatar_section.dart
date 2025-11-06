import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/avatar_fullscreen_view.dart';

class UserAvatarSection extends StatelessWidget {
  final String? avatarUrl;
  
  const UserAvatarSection({super.key, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = avatarUrl != null 
        ? NetworkImage(avatarUrl!)
        : const AssetImage('assets/images/splash/splash.png');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: true,
            barrierDismissible: true,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (_, __, ___) => AvatarFullscreenView(imageProvider: imageProvider),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: AvatarWidget(
        image: imageProvider,
        size: 90,
        borderWidth: 1,
        showGlow: false,
      ),
    );
  }
}

