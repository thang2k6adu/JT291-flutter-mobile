import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/providers.dart';

/// Use case for managing feed operations
class FeedUseCase {
  final Ref ref;

  FeedUseCase(this.ref);

  /// Load more friends feed posts
  Future<void> loadMoreFriendsFeed() async {
    try {
      await ref.read(friendsFeedProvider.notifier).loadMore();
    } catch (e) {
      throw Exception('Failed to load more friends feed: $e');
    }
  }

  /// Refresh friends feed
  Future<void> refreshFriendsFeed() async {
    try {
      await ref.read(friendsFeedProvider.notifier).refresh();
    } catch (e) {
      throw Exception('Failed to refresh friends feed: $e');
    }
  }

  /// Load more community feed posts
  Future<void> loadMoreCommunityFeed() async {
    try {
      await ref.read(communityFeedProvider.notifier).loadMore();
    } catch (e) {
      throw Exception('Failed to load more community feed: $e');
    }
  }

  /// Refresh community feed
  Future<void> refreshCommunityFeed() async {
    try {
      await ref.read(communityFeedProvider.notifier).refresh();
    } catch (e) {
      throw Exception('Failed to refresh community feed: $e');
    }
  }

  /// Load more latest feed posts
  Future<void> loadMoreLatestFeed() async {
    try {
      await ref.read(latestFeedProvider.notifier).loadMore();
    } catch (e) {
      throw Exception('Failed to load more latest feed: $e');
    }
  }

  /// Refresh latest feed
  Future<void> refreshLatestFeed() async {
    try {
      await ref.read(latestFeedProvider.notifier).refresh();
    } catch (e) {
      throw Exception('Failed to refresh latest feed: $e');
    }
  }

  /// Refresh hot topics
  Future<void> refreshHotTopics() async {
    try {
      ref.invalidate(hotTopicsProvider);
    } catch (e) {
      throw Exception('Failed to refresh hot topics: $e');
    }
  }
}

