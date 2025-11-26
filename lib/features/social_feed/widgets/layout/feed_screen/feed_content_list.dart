import 'package:flutter/material.dart';
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

  const FeedContentList({
    super.key,
    required this.posts,
    required this.onRefresh,
    required this.onLoadMore,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  State<FeedContentList> createState() => _FeedContentListState();
}

class _FeedContentListState extends State<FeedContentList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      color: const Color(0xFFFF69B4),
      child: ListView.builder(
        controller: _scrollController,
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

