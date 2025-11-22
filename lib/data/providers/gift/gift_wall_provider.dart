import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

/// Provider để quản lý gift wall milestones của user hiện tại
final myGiftWallProvider = AsyncNotifierProvider<MyGiftWallNotifier, List<GiftModel>>(
  MyGiftWallNotifier.new,
);

/// Notifier xử lý gift wall milestones cho user hiện tại
class MyGiftWallNotifier extends BasePaginatedNotifier<GiftModel> {
  late final GiftService _service;

  @override
  Future<List<GiftModel>> build() async {
    _service = ref.read(giftServiceProvider);
    print('MyGiftWallNotifier.build: loading gift wall milestones');
    return super.build();
  }

  @override
  Future<PaginatedResponse<GiftModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    // Lấy user ID của người dùng hiện tại
    final user = ref.watch(userGeneralProvider);
    final userId = user.value?.unionId;
    
    if (userId == null) {
      // User chưa đăng nhập hoặc chưa load xong
      throw Exception('User ID is null');
    }

    print('MyGiftWallNotifier.fetchPage: userId=$userId, page=$page, limit=$limit');

    final apiResponse = await _service.getGiftWallMilestones(
      userId: userId,
      page: page,
      limit: limit,
    );

    print('Gift Wall apiResponse (provider): ${apiResponse?.message}');

    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final giftWallResponse = ApiPaginatedResponse<GiftModel>(apiResponse!);

    // Log error nếu có
    if (giftWallResponse.hasError) {
      print('Get gift wall error: ${giftWallResponse.errorMessage}');
    }

    return giftWallResponse;
  }

  /// Check if a milestone is completed
  bool isMilestoneCompleted(GiftModel milestone) {
    return milestone.currentCount >= milestone.requiredCount;
  }

  /// Get progress percentage for a milestone
  double getMilestoneProgress(GiftModel milestone) {
    if (milestone.requiredCount == 0) return 0.0;
    return (milestone.currentCount / milestone.requiredCount).clamp(0.0, 1.0);
  }

  /// Get number of completed milestones
  int getCompletedCount() {
    final milestones = state.value ?? [];
    return milestones.where((m) => isMilestoneCompleted(m)).length;
  }

  /// Get number of total milestones
  int getTotalCount() {
    return state.value?.length ?? 0;
  }
}

