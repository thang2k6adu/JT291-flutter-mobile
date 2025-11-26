import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

// =================================================================
// FRIENDS FEED PROVIDER
// =================================================================

/// Provider for friends feed (posts from friends)
final friendsFeedProvider = AsyncNotifierProvider<
    FriendsFeedNotifier,
    List<PostModel>
>(FriendsFeedNotifier.new);

class FriendsFeedNotifier extends BasePaginatedNotifier<PostModel>
    with ListItemUpdateMixin<PostModel> {
  SocialFeedService? _service;

  SocialFeedService get service {
    _service ??= ref.read(socialFeedServiceProvider);
    return _service!;
  }

  @override
  Future<List<PostModel>> build() async {
    return super.build();
  }

  @override
  String getCacheKey(String? search) {
    return 'friends_feed${search != null && search.isNotEmpty ? "_$search" : ""}';
  }

  @override
  Future<PaginatedResponse<PostModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await service.getFriendsFeed(
      page: page,
      limit: limit,
    );
    print('FriendsFeed fetchPage response: ${response.data?.items.length} items');
    return ApiPaginatedResponse(response);
  }

  /// Toggle like on a post
  Future<void> toggleLike(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post, // No pending state needed for like
      () async {
        final response = await service.toggleLike(postId);
        return !response.error;
      },
      (post, success) {
        if (success) {
          return post.copyWith(
            isLiked: !post.isLiked,
            likeCount: post.isLiked ? post.likeCount - 1 : post.likeCount + 1,
          );
        }
        return post;
      },
    );
  }

  /// Toggle bookmark on a post
  Future<void> toggleBookmark(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post, // No pending state needed for bookmark
      () async {
        final response = await service.toggleBookmark(postId);
        return !response.error;
      },
      (post, success) {
        if (success) {
          return post.copyWith(isBookmarked: !post.isBookmarked);
        }
        return post;
      },
    );
  }
}

// =================================================================
// COMMUNITY FEED PROVIDER
// =================================================================

/// Provider for community feed (posts from everyone)
final communityFeedProvider = AsyncNotifierProvider<
    CommunityFeedNotifier,
    List<PostModel>
>(CommunityFeedNotifier.new);

class CommunityFeedNotifier extends BasePaginatedNotifier<PostModel>
    with ListItemUpdateMixin<PostModel> {
  SocialFeedService? _service;

  SocialFeedService get service {
    _service ??= ref.read(socialFeedServiceProvider);
    return _service!;
  }

  @override
  Future<List<PostModel>> build() async {
    return super.build();
  }

  @override
  String getCacheKey(String? search) {
    return 'community_feed${search != null && search.isNotEmpty ? "_$search" : ""}';
  }

  @override
  Future<PaginatedResponse<PostModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await service.getCommunityFeed(
      page: page,
      limit: limit,
    );
    print('CommunityFeed fetchPage response: ${response.data?.items.length} items');
    return ApiPaginatedResponse(response);
  }

  /// Toggle like on a post
  Future<void> toggleLike(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post,
      () async {
        final response = await service.toggleLike(postId);
        return !response.error;
      },
      (post, success) {
        if (success) {
          return post.copyWith(
            isLiked: !post.isLiked,
            likeCount: post.isLiked ? post.likeCount - 1 : post.likeCount + 1,
          );
        }
        return post;
      },
    );
  }

  /// Toggle bookmark on a post
  Future<void> toggleBookmark(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post,
      () async {
        final response = await service.toggleBookmark(postId);
        return !response.error;
      },
      (post, success) {
        if (success) {
          return post.copyWith(isBookmarked: !post.isBookmarked);
        }
        return post;
      },
    );
  }
}

// =================================================================
// LATEST FEED PROVIDER
// =================================================================

/// Provider for latest feed (all posts sorted by date)
final latestFeedProvider = AsyncNotifierProvider<
    LatestFeedNotifier,
    List<PostModel>
>(LatestFeedNotifier.new);

class LatestFeedNotifier extends BasePaginatedNotifier<PostModel>
    with ListItemUpdateMixin<PostModel> {
  SocialFeedService? _service;

  SocialFeedService get service {
    _service ??= ref.read(socialFeedServiceProvider);
    return _service!;
  }

  @override
  Future<List<PostModel>> build() async {
    return super.build();
  }

  @override
  String getCacheKey(String? search) {
    return 'latest_feed${search != null && search.isNotEmpty ? "_$search" : ""}';
  }

  @override
  Future<PaginatedResponse<PostModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await service.getLatestFeed(
      page: page,
      limit: limit,
    );
    print('LatestFeed fetchPage response: ${response.data?.items.length} items');
    return ApiPaginatedResponse(response);
  }

  /// Toggle like on a post
  Future<void> toggleLike(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post,
      () async {
        final response = await service.toggleLike(postId);
        return !response.error;
      },
      (post, success) {
        if (success) {
          return post.copyWith(
            isLiked: !post.isLiked,
            likeCount: post.isLiked ? post.likeCount - 1 : post.likeCount + 1,
          );
        }
        return post;
      },
    );
  }

  /// Toggle bookmark on a post
  Future<void> toggleBookmark(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post,
      () async {
        final response = await service.toggleBookmark(postId);
        return !response.error;
      },
      (post, success) {
        if (success) {
          return post.copyWith(isBookmarked: !post.isBookmarked);
        }
        return post;
      },
    );
  }
}

// =================================================================
// HOT TOPICS PROVIDER
// =================================================================

/// Provider for hot topics (trending hashtags)
final hotTopicsProvider = FutureProvider<List<HotTopicModel>>((ref) async {
  final service = ref.read(socialFeedServiceProvider);
  final response = await service.getHotTopics();
  
  if (response.error || response.data == null) {
    throw Exception(response.message);
  }
  
  return response.data!;
});

// =================================================================
// CREATE POST PROVIDER
// =================================================================

/// Provider for creating a new post
final createPostProvider = AsyncNotifierProvider<CreatePostNotifier, PostModel?>(
  CreatePostNotifier.new,
);

class CreatePostNotifier extends AsyncNotifier<PostModel?> {
  SocialFeedService? _service;

  SocialFeedService get service {
    _service ??= ref.read(socialFeedServiceProvider);
    return _service!;
  }

  @override
  Future<PostModel?> build() async {
    return null; // Initial state is null (no post created yet)
  }

  /// Create a new post
  /// 
  /// Parameters:
  /// - content: Post content text
  /// - privacy: Post privacy setting (public, friends, private)
  /// - hashtags: List of hashtag strings
  /// - media: List of PostMediaModel objects
  Future<void> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
  }) async {
    state = const AsyncValue.loading();

    try {
      final response = await service.createPost(
        content: content,
        privacy: privacy,
        hashtags: hashtags,
        media: media,
      );

      if (response.error || response.data == null) {
        state = AsyncValue.error(
          Exception(response.message),
          StackTrace.current,
        );
        return;
      }

      state = AsyncValue.data(response.data);

      // Invalidate feed providers to refresh them with the new post
      ref.invalidate(friendsFeedProvider);
      ref.invalidate(communityFeedProvider);
      ref.invalidate(latestFeedProvider);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }

  /// Reset the state (clear created post)
  void reset() {
    state = const AsyncValue.data(null);
  }
}

