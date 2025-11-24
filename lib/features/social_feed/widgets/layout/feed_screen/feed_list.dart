import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card.dart';

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
    final feedState = ref.watch(widget.feedProvider);

    return feedState.when(
      data: (posts) {
        if (posts.isEmpty) {
          // Dùng ListView để có scroll
          return ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(height: 200), // tạo khoảng trống để kéo
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.feed_outlined,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No posts yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Pull to refresh',
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return RefreshIndicator(
          onRefresh: widget.onRefresh,
          color: Color(0xFFFF69B4),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: posts.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostCard(post: post);
            },
          ),
        );
      },
      loading: () =>
          Center(child: CircularProgressIndicator(color: Color(0xFFFF69B4))),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
            SizedBox(height: 16),
            Text(
              'Error loading posts',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              error.toString(),
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: widget.onRefresh,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF69B4),
                foregroundColor: Colors.white,
              ),
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
