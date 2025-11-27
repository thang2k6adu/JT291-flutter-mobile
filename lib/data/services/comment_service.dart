import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/comment_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

/// Service for comment API operations
class CommentService {
  final ApiService _apiService = ApiService();

  CommentService();

  /// GET /posts/{post_id}/comments
  /// Lấy danh sách comments của post
  Future<ApiResponse<List<CommentModel>>> getComments({
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
        '/posts/$postId/comments',
        queryParameters: queryParams,
      );

      print("CommentService.getComments response: $response");

      return ApiResponse.fromJson(
        response,
        (data) {
          print("CommentService.getComments data type: ${data.runtimeType}");
          print("CommentService.getComments data: $data");
          
          // Handle paginated response: { items: [...], meta: {...} }
          if (data is Map<String, dynamic>) {
            if (data.containsKey('items')) {
              // Paginated response
              final items = data['items'] as List<dynamic>? ?? [];
              return items
                  .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            } else {
              // Direct list (fallback)
              return List.from(data as List<dynamic>)
                  .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            }
          }
          
          // Handle direct list response
          if (data is List<dynamic>) {
            return data
            .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          
          throw Exception('Invalid response data format: expected Map or List but got ${data.runtimeType}');
        },
      );
    } catch (e) {
      print("CommentService.getComments: error=${e.toString()}");
      rethrow;
    }
  }

  /// POST /posts/{post_id}/comments
  /// Tạo comment mới
  Future<ApiResponse<CommentModel>> createComment({
    required String postId,
    required String content,
    String? parentId, // null nếu là comment đầu tiên, có giá trị nếu là reply
  }) async {
    try {
      final requestBody = <String, dynamic>{
        'content': content,
      };
      
      if (parentId != null && parentId.isNotEmpty) {
        requestBody['parent_id'] = parentId;
      }

      final response = await _apiService.post(
        '/posts/$postId/comments',
        data: requestBody,
      );

      return ApiResponse.fromJson(
        response,
        (data) => CommentModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (e) {
      print("CommentService.createComment: error=${e.toString()}");
      rethrow;
    }
  }

  /// GET /posts/{post_id}/comments/{comment_id}/replies
  /// Lấy danh sách replies của comment
  Future<ApiResponse<List<CommentModel>>> getReplies({
    required String postId,
    required String commentId,
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
        '/posts/$postId/comments/$commentId/replies',
        queryParameters: queryParams,
      );

      print("CommentService.getReplies response: $response");

      return ApiResponse.fromJson(
        response,
        (data) {
          print("CommentService.getReplies data type: ${data.runtimeType}");
          print("CommentService.getReplies data: $data");
          
          // Handle paginated response: { items: [...], meta: {...} }
          if (data is Map<String, dynamic>) {
            if (data.containsKey('items')) {
              // Paginated response
              final items = data['items'] as List<dynamic>? ?? [];
              return items
                  .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            } else {
              // Direct list (fallback)
              return List.from(data as List<dynamic>)
                  .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
                  .toList();
            }
          }
          
          // Handle direct list response
          if (data is List<dynamic>) {
            return data
            .map((item) => CommentModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          
          throw Exception('Invalid response data format: expected Map or List but got ${data.runtimeType}');
        },
      );
    } catch (e) {
      print("CommentService.getReplies: error=${e.toString()}");
      rethrow;
    }
  }

  /// PATCH /posts/{post_id}/comments/{comment_id}
  /// Cập nhật comment
  Future<ApiResponse<CommentModel>> updateComment({
    required String postId,
    required String commentId,
    required String content,
  }) async {
    try {
      final requestBody = {
        'content': content,
      };

      final response = await _apiService.patch(
        '/posts/$postId/comments/$commentId',
        data: requestBody,
      );

      return ApiResponse.fromJson(
        response,
        (data) => CommentModel.fromJson(data as Map<String, dynamic>),
      );
    } catch (e) {
      print("CommentService.updateComment: error=${e.toString()}");
      rethrow;
    }
  }

  /// DELETE /posts/{post_id}/comments/{comment_id}
  /// Xóa comment
  Future<ApiResponse<void>> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    try {
      final response = await _apiService.delete(
        '/posts/$postId/comments/$commentId',
      );

      return ApiResponse.fromJson(
        response,
        (data) => null,
      );
    } catch (e) {
      print("CommentService.deleteComment: error=${e.toString()}");
      rethrow;
    }
  }
}

/// Provider for CommentService
final commentServiceProvider = Provider<CommentService>((ref) {
  return CommentService();
});

