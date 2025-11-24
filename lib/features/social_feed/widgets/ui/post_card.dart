import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_media_carousel.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends ConsumerStatefulWidget {
  final PostModel post;

  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  ConsumerState<PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard> {
  String _formatTimeAgo(DateTime dateTime) {
    return timeago.format(dateTime, locale: 'en_short');
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(),
          if (post.media.isNotEmpty)
            PostMediaCarousel(mediaList: post.media),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final post = widget.post;
    final user = post.user;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            image: user.avatar != null && user.avatar!.isNotEmpty
                ? NetworkImage(user.avatar!)
                : AssetImage('assets/images/default_avatar.png') as ImageProvider,
            size: 44,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.nickname,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      _formatTimeAgo(post.createdAt),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                if (post.content.isNotEmpty) ...[
                  SizedBox(height: 4),
                  Text(
                    post.content,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[950],
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    final post = widget.post;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              // TODO: Handle like action via controller
            },
            child: Row(
              children: [
                SvgIconSimple.asset(
                  AppIcons.heartSvg,
                  size: 24,
                  color: post.isLiked ? Colors.red : null,
                ),
                if (post.likeCount > 0) ...[
                  SizedBox(width: 4),
                  Text(
                    '${post.likeCount}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: 12),
          Row(
            children: [
              SvgIconSimple.asset(
                AppIcons.messageSvg,
                size: 24,
              ),
              if (post.commentCount > 0) ...[
                SizedBox(width: 4),
                Text(
                  '${post.commentCount}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(width: 12),
          SvgIconSimple.asset(
            AppIcons.sendMessageLineSvg,
            size: 24,
          ),
        ],
      ),
    );
  }
}