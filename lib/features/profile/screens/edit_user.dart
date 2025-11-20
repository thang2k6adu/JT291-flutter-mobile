import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/edit_user/album_widget.dart';
import 'package:jt291_flutter_mobile/components/ui/settings_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/components/helper/image_helper.dart';
import 'package:jt291_flutter_mobile/components/ui/bottom_sheet_picker.dart';
import 'package:jt291_flutter_mobile/core/utils/string_utils.dart';

const Map<String, String> genderItems = {'male': 'Male', 'female': 'Female'};

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
                images: [...(userAsync.value?.profileUrls ?? [])],
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
                      imageUrl:
                          user?.avatar ??
                          'https://picsum.photos/200/300?random=4',
                      onTap: () async {
                        final choice = await _chooseAvatarSource(context);
                        if (choice == null) return;
                        if (choice == _AvatarSource.gallery) {
                          await _pickAndUploadAvatar(context, ref);
                        } else if (choice == _AvatarSource.url) {
                          final url = await _promptText(
                            context,
                            title: 'Avatar URL',
                            initial: user?.avatar ?? '',
                          );
                          if (url == null || url.isEmpty) return;
                          await ref
                              .read(userGeneralProvider.notifier)
                              .updateProfile({'avatar': url});
                          await ref
                              .read(userGeneralProvider.notifier)
                              .refreshProfile();
                          _snack(context, 'Avatar updated');
                        }
                      },
                    ),
                    SettingsTile(
                      title: 'Nickname',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.nickname ?? '-',
                      onTap: () => GoRouter.of(
                        context,
                      ).push(RouteConstants.userEditNickname),
                    ),
                    SettingsTile(
                      title: 'UserID',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.unionId ?? '-',
                      onTap: () {},
                    ),
                    SettingsTile(
                      title: 'Gender',
                      trailingMode: TrailingMode.text,
                      trailingText: genderItems[user?.gender ?? ''] ?? '-',
                      onTap: () async {
                        final gender = await _pickGender(
                          context,
                          initial: user?.gender,
                        );
                        if (gender == null) return;
                        await ref
                            .read(userGeneralProvider.notifier)
                            .updateProfile({'gender': gender});
                        await ref
                            .read(userGeneralProvider.notifier)
                            .refreshProfile();
                        _snack(context, 'Gender updated');
                      },
                    ),
                    SettingsTile(
                      title: 'Birthday',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.birthday != null
                          ? _fmtDate(user!.birthday!)
                          : '-',
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate:
                              user?.birthday ?? DateTime(2000, 1, 1),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked == null) return;
                        await ref
                            .read(userGeneralProvider.notifier)
                            .updateProfile({
                              'birthday': picked.toIso8601String(),
                            });
                        await ref
                            .read(userGeneralProvider.notifier)
                            .refreshProfile();
                        _snack(context, 'Birthday updated');
                      },
                    ),
                    SettingsTile(
                      title: 'Bio',
                      trailingMode: TrailingMode.text,
                      trailingText: user?.bio ?? '-',
                      onTap: () =>
                          GoRouter.of(context).push(RouteConstants.userEditBio),
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

  Widget _bottomSheetOption(BuildContext context,
      {required String title, required VoidCallback onTap, bool highlight = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: highlight ? FontWeight.w600 : FontWeight.normal,
            color: highlight ? Colors.black : Colors.black87,
          ),
        ),
      ),
    );
  }

Future<_AvatarSource?> _chooseAvatarSource(BuildContext context) async {
  return BottomSheetPicker.show<_AvatarSource>(
    context,
    title: 'Choose a profile picture',
    options: [
      BottomSheetOption(label: 'Take a photo', value: _AvatarSource.url),
      BottomSheetOption(label: 'Choose a photo from the gallery', value: _AvatarSource.gallery),
    ],);
}


Future<void> _pickAndUploadAvatar(BuildContext context, WidgetRef ref) async {
  final helper = ImageHelper();
  try {
    final files = await helper.pickImages(multiple: false, limit: 1);
    print('Picked files: ${files.map((f) => f.path).join(', ')}');

    if (files.isEmpty) return;
    print('Files are not empty, proceeding with cropping and uploading.');

    // // Optional: crop square for avatar
    // final cropped = await helper.cropImages(
    //   file: files.first,
    //   cropStyle: CropStyle.circle,
    // );
    // print('Cropped file: ${cropped?.path}');
    // final useFile = cropped ?? files.first;

    print('Uploading avatar from file: ${files.first.path}');

    final urls = await ref.read(userGeneralProvider.notifier).uploadAttachments(
      [File(files.first.path)],
    );
    if (urls.isEmpty) {
      _snack(context, 'Upload failed');
      return;
    }

    print('Uploaded avatar URL: ${urls.first}');

    await ref.read(userGeneralProvider.notifier).updateProfile({
      'avatar': urls.first,
    });
    await ref.read(userGeneralProvider.notifier).refreshProfile();
    _snack(context, 'Avatar updated');
  } catch (e) {
    _snack(context, 'Error: $e');
  }
}

Future<String?> _promptText(
  BuildContext context, {
  required String title,
  String initial = '',
}) async {
  final controller = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

Future<String?> _pickGender(BuildContext context, {String? initial}) async {
  return BottomSheetPicker.show<String>(
    context,
    title: 'Select Gender',
    options: genderItems.keys.map((e) => BottomSheetOption(label: e.capitalize(), value: e)).toList(),
  );
}

String _fmtDate(DateTime d) {
  return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

void _snack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
