import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/no_results_widget.dart';
import 'package:jt291_flutter_mobile/data/models/social/hashtag_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';
import 'package:jt291_flutter_mobile/features/social_feed/controllers/social_feed_controller.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/hashtag_provider.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_content_list.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_error_state.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_loading_state.dart';

class HashtagScreen extends ConsumerStatefulWidget {
  final String hashtagId;

  const HashtagScreen({super.key, required this.hashtagId});

  @override
  ConsumerState<HashtagScreen> createState() => _HashtagScreenState();
}

class _HashtagScreenState extends ConsumerState<HashtagScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Load initial data for both tabs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load popular tab
      ref
          .read(
            hashtagPostsProvider(
              HashtagPostsParams(hashtagId: widget.hashtagId, sort: 'popular'),
            ).notifier,
          )
          .refresh();

      // Load latest tab
      ref
          .read(
            hashtagPostsProvider(
              HashtagPostsParams(hashtagId: widget.hashtagId, sort: 'latest'),
            ).notifier,
          )
          .refresh();
    });
  }

  void _onTabChanged() {
    // Tab changed - data will be loaded automatically by provider family
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleFollowToggle() async {
    final service = ref.read(socialFeedServiceProvider);
    try {
      await service.toggleFollowHashtag(widget.hashtagId);
      // Refresh hashtag detail
      ref.invalidate(hashtagDetailProvider(widget.hashtagId));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  Widget _buildTabContent(String sort) {
    final postsParams = HashtagPostsParams(
      hashtagId: widget.hashtagId,
      sort: sort,
    );
    final postsAsync = ref.watch(hashtagPostsProvider(postsParams));
    final controller = ref.read(socialFeedControllerProvider.notifier);

    return postsAsync.when(
      data: (posts) {
        if (posts.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(hashtagPostsProvider(postsParams).notifier)
                  .refresh();
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 100),
                NoMatchingResults(message: 'No posts yet.'),
              ],
            ),
          );
        }

        return FeedContentList(
          posts: posts,
          onRefresh: () async {
            await ref
                .read(hashtagPostsProvider(postsParams).notifier)
                .refresh();
          },
          onLoadMore: () async {
            await ref
                .read(hashtagPostsProvider(postsParams).notifier)
                .loadMore();
          },
          hasNext: () =>
              ref.read(hashtagPostsProvider(postsParams).notifier).hasNext,
          isLoadingMore: () => ref
              .read(hashtagPostsProvider(postsParams).notifier)
              .isLoadingMore,
          onLikeTap: (postId, context) {
            controller.toggleLike(postId, context);
          },
        );
      },
      loading: () => const FeedLoadingState(),
      error: (error, stack) => FeedErrorState(
        error: error,
        onRetry: () {
          ref.read(hashtagPostsProvider(postsParams).notifier).refresh();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hashtagDetailAsync = ref.watch(
      hashtagDetailProvider(widget.hashtagId),
    );

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
          // Tabs with rounded top corners
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
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
          ),
          // Posts feed with TabBarView
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Popular tab
                  _buildTabContent('popular'),
                  // Latest tab
                  _buildTabContent('latest'),
                ],
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
                  hashtag.name.startsWith('#')
                      ? hashtag.name
                      : '#${hashtag.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_formatNumber(hashtag.postCount)} Status Line, ${_formatNumber(hashtag.viewCount)} Views',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
