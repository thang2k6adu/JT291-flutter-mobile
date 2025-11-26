import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/controllers/social_feed_controller.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_content_list.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_empty_state.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_error_state.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_loading_state.dart';

class FeedList extends ConsumerStatefulWidget {
  final AsyncNotifierProvider<dynamic, List<PostModel>> feedProvider;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onLoadMore;

  const FeedList({
    super.key,
    required this.feedProvider,
    required this.onRefresh,
    required this.onLoadMore,
  });

  @override
  ConsumerState<FeedList> createState() => _FeedListState();
}

class _FeedListState extends ConsumerState<FeedList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(widget.feedProvider);
    final controller = ref.read(socialFeedControllerProvider.notifier);

    return feedState.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const FeedEmptyState();
        }

        return FeedContentList(
          posts: posts,
          onRefresh: widget.onRefresh,
          onLoadMore: widget.onLoadMore,
          onLikeTap: (postId, context) {
            controller.toggleLike(postId, context);
          },
        );
      },
      loading: () => const FeedLoadingState(),
      error: (error, stack) => FeedErrorState(
        error: error,
        onRetry: widget.onRefresh,
      ),
    );
  }
}
