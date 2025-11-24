import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/social_feed_mock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service để lấy social feed data
/// Hiện tại dùng mock data, sau này sẽ connect với API thực
class SocialFeedService {
  SocialFeedService();

  /// GET /api/feed/friends
  /// Returns paginated feed from friends
  Future<ApiResponse<PaginatedData<PostModel>>> getFriendsFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    print('SocialFeedService.getFriendsFeed: page=$page, limit=$limit, since=$since');
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock data
    return mockFriendsFeedApiResponse(
      page: page,
      limit: limit,
      since: since,
    );
  }

  /// GET /api/feed/community
  /// Returns paginated community feed
  Future<ApiResponse<PaginatedData<PostModel>>> getCommunityFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    print('SocialFeedService.getCommunityFeed: page=$page, limit=$limit, since=$since');
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock data
    return mockCommunityFeedApiResponse(
      page: page,
      limit: limit,
      since: since,
    );
  }

  /// GET /api/feed/latest
  /// Returns paginated latest posts (all posts sorted by date)
  Future<ApiResponse<PaginatedData<PostModel>>> getLatestFeed({
    required int page,
    required int limit,
    DateTime? since,
  }) async {
    print('SocialFeedService.getLatestFeed: page=$page, limit=$limit, since=$since');
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return mock data
    return mockLatestFeedApiResponse(
      page: page,
      limit: limit,
      since: since,
    );
  }

  /// GET /api/feed/hot-topics
  /// Returns list of hot/trending topics
  Future<ApiResponse<List<HotTopicModel>>> getHotTopics() async {
    print('SocialFeedService.getHotTopics');
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Return mock data
    return mockHotTopicsApiResponse();
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
}

/// Provider for SocialFeedService
final socialFeedServiceProvider = Provider<SocialFeedService>((ref) {
  return SocialFeedService();
});

