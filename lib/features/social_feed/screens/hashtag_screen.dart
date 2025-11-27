import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/no_results_widget.dart';
import 'package:jt291_flutter_mobile/core/mixins/scroll_pagination_mixin.dart';
import 'package:jt291_flutter_mobile/data/models/social/hashtag_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/hashtag_provider.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_card.dart';

class HashtagScreen extends ConsumerStatefulWidget {
  final String hashtagId;

  const HashtagScreen({
    super.key,
    required this.hashtagId,
  });

  @override
  ConsumerState<HashtagScreen> createState() => _HashtagScreenState();
}

class _HashtagScreenState extends ConsumerState<HashtagScreen>
    with SingleTickerProviderStateMixin, ScrollPaginationMixin {
  late TabController _tabController;
  String _currentSort = 'latest'; // 'popular' or 'latest'

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hashtagPostsProvider(HashtagPostsParams(
        hashtagId: widget.hashtagId,
        sort: _currentSort,
      )).notifier).refresh().then((_) {
        checkLoadMoreIfListNotFull();
      });
    });
  }

  void _onTabChanged() {
    final newSort = _tabController.index == 0 ? 'popular' : 'latest';
    if (newSort != _currentSort) {
      setState(() {
        _currentSort = newSort;
      });
      // Provider family will automatically create new instance with new params
      // Just need to refresh and check load more
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(hashtagPostsProvider(HashtagPostsParams(
          hashtagId: widget.hashtagId,
          sort: _currentSort,
        )).notifier).refresh().then((_) {
          checkLoadMoreIfListNotFull();
        });
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  ScrollController get scrollController => super.scrollController;

  @override
  Future<void> Function() get onLoadMore => () async {
    await ref.read(hashtagPostsProvider(HashtagPostsParams(
      hashtagId: widget.hashtagId,
      sort: _currentSort,
    )).notifier).loadMore();
  };

  @override
  bool Function() get hasNext => () => ref.read(hashtagPostsProvider(
    HashtagPostsParams(
      hashtagId: widget.hashtagId,
      sort: _currentSort,
    ),
  ).notifier).hasNext;

  @override
  bool Function() get isLoadingMore => () => ref.read(hashtagPostsProvider(
    HashtagPostsParams(
      hashtagId: widget.hashtagId,
      sort: _currentSort,
    ),
  ).notifier).isLoadingMore;

  Future<void> _handleFollowToggle() async {
    // TODO: Implement follow/unfollow hashtag
    final service = ref.read(socialFeedServiceProvider);
    try {
      await service.toggleFollowHashtag(widget.hashtagId);
      // Refresh hashtag detail
      ref.invalidate(hashtagDetailProvider(widget.hashtagId));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hashtagDetailAsync = ref.watch(hashtagDetailProvider(widget.hashtagId));
    final postsParams = HashtagPostsParams(
      hashtagId: widget.hashtagId,
      sort: _currentSort,
    );
    final postsAsync = ref.watch(hashtagPostsProvider(postsParams));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(
        title: 'Hashtag',
        backgroundColor: const Color(0xFFE8F4F8), // Light blue/purple
        textColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, size: 24),
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
        ],
        bottom: hashtagDetailAsync.when(
          data: (hashtag) => _HashtagDetailSection(
            hashtag: hashtag,
            onFollowTap: _handleFollowToggle,
          ),
          loading: () => const PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          error: (_, __) => const PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: SizedBox(),
          ),
        ),
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              tabs: const [
                Tab(text: 'Popular'),
                Tab(text: 'Latest'),
              ],
            ),
          ),
          // Posts feed
          Expanded(
            child: postsAsync.when(
              data: (posts) {
                if (posts.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await ref.read(hashtagPostsProvider(postsParams).notifier).refresh();
                      checkLoadMoreIfListNotFull();
                    },
                    child: ListView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 100),
                        const NoMatchingResults(
                          message: 'No posts yet.',
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await ref.read(hashtagPostsProvider(postsParams).notifier).refresh();
                    checkLoadMoreIfListNotFull();
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: posts.length + (isLoadingMore() ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < posts.length) {
                        final post = posts[index];
                        return PostCard(post: post);
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: ${error.toString()}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(hashtagPostsProvider(postsParams).notifier).refresh();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Hashtag detail section widget (used as AppBar bottom)
class _HashtagDetailSection extends StatelessWidget
    implements PreferredSizeWidget {
  final HashtagDetailModel hashtag;
  final VoidCallback onFollowTap;

  const _HashtagDetailSection({
    required this.hashtag,
    required this.onFollowTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(0)}k';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFE8F4F8), // Light blue/purple background
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: (hashtag.thumbnail != null && hashtag.thumbnail!.isNotEmpty)
                ? Image.network(
                    hashtag.thumbnail!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                        child: const Icon(Icons.tag, color: Colors.grey),
                      );
                    },
                  )
                : Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: const Icon(Icons.tag, color: Colors.grey),
                  ),
          ),
          const SizedBox(width: 12),
          // Hashtag name and stats
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hashtag.name.startsWith('#') ? hashtag.name : '#${hashtag.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_formatNumber(hashtag.postCount)} Status Line, ${_formatNumber(hashtag.viewCount)} Views',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Follow button
          ElevatedButton(
            onPressed: onFollowTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE56C8C), // Pink color
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: Text(
              hashtag.isFollowing ? 'Following' : 'Follow',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

