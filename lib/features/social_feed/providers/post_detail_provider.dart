import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// Provider để lấy chi tiết một post theo ID
final postDetailProvider = FutureProvider.family<PostModel, String>(
  (ref, postId) async {
    try {
      final socialFeedService = ref.read(socialFeedServiceProvider);
      final response = await socialFeedService.getPostById(postId);
      
      print("postDetailProvider response.error: ${response.error}");
      print("postDetailProvider response.data: ${response.data}");
      print("postDetailProvider response.message: ${response.message}");
      
      if (response.error || response.data == null) {
        throw Exception(response.message);
      }
      
      return response.data!;
    } catch (e, stackTrace) {
      print("postDetailProvider error: $e");
      print("postDetailProvider stackTrace: $stackTrace");
      rethrow;
    }
  },
);

