import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/hashtag_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/notification_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_like_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/report_reason_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

/// Service for social feed API operations
class SocialFeedService {
  final ApiService _apiService = ApiService();

  SocialFeedService();

  /// Sanitize post JSON to handle null values
  Map<String, dynamic> _sanitizePostJson(Map<String, dynamic> json) {
    final safeJson = Map<String, dynamic>.from(json);
    
    // Handle required fields - ensure they are not null
    safeJson['id'] = safeJson['id'] as String? ?? 
                     safeJson['id']?.toString() ?? 
                     '';
    safeJson['content'] = safeJson['content'] as String? ?? 
                          safeJson['content']?.toString() ?? 
                          '';
    
    // Handle created_at - ensure it's a valid string
    if (safeJson['created_at'] == null) {
      safeJson['created_at'] = DateTime.now().toIso8601String();
    } else if (safeJson['created_at'] is! String) {
      safeJson['created_at'] = safeJson['created_at'].toString();
    }
    
    // Handle user object
    if (safeJson['user'] is Map) {
      final userMap = Map<String, dynamic>.from(safeJson['user'] as Map);
      userMap['id'] = userMap['id'] as String? ?? 
                      userMap['id']?.toString() ?? 
                      '';
      // Handle both 'nickname' and 'name' fields (API might use 'name')
      userMap['nickname'] = userMap['nickname'] as String? ?? 
                            userMap['name'] as String? ?? 
                            userMap['nickname']?.toString() ??
                            userMap['name']?.toString() ??
                            '';
      safeJson['user'] = userMap;
    } else if (safeJson['user'] == null) {
      // If user is null, create a minimal user object
      safeJson['user'] = {
        'id': '',
        'nickname': '',
      };
    }
    
    return safeJson;
  }

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

  /// GET /posts/{postId}/likes
  /// Get list of likes for a post
  Future<ApiResponse<PaginatedData<PostLikeModel>>> getPostLikes({
    required String postId,
    int page = 1,
    int limit = 20,
    String? search,
    String? sort,
    DateTime? since,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }
      
      if (sort != null && sort.isNotEmpty) {
        queryParams['sort'] = sort;
      }
      
      if (since != null) {
        queryParams['since'] = since.toIso8601String();
      }

      final response = await _apiService.get(
        '/posts/$postId/likes',
        queryParameters: queryParams,
      );

      return ApiResponse.fromJson(
        response,
        (data) {
          // Handle paginated response: { items: [...], meta: {...} }
          if (data is Map<String, dynamic>) {
            if (data.containsKey('items')) {
              // Paginated response
              return PaginatedData.fromJson(
                data,
                (item) => PostLikeModel.fromJson(item as Map<String, dynamic>),
                dataKey: 'items',
                metaKey: 'meta',
              );
            }
          }
          
          // Handle direct list response
          if (data is List<dynamic>) {
            return PaginatedData(
              items: data
                  .map((item) => PostLikeModel.fromJson(item as Map<String, dynamic>))
                  .toList(),
              meta: PaginationMeta(),
            );
          }
          
          throw Exception('Invalid response data format: expected Map or List but got ${data.runtimeType}');
        },
      );
    } catch (e) {
      print("SocialFeedService.getPostLikes: error=${e.toString()}");
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

  /// POST /hashtags
  /// Create a new hashtag
  Future<ApiResponse<Map<String, dynamic>>> createHashtag(String name) async {
    try {
      final requestBody = {'name': name};
      final response = await _apiService.post('/hashtags', data: requestBody);
      
      return ApiResponse.fromJson(
        response,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      print("SocialFeedService.createHashtag: error=${e.toString()}");
      rethrow;
    }
  }

  /// GET /hashtags/search
  /// Search for hashtags
  Future<ApiResponse<HashtagSearchResponseModel>> searchHashtags(String query) async {
    try {
      final response = await _apiService.get(
        '/hashtags/search',
        queryParameters: {'query': query},
      );
      return ApiResponse.fromJson(
        response,
        (data) => HashtagSearchResponseModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (e) {
      print("SocialFeedService.searchHashtags: error=${e.toString()}");
      rethrow;
    }
  }

  /// GET /notifications
  /// Get list of notifications with pagination
  Future<ApiResponse<PaginatedData<NotificationModel>>> getNotifications({
    int page = 1,
    int limit = 20,
    NotificationType? type,
    bool? unreadOnly,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      if (type != null) {
        queryParams['type'] = type.name;
      }
      if (unreadOnly != null) {
        queryParams['unread_only'] = unreadOnly;
      }

      final response = await _apiService.get(
        '/notifications',
        queryParameters: queryParams,
      );

      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => NotificationModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("SocialFeedService.getNotifications: error=${e.toString()}");
      rethrow;
    }
  }

  /// PATCH /notifications/{id}/read
  /// Mark a notification as read
  Future<ApiResponse<Map<String, dynamic>>> markNotificationAsRead(String notificationId) async {
    try {
      final response = await _apiService.patch(
        '/notifications/$notificationId/read',
      );
      return ApiResponse.fromJson(
        response,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      print("SocialFeedService.markNotificationAsRead: error=${e.toString()}");
      rethrow;
    }
  }

  /// POST /api/posts
  /// Create a new post
  Future<ApiResponse<PostModel>> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags, // API vẫn nhận List<String>
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

  /// GET /hashtags/{hashtagId}
  /// Get hashtag detail by ID
  Future<ApiResponse<HashtagDetailModel>> getHashtagDetail(String hashtagId) async {
    try {
      final response = await _apiService.get('/hashtags/$hashtagId');
      
      return ApiResponse.fromJson(
        response,
        (data) => HashtagDetailModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (e) {
      print("SocialFeedService.getHashtagDetail: error=${e.toString()}");
      rethrow;
    }
  }

  /// GET /hashtags/{hashtagId}/posts
  /// Get posts by hashtag ID with pagination
  /// [sort] can be "popular" or "latest" (default: "latest")
  Future<ApiResponse<PaginatedData<PostModel>>> getPostsByHashtag({
    required String hashtagId,
    required int page,
    required int limit,
    String sort = 'latest', // "popular" or "latest"
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        'sort': sort,
      };

      final response = await _apiService.get(
        '/hashtags/$hashtagId/posts',
        queryParameters: queryParams,
      );

      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) {
            // Handle null values before parsing
            final safeItem = _sanitizePostJson(item as Map<String, dynamic>);
            return PostModel.fromJson(safeItem);
          },
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("SocialFeedService.getPostsByHashtag: error=${e.toString()}");
      rethrow;
    }
  }

  /// POST /hashtags/{hashtagId}/follow
  /// Follow or unfollow a hashtag
  Future<ApiResponse<Map<String, dynamic>>> toggleFollowHashtag(String hashtagId) async {
    try {
      final response = await _apiService.post('/hashtags/$hashtagId/follow');
      
      return ApiResponse.fromJson(
        response,
        (data) => data as Map<String, dynamic>,
      );
    } catch (e) {
      print("SocialFeedService.toggleFollowHashtag: error=${e.toString()}");
      rethrow;
    }
  }
}

/// Provider for SocialFeedService
final socialFeedServiceProvider = Provider<SocialFeedService>((ref) {
  return SocialFeedService();
});
