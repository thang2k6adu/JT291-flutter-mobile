import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_time_formatter.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/post_options_bottom_sheet.dart';

/// Header widget for post card showing user avatar, name, and time
class PostHeader extends StatelessWidget {
  final PostModel post;

  const PostHeader({
    super.key,
    required this. post,
  });

  @override
  Widget build(BuildContext context) {
    final user = post.user;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(user.avatar),
          const SizedBox(width: 8),
          Expanded(
            child: _buildUserInfo(),
          ),
          _buildMenuButton(context),
        ],
      ),
    );
  }

  Widget _buildAvatar(String? avatarUrl) {
    final image = avatarUrl != null && avatarUrl.isNotEmpty
        ? NetworkImage(avatarUrl)
        : AssetImage(AppImages. defaultAvatar) as ImageProvider;

    return AvatarWidget(
      image: image,
      size: 44,
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserRow(),
        if (post.content.isNotEmpty) ...[
          const SizedBox(height: 4),
          _buildContent(),
        ],
      ],
    );
  }

  Widget _buildUserRow() {
    return Row(
      children: [
        Text(
          post.user.nickname,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          PostTimeFormatter.format(post.createdAt),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hashtags ở đầu
        if (post.hashtags.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: post.hashtags.map((hashtag) {
              final hashtagName = hashtag.name.startsWith('#') 
                  ? hashtag.name 
                  : '#${hashtag.name}';
              return Text(
                hashtagName,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1DA1F2), // Màu xanh cho hashtag
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 4),
        ],
        // Content text
        Text(
          post.content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1A1A1A),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPostOptions(context),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          Icons.more_horiz,
          color: Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }

  void _showPostOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => PostOptionsBottomSheet(
        postId: post.id,
        authorId: post.user.id,
        authorName: post.user. nickname,
        authorAvatar: post.user.avatar, // Truyền avatar
      ),
    );
  }
}