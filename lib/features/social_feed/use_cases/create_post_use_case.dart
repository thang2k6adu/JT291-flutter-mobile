import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/providers.dart';

/// Use case for creating posts
class CreatePostUseCase {
  final Ref ref;

  CreatePostUseCase(this.ref);

  /// Create a new post
  Future<PostModel?> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
  }) async {
    try {
      await ref.read(createPostProvider.notifier).createPost(
        content: content,
        privacy: privacy,
        hashtags: hashtags,
        media: media,
      );

      final createdPost = ref.read(createPostProvider).value;
      return createdPost;
    } catch (e) {
      throw Exception('Failed to create post: $e');
    }
  }

  /// Reset create post state
  void resetCreatePost() {
    ref.read(createPostProvider.notifier).reset();
  }
}

