import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_action_buttons.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_header.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_media_carousel.dart';

/// Main post card widget
class PostCard extends StatelessWidget {
  final PostModel post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;

  const PostCard({
    super.key,
    required this.post,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostHeader(post: post),
          if (post.media.isNotEmpty)
            PostMediaCarousel(mediaList: post.media),
          PostActionButtons(
            post: post,
            onLikeTap: onLikeTap ?? () {},
            onCommentTap: onCommentTap,
            onShareTap: onShareTap,
          ),
        ],
      ),
    );
  }
}
