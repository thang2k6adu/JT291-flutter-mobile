import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_like_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// Provider để lấy danh sách likes của một post
final postLikesProvider = FutureProvider.family<List<PostLikeModel>, String>(
  (ref, postId) async {
    final socialFeedService = ref.read(socialFeedServiceProvider);
    final response = await socialFeedService.getPostLikes(postId: postId);
    
    if (response.error || response.data == null) {
      throw Exception(response.message);
    }
    
    return response.data!.items;
  },
);

