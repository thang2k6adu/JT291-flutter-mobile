import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/use_cases/use_cases.dart';

/// Provider for SocialFeedController
final socialFeedControllerProvider = 
    NotifierProvider<SocialFeedController, void>(SocialFeedController.new);

/// Controller to manage social feed interactions and UI logic
class SocialFeedController extends Notifier<void> {
  late final FeedUseCase _feedUseCase;
  late final PostInteractionUseCase _postInteractionUseCase;
  late final CreatePostUseCase _createPostUseCase;

  @override
  void build() {
    _feedUseCase = FeedUseCase(ref);
    _postInteractionUseCase = PostInteractionUseCase(ref);
    _createPostUseCase = CreatePostUseCase(ref);
  }

  // =================================================================
  // FRIENDS FEED ACTIONS
  // =================================================================

  Future<void> loadMoreFriendsFeed() async {
    try {
      await _feedUseCase.loadMoreFriendsFeed();
    } catch (e) {
      print('SocialFeedController: loadMoreFriendsFeed error: $e');
    }
  }

  Future<void> refreshFriendsFeed() async {
    try {
      await _feedUseCase.refreshFriendsFeed();
    } catch (e) {
      print('SocialFeedController: refreshFriendsFeed error: $e');
    }
  }

  Future<void> toggleLikeFriendsFeed(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLikeFriendsFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  Future<void> toggleBookmarkFriendsFeed(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleBookmarkFriendsFeed(postId);
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

  Future<void> loadMoreCommunityFeed() async {
    try {
      await _feedUseCase.loadMoreCommunityFeed();
    } catch (e) {
      print('SocialFeedController: loadMoreCommunityFeed error: $e');
    }
  }

  Future<void> refreshCommunityFeed() async {
    try {
      await _feedUseCase.refreshCommunityFeed();
    } catch (e) {
      print('SocialFeedController: refreshCommunityFeed error: $e');
    }
  }

  Future<void> toggleLikeCommunityFeed(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLikeCommunityFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  Future<void> toggleBookmarkCommunityFeed(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleBookmarkCommunityFeed(postId);
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

  Future<void> loadMoreLatestFeed() async {
    try {
      await _feedUseCase.loadMoreLatestFeed();
    } catch (e) {
      print('SocialFeedController: loadMoreLatestFeed error: $e');
    }
  }

  Future<void> refreshLatestFeed() async {
    try {
      await _feedUseCase.refreshLatestFeed();
    } catch (e) {
      print('SocialFeedController: refreshLatestFeed error: $e');
    }
  }

  Future<void> toggleLikeLatestFeed(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLikeLatestFeed error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  Future<void> toggleBookmarkLatestFeed(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleBookmarkLatestFeed(postId);
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

  Future<void> refreshHotTopics() async {
    try {
      await _feedUseCase.refreshHotTopics();
    } catch (e) {
      print('SocialFeedController: refreshHotTopics error: $e');
    }
  }

  // =================================================================
  // CREATE POST ACTIONS
  // =================================================================

  Future<PostModel?> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
    required BuildContext context,
  }) async {
    try {
      final createdPost = await _createPostUseCase.createPost(
        content: content,
        privacy: privacy,
        hashtags: hashtags,
        media: media,
      );
      
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

  void resetCreatePost() {
    _createPostUseCase.resetCreatePost();
  }

  // =================================================================
  // GENERIC ACTIONS
  // =================================================================

  Future<void> toggleLike(String postId, BuildContext context) async {
    try {
      await _postInteractionUseCase.toggleLike(postId);
    } catch (e) {
      print('SocialFeedController: toggleLike error: $e');
      if (context.mounted) {
        _showErrorMessage(context, 'Failed to like post');
      }
    }
  }

  void navigateToPostDetail(BuildContext context, String postId) {
    print('SocialFeedController: Navigate to post detail: $postId');
  }

  void navigateToUserProfile(BuildContext context, String userId) {
    print('SocialFeedController: Navigate to user profile: $userId');
  }

  Future<void> sharePost(BuildContext context, String postId) async {
    print('SocialFeedController: Share post: $postId');
    if (context.mounted) {
      _showInfoMessage(context, 'Share functionality coming soon');
    }
  }

  Future<void> reportPost(BuildContext context, String postId) async {
    print('SocialFeedController: Report post: $postId');
    if (context.mounted) {
      _showInfoMessage(context, 'Report functionality coming soon');
    }
  }

  void navigateToHashtagPosts(BuildContext context, String hashtag) {
    print('SocialFeedController: Navigate to hashtag: $hashtag');
  }

  // =================================================================
  // UI HELPERS
  // =================================================================

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
