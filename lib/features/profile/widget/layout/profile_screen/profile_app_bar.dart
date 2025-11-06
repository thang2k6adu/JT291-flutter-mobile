import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgIconSimple.asset(AppIcons.scanner),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgIconSimple.asset(AppIcons.setting),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
