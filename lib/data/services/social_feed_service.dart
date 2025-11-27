import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/report_reason_model.dart';
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

  /// GET /api/posts/{postId}
  /// Returns a single post by ID
  Future<ApiResponse<PostModel>> getPostById(String postId) async {
    try {
      final response = await _apiService.get('/posts/$postId');
      print("SocialFeedService.getPostById response: $response");
      
      return ApiResponse.fromJson(
        response,
        (data) {
          print("SocialFeedService.getPostById data type: ${data.runtimeType}");
          print("SocialFeedService.getPostById data: $data");
          
          // Handle different response structures
          // Structure 1: data is directly the post object
          // Structure 2: data contains a 'post' field
          if (data is Map<String, dynamic>) {
            if (data.containsKey('post')) {
              // Response structure: { "data": { "post": {...} } }
              return PostModel.fromJson(data['post'] as Map<String, dynamic>);
            } else {
              // Response structure: { "data": {...} } - post object directly
              return PostModel.fromJson(data);
            }
          }
          
          throw Exception('Invalid response data format: expected Map but got ${data.runtimeType}');
        },
      );
    } catch (e) {
      print("SocialFeedService.getPostById: error=${e.toString()}");
      rethrow;
    }
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

  /// GET /reports/reasons
  /// Get list of report reasons
  Future<ApiResponse<List<ReportReasonModel>>> getReportReasons() async {
    try {
      final response = await _apiService.get('/reports/reasons');
      return ApiResponse.fromJson(
        response,
        (data) => List.from(data as List<dynamic>)
            .map((item) => ReportReasonModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      print("SocialFeedService.getReportReasons: error=${e.toString()}");
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
      // Convert media to request format
      final mediaList = media.map((m) {
        // Get media type string value - ensure it's never null or empty
        String mediaTypeValue;
        switch (m.type) {
          case MediaType.image:
            mediaTypeValue = 'image';
            break;
          case MediaType.video:
            mediaTypeValue = 'video';
            break;
          case MediaType.audio:
            mediaTypeValue = 'audio';
            break;
        }
        
        // Validate media type value
        if (mediaTypeValue.isEmpty) {
          throw Exception('Invalid media type: ${m.type}');
        }
        
        // Validate URL
        if (m.url.isEmpty) {
          throw Exception('Media URL cannot be empty');
        }
        
        final mediaMap = <String, dynamic>{
          'media_type': mediaTypeValue,
          'media_url': m.url,
        };
        
        if (m.thumbnailUrl != null && m.thumbnailUrl!.isNotEmpty) {
          mediaMap['thumbnail_url'] = m.thumbnailUrl;
        }
        if (m.width != null) {
          mediaMap['width'] = m.width;
        }
        if (m.height != null) {
          mediaMap['height'] = m.height;
        }
        
        print('Media item: media_type=$mediaTypeValue, url=${m.url}');
        return mediaMap;
      }).toList();
      
      // Build request body - only include media if not empty
      final requestBody = <String, dynamic>{
        'content': content,
        'privacy': privacy.name,
        'hashtags': hashtags,
      };
      
      if (mediaList.isNotEmpty) {
        requestBody['media'] = mediaList;
      }
      
      print('SocialFeedService.createPost requestBody: $requestBody');
      print('SocialFeedService.createPost mediaList length: ${mediaList.length}');
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
