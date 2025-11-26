import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

/// Service for social feed API operations
class SocialFeedService {
  final ApiService _apiService = ApiService();

  SocialFeedService();

  /// GET /api/feed/friends
  /// Returns paginated feed from friends
  Future<ApiResponse<PaginatedData<PostModel>>> getFriendsFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    final response = await _apiService.get(
      '/friends/feed',
      queryParameters: {'page': page, 'limit': limit},
    );

    return ApiResponse.fromJson(
      response,
      (data) => PaginatedData.fromJson(
        data as Map<String, dynamic>,
        (item) => PostModel.fromJson(item as Map<String, dynamic>),
        dataKey: 'items',
        metaKey: 'meta',
      ),
    );
  }

  /// GET /api/feed/community
  /// Returns paginated community feed
  Future<ApiResponse<PaginatedData<PostModel>>> getCommunityFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    try {
      final response = await _apiService.get(
        '/community/posts',
        queryParameters: {'page': page, 'limit': limit},
      );

      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => PostModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("SocialFeedService.getCommunityFeed: error=${e.toString()}");
      rethrow;
    }
  }

  /// GET /api/feed/latest
  /// Returns paginated latest posts (all posts sorted by date)
  Future<ApiResponse<PaginatedData<PostModel>>> getLatestFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    try {
      final response = await _apiService.get(
        '/latest/feed',
        queryParameters: {'page': page, 'limit': limit},
      );

      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => PostModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("SocialFeedService.getLatestFeed: error=${e.toString()}");
      rethrow;
    }
  }

  /// GET /api/feed/hot-topics
  /// Returns list of hot/trending topics
  Future<ApiResponse<List<HotTopicModel>>> getHotTopics() async {
    final response = await _apiService.get('/community/categories');
    return ApiResponse.fromJson(
      response,
      (data) => List.from(data as List<dynamic>)
          .map((item) => HotTopicModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// POST /posts/{postId}/likes
  /// Like/React post
  Future<ApiResponse<Map<String, dynamic>>> toggleLike(
    String postId, {
    String reaction = 'like',
  }) async {
    try {
      final requestBody = {'reaction': reaction};
      final response = await _apiService.post(
        '/posts/$postId/likes',
        data: requestBody,
      );

      return ApiResponse.fromJson(
        response,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      print("SocialFeedService.toggleLike: error=${e.toString()}");
      rethrow;
    }
  }

  /// POST /api/posts/{postId}/bookmark
  /// Toggle bookmark on a post
  Future<ApiResponse<bool>> toggleBookmark(String postId) async {
    try {
      final response = await _apiService.post('/posts/$postId/bookmark');
      return ApiResponse.fromJson(
        response,
        (data) => data as bool? ?? true,
      );
    } catch (e) {
      print("SocialFeedService.toggleBookmark: error=${e.toString()}");
      rethrow;
    }
  }

  /// POST /api/posts
  /// Create a new post
  Future<ApiResponse<PostModel>> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
  }) async {
    try {
      final requestBody = {
        'content': content,
        'privacy': privacy.name,
        'hashtags': hashtags,
        'media': media.map((m) => {
          'media_type': m.type.name,
          'media_url': m.url,
          if (m.thumbnailUrl != null) 'thumbnail_url': m.thumbnailUrl,
          if (m.width != null) 'width': m.width,
          if (m.height != null) 'height': m.height,
        }).toList(),
      };

      final response = await _apiService.post('/posts', data: requestBody);

      return ApiResponse.fromJson(
        response,
        (data) => PostModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (e) {
      print("SocialFeedService.createPost: error=${e.toString()}");
      rethrow;
    }
  }
}

/// Provider for SocialFeedService
final socialFeedServiceProvider = Provider<SocialFeedService>((ref) {
  return SocialFeedService();
});
