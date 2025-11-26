import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';
import 'dart:convert';

/// Service để lấy social feed data
/// Hiện tại dùng mock data, sau này sẽ connect với API thực
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
    print(
      'SocialFeedService.getFriendsFeed: page=$page, limit=$limit, since=$since',
    );

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

    // // Simulate network delay
    // await Future.delayed(const Duration(milliseconds: 500));

    // // Return mock data
    // return mockFriendsFeedApiResponse(
    //   page: page,
    //   limit: limit,
    //   since: since,
    // );
  }

  /// GET /api/feed/community
  /// Returns paginated community feed
  Future<ApiResponse<PaginatedData<PostModel>>> getCommunityFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    try {
      print(
        'SocialFeedService.getCommunityFeed: page=$page, limit=$limit, since=$since',
      );

      final response = await _apiService.get(
        '/community/posts',
        queryParameters: {'page': page, 'limit': limit},
      );

      print("RAW RESPONSE = ${jsonEncode(response)}");
      print("RAW RESPONSE DATA = ${jsonEncode(response['data']['meta'])}");

      final apiResponse = ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => PostModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );

      print('SocialFeedService.getCommunityFeed: apiResponse=$apiResponse');

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
    // Simulate network delay
    // await Future.delayed(const Duration(milliseconds: 500));

    // // Return mock data
    // return mockCommunityFeedApiResponse(
    //   page: page,
    //   limit: limit,
    //   since: since,
    // );
  }

  /// GET /api/feed/latest
  /// Returns paginated latest posts (all posts sorted by date)
  Future<ApiResponse<PaginatedData<PostModel>>> getLatestFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    print(
      'SocialFeedService.getLatestFeed: page=$page, limit=$limit, since=$since',
    );

    try {
      final response = await _apiService.get('/latest/feed', queryParameters: {'page': page, 'limit': limit});
      print("RAW RESPONSE = ${jsonEncode(response)}");
      print("RAW RESPONSE DATA = ${jsonEncode(response['data']['meta'])}");

      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(data as Map<String, dynamic>, (item) => PostModel.fromJson(item as Map<String, dynamic>), dataKey: 'items', metaKey: 'meta'),
      );
    } catch (e) {
      print("SocialFeedService.getLatestFeed: error=${e.toString()}");
      rethrow;
    }
    // // Simulate network delay
    // await Future.delayed(const Duration(milliseconds: 500));

    // // Return mock data
    // return mockLatestFeedApiResponse(page: page, limit: limit, since: since);
  }

  /// GET /api/feed/hot-topics
  /// Returns list of hot/trending topics
  Future<ApiResponse<List<HotTopicModel>>> getHotTopics() async {
    print('SocialFeedService.getHotTopics');

    final response = await _apiService.get('/community/categories');
    return ApiResponse.fromJson(
      response,
      (data) => List.from(data as List<dynamic>)
          .map((item) => HotTopicModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    // Simulate network delay
    // await Future.delayed(const Duration(milliseconds: 300));

    // // Return mock data
    // return mockHotTopicsApiResponse();
  }

  /// POST /api/posts/{postId}/like
  /// Toggle like on a post
  Future<ApiResponse<bool>> toggleLike(String postId) async {
    print('SocialFeedService.toggleLike: postId=$postId');

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Mock successful response
    return ApiResponse<bool>(
      error: false,
      code: 200,
      message: 'Post like toggled successfully',
      data: true,
      traceId: 'mock_trace_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// POST /api/posts/{postId}/bookmark
  /// Toggle bookmark on a post
  Future<ApiResponse<bool>> toggleBookmark(String postId) async {
    print('SocialFeedService.toggleBookmark: postId=$postId');

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Mock successful response
    return ApiResponse<bool>(
      error: false,
      code: 200,
      message: 'Post bookmark toggled successfully',
      data: true,
      traceId: 'mock_trace_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// POST /api/posts
  /// Create a new post
  /// 
  /// Parameters:
  /// - content: Post content text
  /// - privacy: Post privacy setting (public, friends, private)
  /// - hashtags: List of hashtag strings
  /// - media: List of PostMediaModel objects
  Future<ApiResponse<PostModel>> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
  }) async {
    print(
      'SocialFeedService.createPost: content=$content, privacy=$privacy, hashtags=$hashtags, media=${media.length}',
    );

    try {
      // Prepare request body
      final requestBody = {
        'content': content,
        'privacy': privacy.name,
        'hashtags': hashtags,
        'media': media.map((m) => {
          'media_type': m.type.name, // API yêu cầu media_type thay vì type
          'media_url': m.url, // API yêu cầu media_url thay vì url
          if (m.thumbnailUrl != null) 'thumbnail_url': m.thumbnailUrl,
          if (m.width != null) 'width': m.width,
          if (m.height != null) 'height': m.height,
          // duration không được gửi ở root level theo API
        }).toList(),
      };

      print("REQUEST BODY = ${jsonEncode(requestBody)}");

      // Call API
      final response = await _apiService.post(
        '/posts',
        data: requestBody,
      );

      print("RESPONSE = ${jsonEncode(response)}");

      // Parse response
      return ApiResponse.fromJson(
        response,
        (data) => PostModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (e) {
      print("SocialFeedService.createPost: error=${e.toString()}");
      
      // Mock response for development/testing
      // Simulate network delay
      // Generate mock post
      final postId = 'post_${DateTime.now().millisecondsSinceEpoch}';
      final mockUser = UserModel(
        id: 'current_user',
        nickname: 'Current User',
        avatar: 'https://i.pravatar.cc/300?u=current_user',
      );

      final mockPost = PostModel(
        id: postId,
        user: mockUser,
        content: content,
        media: media,
        hashtags: hashtags,
        likeCount: 0,
        commentCount: 0,
        shareCount: 0,
        isLiked: false,
        isBookmarked: false,
        createdAt: DateTime.now(),
        privacy: privacy,
      );

      return ApiResponse<PostModel>(
        error: false,
        code: 201,
        message: 'Post created successfully',
        data: mockPost,
        traceId: 'mock_trace_${DateTime.now().millisecondsSinceEpoch}',
      );
    }
  }
}

/// Provider for SocialFeedService
final socialFeedServiceProvider = Provider<SocialFeedService>((ref) {
  return SocialFeedService();
});
