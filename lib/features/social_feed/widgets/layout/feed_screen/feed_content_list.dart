import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/mixins/scroll_pagination_mixin.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_card.dart';

/// Content list widget for feed with posts
class FeedContentList extends StatefulWidget {
  final List<PostModel> posts;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onLoadMore;
  final Function(String, BuildContext)? onLikeTap;
  final Function(String, BuildContext)? onCommentTap;
  final Function(String, BuildContext)? onShareTap;
  final bool Function()? hasNext;
  final bool Function()? isLoadingMore;

  const FeedContentList({
    super.key,
    required this.posts,
    required this.onRefresh,
    required this.onLoadMore,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
    this.hasNext,
    this.isLoadingMore,
  });

  @override
  State<FeedContentList> createState() => _FeedContentListState();
}

class _FeedContentListState extends State<FeedContentList>
    with ScrollPaginationMixin {
  @override
  Future<void> Function() get onLoadMore => widget.onLoadMore;

  @override
  bool Function() get hasNext => widget.hasNext ?? super.hasNext;

  @override
  bool Function() get isLoadingMore => widget.isLoadingMore ?? super.isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      color: const Color(0xFFFF69B4),
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.posts.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return PostCard(
            post: post,
            onLikeTap: widget.onLikeTap != null
                ? () => widget.onLikeTap!(post.id, context)
                : null,
            onCommentTap: widget.onCommentTap != null
                ? () => widget.onCommentTap!(post.id, context)
                : null,
            onShareTap: widget.onShareTap != null
                ? () => widget.onShareTap!(post.id, context)
                : null,
          );
        },
      ),
    );
  }
}

