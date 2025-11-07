import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/profile_view_screen/profile_view_item.dart';
import 'package:jt291_flutter_mobile/data/providers/profile_view/profile_view_provider.dart';

class ProfileViewScreen extends ConsumerWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileViewAsync = ref.watch(profileViewProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(title: 'Profile Views'),
      body: profileViewAsync.when(
        data: (profileView) {
          if (profileView == null || profileView.views.isEmpty) {
            return const Center(child: Text('No views yet.'));
          }

          final notifier = ref.read(profileViewProvider.notifier);

          return RefreshIndicator(
            onRefresh: notifier.refreshProfileViews,
            child: ListView.builder(
              controller: notifier.scrollController,
              itemCount: profileView.views.length + (notifier.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < profileView.views.length) {
                  final view = profileView.views[index];
                  return ProfileViewItem(view: view);
                } else {
                  // Hiển thị loading khi load thêm
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}
