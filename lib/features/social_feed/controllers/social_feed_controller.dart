import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/providers/social/social_feed_provider.dart';

/// Provider for SocialFeedController
final socialFeedControllerProvider = 
    NotifierProvider<SocialFeedController, void>(SocialFeedController.new);

/// Controller to manage social feed interactions and UI logic
class SocialFeedController extends Notifier<void> {
  @override
  void build() {
    // Controller initialization
  }

  // =================================================================
  // FRIENDS FEED ACTIONS
  // =================================================================

  /// Load more friends feed posts
  Future<void> loadMoreFriendsFeed() async {
    try {
      await ref.read(friendsFeedProvider.notifier).loadMore();
    } catch (e) {
      print('SocialFeedController: loadMoreFriendsFeed error: $e');
    }
  }

  /// Refresh friends feed
  Future<void> refreshFriendsFeed() async {
    try {
      await ref.read(friendsFeedProvider.notifier).refresh();
    } catch (e) {
      print('SocialFeedController: refreshFriendsFeed error: $e');
    }
  }

  /// Toggle like on a post in friends feed
  Future<void> toggleLikeFriendsFeed(String postId, BuildContext context) async {
    try {
      await ref.read(friendsFeedProvider.notifier).toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLikeFriendsFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  /// Toggle bookmark on a post in friends feed
  Future<void> toggleBookmarkFriendsFeed(String postId, BuildContext context) async {
    try {
      await ref.read(friendsFeedProvider.notifier).toggleBookmark(postId);
    } catch (e) {
      print('SocialFeedController: toggleBookmarkFriendsFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to bookmark post');
      }
    }
  }

  // =================================================================
  // COMMUNITY FEED ACTIONS
  // =================================================================

  /// Load more community feed posts
  Future<void> loadMoreCommunityFeed() async {
    try {
      await ref.read(communityFeedProvider.notifier).loadMore();
    } catch (e) {
      print('SocialFeedController: loadMoreCommunityFeed error: $e');
    }
  }

  /// Refresh community feed
  Future<void> refreshCommunityFeed() async {
    try {
      await ref.read(communityFeedProvider.notifier).refresh();
    } catch (e) {
      print('SocialFeedController: refreshCommunityFeed error: $e');
    }
  }

  /// Toggle like on a post in community feed
  Future<void> toggleLikeCommunityFeed(String postId, BuildContext context) async {
    try {
      await ref.read(communityFeedProvider.notifier).toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLikeCommunityFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  /// Toggle bookmark on a post in community feed
  Future<void> toggleBookmarkCommunityFeed(String postId, BuildContext context) async {
    try {
      await ref.read(communityFeedProvider.notifier).toggleBookmark(postId);
    } catch (e) {
      print('SocialFeedController: toggleBookmarkCommunityFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to bookmark post');
      }
    }
  }

  // =================================================================
  // LATEST FEED ACTIONS
  // =================================================================

  /// Load more latest feed posts
  Future<void> loadMoreLatestFeed() async {
    try {
      await ref.read(latestFeedProvider.notifier).loadMore();
    } catch (e) {
      print('SocialFeedController: loadMoreLatestFeed error: $e');
    }
  }

  /// Refresh latest feed
  Future<void> refreshLatestFeed() async {
    try {
      await ref.read(latestFeedProvider.notifier).refresh();
    } catch (e) {
      print('SocialFeedController: refreshLatestFeed error: $e');
    }
  }

  /// Toggle like on a post in latest feed
  Future<void> toggleLikeLatestFeed(String postId, BuildContext context) async {
    try {
      await ref.read(latestFeedProvider.notifier).toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLikeLatestFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  /// Toggle bookmark on a post in latest feed
  Future<void> toggleBookmarkLatestFeed(String postId, BuildContext context) async {
    try {
      await ref.read(latestFeedProvider.notifier).toggleBookmark(postId);
    } catch (e) {
      print('SocialFeedController: toggleBookmarkLatestFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to bookmark post');
      }
    }
  }

  // =================================================================
  // HOT TOPICS ACTIONS
  // =================================================================

  /// Refresh hot topics
  Future<void> refreshHotTopics() async {
    try {
      ref.invalidate(hotTopicsProvider);
    } catch (e) {
      print('SocialFeedController: refreshHotTopics error: $e');
    }
  }

  // =================================================================
  // CREATE POST ACTIONS
  // =================================================================

  /// Create a new post
  /// 
  /// Parameters:
  /// - content: Post content text
  /// - privacy: Post privacy setting (public, friends, private)
  /// - hashtags: List of hashtag strings
  /// - media: List of PostMediaModel objects
  /// - context: BuildContext for showing messages
  /// 
  /// Returns the created PostModel if successful, null otherwise
  Future<PostModel?> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
    required BuildContext context,
  }) async {
    try {
      await ref.read(createPostProvider.notifier).createPost(
        content: content,
        privacy: privacy,
        hashtags: hashtags,
        media: media,
      );

      final createdPost = ref.read(createPostProvider).value;
      
      if (createdPost != null && context.mounted) {
        _showInfoMessage(context, 'Post created successfully');
        return createdPost;
      } else if (context.mounted) {
        _showErrorMessage(context, 'Failed to create post');
        return null;
      }
      
      return createdPost;
    } catch (e) {
      print('SocialFeedController: createPost error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to create post: ${e.toString()}');
      }
      return null;
    }
  }

  /// Reset create post state
  void resetCreatePost() {
    ref.read(createPostProvider.notifier).reset();
  }

  // =================================================================
  // GENERIC ACTIONS (can be used across all feeds)
  // =================================================================

  /// Navigate to post detail
  void navigateToPostDetail(BuildContext context, String postId) {
    // TODO: Implement navigation to post detail screen
    print('SocialFeedController: Navigate to post detail: $postId');
  }

  /// Navigate to user profile
  void navigateToUserProfile(BuildContext context, String userId) {
    // TODO: Implement navigation to user profile screen
    print('SocialFeedController: Navigate to user profile: $userId');
  }

  /// Share post
  Future<void> sharePost(BuildContext context, String postId) async {
    // TODO: Implement share functionality
    print('SocialFeedController: Share post: $postId');
    if (context.mounted) {
      _showInfoMessage(context, 'Share functionality coming soon');
    }
  }

  /// Report post
  Future<void> reportPost(BuildContext context, String postId) async {
    // TODO: Implement report functionality
    print('SocialFeedController: Report post: $postId');
    if (context.mounted) {
      _showInfoMessage(context, 'Report functionality coming soon');
    }
  }

  /// Navigate to hashtag posts
  void navigateToHashtagPosts(BuildContext context, String hashtag) {
    // TODO: Implement navigation to hashtag posts screen
    print('SocialFeedController: Navigate to hashtag: $hashtag');
  }

  // =================================================================
  // UI HELPERS
  // =================================================================

  /// Show error snackbar
  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Show info snackbar
  void _showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

