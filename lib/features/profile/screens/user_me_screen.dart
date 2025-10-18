// lib/features/profile/screens/user_me_screen.dart
import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/assets/assets.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/user_header.dart';

class UserMeScreen extends StatelessWidget {
  const UserMeScreen({super.key});

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

          // Draggable Sheet trống (base)
          ReusableDraggableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.12,
            maxChildSize: 0.95,

            builder: (context, scrollController) {
              // hãy thực hiện, bên trong listView có 2 phần child(trong mỗi phần child có thể tự nở theo nội dung (giống như )
              return ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                children: [
                  UserHeader(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
