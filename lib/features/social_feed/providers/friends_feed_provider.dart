import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

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
    return ApiPaginatedResponse(response);
  }

  /// Toggle like on a post
  Future<void> toggleLike(String postId) async {
    await updateItemAsync(
      (post) => post.id == postId,
      (post) => post,
      () async {
        final response = await service.toggleLike(postId);
        if (response.error || response.data == null) {
          return false;
        }
        return true;
      },
      (post, success) {
        if (success) {
          final newIsLiked = !post.isLiked;
          final newLikeCount = newIsLiked 
              ? post.likeCount + 1 
              : (post.likeCount > 0 ? post.likeCount - 1 : 0);
          
          return post.copyWith(
            isLiked: newIsLiked,
            likeCount: newLikeCount,
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

