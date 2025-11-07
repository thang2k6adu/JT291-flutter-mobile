import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/data/models/users/viewer_model.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/profile_view_screen/profile_view_item.dart';

class ProfileViewScreen extends ConsumerWidget {
  ProfileViewScreen({super.key});

  // Ví dụ dữ liệu tĩnh
  final List<ViewerModel> profileViews = [
    ViewerModel(
      viewerId: '1',
      username: 'Leo Herwitz',
      shortBio: 'Striving for excellence, embra...',
      viewTime: DateTime.now().subtract(const Duration(minutes: 8)),
      gender: 'female',
      avatarUrl: 'assets/avatars/leo1.png',
    ),
    ViewerModel(
      viewerId: '2',
      username: 'Marley Schleifer',
      shortBio: 'Striving for excellence, embra...',
      viewTime: DateTime.now().subtract(const Duration(minutes: 20)),
      gender: 'male',
      avatarUrl: 'assets/avatars/marley1.png',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Nếu dùng Riverpod
    // final profileViews = ref.watch(profileViewProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(title: 'Profile Views'),
      body: ListView.builder(
        itemCount: profileViews.length,
        itemBuilder: (context, index) {
          final view = profileViews[index];
          return ProfileViewItem(view: view);
        },
      ),
    );
  }
}
