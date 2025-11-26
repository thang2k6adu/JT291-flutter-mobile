import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';

/// Action buttons widget for post card
class PostActionButtons extends StatelessWidget {
  final PostModel post;
  final VoidCallback onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;

  const PostActionButtons({
    super.key,
    required this.post,
    required this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const SizedBox(width: 16),
          _LikeButton(
            isLiked: post.isLiked,
            likeCount: post.likeCount,
            onTap: onLikeTap,
          ),
          const SizedBox(width: 12),
          _CommentButton(
            commentCount: post.commentCount,
            onTap: onCommentTap,
          ),
          const SizedBox(width: 12),
          _ShareButton(onTap: onShareTap),
        ],
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  final bool isLiked;
  final int likeCount;
  final VoidCallback onTap;

  const _LikeButton({
    required this.isLiked,
    required this.likeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgIconSimple.asset(
            AppIcons.heartSvg,
            size: 24,
            color: isLiked ? Colors.red : null,
          ),
          if (likeCount > 0) ...[
            const SizedBox(width: 4),
            Text(
              '$likeCount',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CommentButton extends StatelessWidget {
  final int commentCount;
  final VoidCallback? onTap;

  const _CommentButton({
    required this.commentCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIconSimple.asset(
          AppIcons.messageSvg,
          size: 24,
        ),
        if (commentCount > 0) ...[
          const SizedBox(width: 4),
          Text(
            '$commentCount',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

class _ShareButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _ShareButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SvgIconSimple.asset(
      AppIcons.sendMessageLineSvg,
      size: 24,
    );
  }
}

