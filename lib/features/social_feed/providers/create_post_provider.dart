import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';
import 'friends_feed_provider.dart';
import 'community_feed_provider.dart';
import 'latest_feed_provider.dart';

/// Provider for creating a new post
final createPostProvider = AsyncNotifierProvider<CreatePostNotifier, PostModel?>(
  CreatePostNotifier.new,
);

class CreatePostNotifier extends AsyncNotifier<PostModel?> {
  SocialFeedService? _service;

  SocialFeedService get service {
    _service ??= ref.read(socialFeedServiceProvider);
    return _service!;
  }

  @override
  Future<PostModel?> build() async {
    return null;
  }

  /// Create a new post
  Future<void> createPost({
    required String content,
    required PostPrivacy privacy,
    required List<String> hashtags,
    required List<PostMediaModel> media,
  }) async {
    state = const AsyncValue.loading();

    try {
      final response = await service.createPost(
        content: content,
        privacy: privacy,
        hashtags: hashtags,
        media: media,
      );

      if (response.error || response.data == null) {
        state = AsyncValue.error(
          Exception(response.message),
          StackTrace.current,
        );
        return;
      }

      state = AsyncValue.data(response.data);

      ref.invalidate(friendsFeedProvider);
      ref.invalidate(communityFeedProvider);
      ref.invalidate(latestFeedProvider);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }

  /// Reset the state (clear created post)
  void reset() {
    state = const AsyncValue.data(null);
  }
}

