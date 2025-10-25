import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/assets/assets.dart';

/// Background component cho Profile Screen
class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        ImagePaths.getPath(ImagePath.profileBackground),
        fit: BoxFit.cover,
      ),
    );
  }
}
