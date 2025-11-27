import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_item_widget.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/post_likes_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';

class PostLikesScreen extends ConsumerWidget {
  final String postId;

  const PostLikesScreen({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesAsync = ref.watch(postLikesProvider(postId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBack(title: 'Favourite', bottomBorder: true),
      body: likesAsync.when(
        data: (likes) {
          if (likes.isEmpty) {
            return const Center(
              child: Text(
                'No likes yet',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            );
          }

          // Convert PostLikeModel to UserRelationItem
          final users = likes.map((like) {
            return UserRelationItem(
              id: like.user.id,
              nickname: like.user.nickname,
              avatarUrl: like.user.avatar ?? '',
              bio: like.user.bio ?? '',
              isFollowing: true, // Fix cứng là following như yêu cầu
              gender: like.user.gender ?? 'male',
              isPending: false,
            );
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              // Fix cứng là following vì API chưa có
              const buttonType = UserButtonType.following;

              return UserItemWidget(
                user: user,
                buttonType: buttonType,
                showHeartIcon: true, // Hiển thị heart icon ở favourite screen
                onUserButtonPressed: (user, type) {
                  // TODO: Implement follow/unfollow action when API is ready
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Follow action for ${user.nickname}'),
                    ),
                  );
                },
                onTap: () {
                  // TODO: Navigate to user profile
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Failed to load likes',
                style: TextStyle(color: Colors.red[300]),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.refresh(postLikesProvider(postId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

