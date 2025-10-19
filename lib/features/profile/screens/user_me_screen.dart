// lib/features/profile/screens/user_me_screen.dart
import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/assets/assets.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/user_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_tab_content/profile_tab_content.dart';

class UserMeScreen extends StatefulWidget {
  const UserMeScreen({super.key});

  @override
  State<UserMeScreen> createState() => _UserMeScreenState();
}

class _UserMeScreenState extends State<UserMeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagePaths.getPath(ImagePath.splash),
              fit: BoxFit.cover,
            ),
          ),

          // Draggable Sheet
          ReusableDraggableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.12,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                children: [
                  const UserHeader(),
                  const ProfileTabContent(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

}
