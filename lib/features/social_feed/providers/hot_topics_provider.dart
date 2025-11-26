import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// Provider for hot topics (trending hashtags)
final hotTopicsProvider = FutureProvider<List<HotTopicModel>>((ref) async {
  final service = ref.read(socialFeedServiceProvider);
  final response = await service.getHotTopics();
  
  if (response.error || response.data == null) {
    throw Exception(response.message);
  }
  
  return response.data!;
});

