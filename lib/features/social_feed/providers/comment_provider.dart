import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/comment_model.dart';
import 'package:jt291_flutter_mobile/data/services/comment_service.dart';

/// Provider để lấy danh sách comments của một post
final postCommentsProvider = FutureProvider.family<List<CommentModel>, String>(
  (ref, postId) async {
    final commentService = ref.read(commentServiceProvider);
    final response = await commentService.getComments(postId: postId);
    
    if (response.error || response.data == null) {
      throw Exception(response.message);
    }
    
    return response.data!;
  },
);

/// Provider để lấy replies của một comment
final commentRepliesProvider = FutureProvider.family<List<CommentModel>, CommentRepliesParams>(
  (ref, params) async {
    final commentService = ref.read(commentServiceProvider);
    final response = await commentService.getReplies(
      postId: params.postId,
      commentId: params.commentId,
      page: params.page,
      limit: params.limit,
    );
    
    if (response.error || response.data == null) {
      throw Exception(response.message);
    }
    
    return response.data!;
  },
);

/// Parameters cho comment replies provider
class CommentRepliesParams {
  final String postId;
  final String commentId;
  final int page;
  final int limit;

  CommentRepliesParams({
    required this.postId,
    required this.commentId,
    this.page = 1,
    this.limit = 20,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentRepliesParams &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          commentId == other.commentId &&
          page == other.page &&
          limit == other.limit;

  @override
  int get hashCode => postId.hashCode ^ commentId.hashCode ^ page.hashCode ^ limit.hashCode;
}

