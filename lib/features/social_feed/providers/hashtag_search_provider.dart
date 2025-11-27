import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/hashtag_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// State provider for debounced search query
final hashtagSearchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for searching hashtags (uses debounced query)
final hashtagSearchProvider = FutureProvider<HashtagSearchResponseModel>(
  (ref) async {
    final query = ref.watch(hashtagSearchQueryProvider);
    
    if (query.trim().isEmpty) {
      // Return empty result if query is empty
      return const HashtagSearchResponseModel(
        query: '',
        result: [],
        canCreate: false,
      );
    }

    final socialFeedService = ref.read(socialFeedServiceProvider);
    final response = await socialFeedService.searchHashtags(query.trim());

    if (response.error || response.data == null) {
      throw Exception(response.message);
    }

    return response.data!;
  },
);

