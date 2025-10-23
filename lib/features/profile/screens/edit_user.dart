import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/edit_user/album_widget.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/settings_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';

class EditUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Information'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              AlbumWidget(
                images: [
                  'https://picsum.photos/200/300?random=1',
                  'https://picsum.photos/200/300?random=2',
                  'https://picsum.photos/200/300?random=3',
                ],
                maxCount: 6,
                visibleCount: 4,
                itemSize: 80,
                borderRadius: 8,
                padding: EdgeInsets.all(16.0),
                onAdd: () {
                  GoRouter.of(context).push(RouteConstants.myAlbum);
                },
                onImageTap: (index) {
                  print("Tapped image $index");
                },
              ),
              const SizedBox(height: 16.0),
              SettingsTile(
                title: 'Profile Picture',
                trailingMode: TrailingMode.avatar,
                imageUrl: 'https://picsum.photos/200/300?random=4',
                onTap: () {
                  print("Tapped Profile Picture");
                },
              ),
              SettingsTile(
                title: 'Nickname',
                trailingMode: TrailingMode.text,
                trailingText: 'Darlene Bears',
                onTap: () {
                  print("Tapped Nickname");
                },
              ),
              SettingsTile(
                title: 'UserID',
                trailingMode: TrailingMode.text,
                trailingText: 'user123',
                onTap: () {
                  print("Tapped Profile Picture");
                },
              ),
              SettingsTile(
                title: 'Gender',
                trailingMode: TrailingMode.text,
                trailingText: 'Female',
                onTap: () {
                  print("Tapped Gender");
                },
              ),
              SettingsTile(
                title: 'Birthday',
                trailingMode: TrailingMode.text,
                trailingText: '01/01/2000',
                onTap: () {
                  print("Tapped Birthday");
                },
              ),
              SettingsTile(
                title: 'Bio',
                trailingMode: TrailingMode.text,
                trailingText: 'This is my bio',
                onTap: () {
                  print("Tapped Bio");
                },
              ),
              const SizedBox(height: 16.0),
              SettingsTile(
                title: 'Title',
                trailingMode: TrailingMode.text,
                trailingText: 'This is my bio',
                onTap: () {
                  print("Tapped Bio");
                },
              ),
              SettingsTile(
                title: 'Level',
                trailingMode: TrailingMode.text,
                trailingText: 'This is my bio',
                onTap: () {
                  print("Tapped Bio");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
