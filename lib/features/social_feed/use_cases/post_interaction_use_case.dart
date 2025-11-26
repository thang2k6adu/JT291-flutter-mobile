import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/providers.dart';

/// Use case for post interactions (like, bookmark)
class PostInteractionUseCase {
  final Ref ref;

  PostInteractionUseCase(this.ref);

  /// Toggle like on a post
  /// This method will try to update the post in all feed providers
  Future<void> toggleLike(String postId) async {
    try {
      await Future.wait([
        ref.read(friendsFeedProvider.notifier).toggleLike(postId).catchError((e) => null),
        ref.read(communityFeedProvider.notifier).toggleLike(postId).catchError((e) => null),
        ref.read(latestFeedProvider.notifier).toggleLike(postId).catchError((e) => null),
      ]);
    } catch (e) {
      throw Exception('Failed to toggle like: $e');
    }
  }

  /// Toggle bookmark on a post in friends feed
  Future<void> toggleBookmarkFriendsFeed(String postId) async {
    try {
      await ref.read(friendsFeedProvider.notifier).toggleBookmark(postId);
    } catch (e) {
      throw Exception('Failed to bookmark post in friends feed: $e');
    }
  }

  /// Toggle bookmark on a post in community feed
  Future<void> toggleBookmarkCommunityFeed(String postId) async {
    try {
      await ref.read(communityFeedProvider.notifier).toggleBookmark(postId);
    } catch (e) {
      throw Exception('Failed to bookmark post in community feed: $e');
    }
  }

  /// Toggle bookmark on a post in latest feed
  Future<void> toggleBookmarkLatestFeed(String postId) async {
    try {
      await ref.read(latestFeedProvider.notifier).toggleBookmark(postId);
    } catch (e) {
      throw Exception('Failed to bookmark post in latest feed: $e');
    }
  }
}

