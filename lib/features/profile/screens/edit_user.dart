import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/edit_user/album_widget.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/settings_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';
import 'package:jt291_flutter_mobile/components/helper/image_helper.dart';

const Map<String, String> genderItems = {
  'male': 'Male',
  'female': 'Female',
};

class EditUser extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userGeneralProvider);

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
              userAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
                error: (_, __) => const SizedBox.shrink(),
                data: (user) => Column(
                  children: [
                    SettingsTile(
                      title: 'Profile Picture',
                      trailingMode: TrailingMode.avatar,
                      imageUrl: user?.avatarUrl ?? 'https://picsum.photos/200/300?random=4',
                      onTap: () async {
                        final choice = await _chooseAvatarSource(context);
                        if (choice == null) return;
                        if (choice == _AvatarSource.gallery) {
                          await _pickAndUploadAvatar(context, ref);
                        } else if (choice == _AvatarSource.url) {
                          final url = await _promptText(context, title: 'Avatar URL', initial: user?.avatarUrl ?? '');
                          if (url == null || url.isEmpty) return;
                          await ref.read(userGeneralProvider.notifier).updateProfile({'avatar_url': url});
                          await ref.read(userGeneralProvider.notifier).refreshProfile();
                          _snack(context, 'Avatar updated');
                        }
                      },
                    ),
                    SettingsTile(
                      title: 'Nickname',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.nickname ?? '-',
                      onTap: () => GoRouter.of(context).push(RouteConstants.userEditNickname),
                    ),
                    SettingsTile(
                      title: 'UserID',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.id ?? '-',
                      onTap: () {},
                    ),
                    SettingsTile(
                      title: 'Gender',
                      trailingMode: TrailingMode.text,
                      trailingText: genderItems[user?.gender ?? ''] ?? '-',
                      onTap: () async {
                        final gender = await _pickGender(context, initial: user?.gender);
                        if (gender == null) return;
                        await ref.read(userGeneralProvider.notifier).updateProfile({'gender': gender});
                        await ref.read(userGeneralProvider.notifier).refreshProfile();
                        _snack(context, 'Gender updated');
                      },
                    ),
                    SettingsTile(
                      title: 'Birthday',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.dateOfBirth != null
                          ? _fmtDate(user!.dateOfBirth!)
                          : '-',
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: user?.dateOfBirth ?? DateTime(2000, 1, 1),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked == null) return;
                        await ref.read(userGeneralProvider.notifier).updateProfile({'date_of_birth': picked.toIso8601String()});
                        await ref.read(userGeneralProvider.notifier).refreshProfile();
                        _snack(context, 'Birthday updated');
                      },
                    ),
                    SettingsTile(
                      title: 'Bio',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.bio ?? '-',
                      onTap: () => GoRouter.of(context).push(RouteConstants.userEditBio),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _AvatarSource { gallery, url }

Future<_AvatarSource?> _chooseAvatarSource(BuildContext context) async {
  return showModalBottomSheet<_AvatarSource>(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () => Navigator.pop(context, _AvatarSource.gallery),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.link_outlined),
              title: const Text('Enter image URL'),
              onTap: () => Navigator.pop(context, _AvatarSource.url),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> _pickAndUploadAvatar(BuildContext context, WidgetRef ref) async {
  final helper = ImageHelper();
  try {
    final files = await helper.pickImages(multiple: false, limit: 1);
    if (files.isEmpty) return;

    // Optional: crop square for avatar
    final cropped = await helper.cropImages(file: files.first, cropStyle: CropStyle.circle);
    final useFile = cropped ?? files.first;

    final urls = await ref.read(userGeneralProvider.notifier).uploadAttachments([
      File(useFile.path),
    ]);
    if (urls.isEmpty) {
      _snack(context, 'Upload failed');
      return;
    }

    await ref.read(userGeneralProvider.notifier).updateProfile({'avatar_url': urls.first});
    await ref.read(userGeneralProvider.notifier).refreshProfile();
    _snack(context, 'Avatar updated');
  } catch (e) {
    _snack(context, 'Error: $e');
  }
}

Future<String?> _promptText(BuildContext context, {required String title, String initial = ''}) async {
  final controller = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, controller.text.trim()), child: const Text('Save')),
        ],
      );
    },
  );
}

Future<String?> _pickGender(BuildContext context, {String? initial}) async {
  return showModalBottomSheet<String>(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final g in genderItems.keys)
              ListTile(
                title: Text(genderItems[g] ?? '-'),
                trailing: initial == g ? const Icon(Icons.check) : null,
                onTap: () => Navigator.pop(context, g),
              ),
          ],
        ),
      );
    },
  );
}

String _fmtDate(DateTime d) {
  return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

void _snack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
