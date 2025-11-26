import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/social/report_reason_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// Provider for report reasons
final reportReasonsProvider = FutureProvider<List<ReportReasonModel>>((ref) async {
  final service = ref.read(socialFeedServiceProvider);
  final response = await service.getReportReasons();
  
  if (response.error || response.data == null) {
    throw Exception(response.message);
  }
  
  return response.data!;
});

