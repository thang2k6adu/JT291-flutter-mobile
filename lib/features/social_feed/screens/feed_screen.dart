import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/social/social_feed_provider.dart';
import 'package:jt291_flutter_mobile/features/social_feed/controllers/social_feed_controller.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_app_bar.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_list.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isCommunity = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    setState(() {
      _isCommunity = _tabController.index == 1;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(socialFeedControllerProvider.notifier);
    final hotTopics = ref.read(hotTopicsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FeedAppBar(
        isCommunity: _isCommunity,
        controller: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 0: Friends Feed
          FeedList(
            feedProvider: friendsFeedProvider,
            onRefresh: () => controller.refreshFriendsFeed(),
            onLoadMore: () => controller.loadMoreFriendsFeed(),
          ),
          // Tab 1: Community Feed
          FeedList(
            feedProvider: communityFeedProvider,
            onRefresh: () => controller.refreshCommunityFeed(),
            onLoadMore: () => controller.loadMoreCommunityFeed(),
          ),
          // Tab 2: Latest Feed
          FeedList(
            feedProvider: latestFeedProvider,
            onRefresh: () => controller.refreshLatestFeed(),
            onLoadMore: () => controller.loadMoreLatestFeed(),
          ),
        ],
      ),
    );
  }
}