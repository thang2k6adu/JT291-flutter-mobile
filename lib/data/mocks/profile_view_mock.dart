import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/profile_view_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/viewer_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/mock_api_response.dart';

// final profileViewMock = ProfileViewModel(
//   userId: 'user123',
//   canViewFull: true,
//   total: 20,
//   views: List.generate(20, (i) => ViewerModel(
//     viewerId: 'viewer${i + 1}',
//     username: 'Viewer ${i + 1}',
//     avatarUrl: 'https://example.com/avatar/viewer${i + 1}.png',
//     gender: i.isEven ? 'Male' : 'Female',
//     shortBio: 'Bio of viewer ${i + 1}',
//     viewTime: DateTime.now().subtract(Duration(hours: i)),
//   )),
//   pagination: PaginationModel(
//     limit: 10,
//     offset: 0,
//     total: 20,
//   ),
// );
final profileViewMock = ProfileViewModel(
  userId: 'user123',
  canViewFull: false,
  total: 20,
  views: List.generate(20, (i) => ViewerModel(
    viewerId: 'viewer${i + 1}',
    username: 'Viewer ${i + 1}',
    avatarUrl: 'https://example.com/avatar/viewer${i + 1}.png',
    gender: i.isEven ? 'Male' : 'Female',
    shortBio: 'Bio of viewer ${i + 1}',
    viewTime: DateTime.now().subtract(Duration(hours: i)),
  )),
  pagination: PaginationModel(
    limit: 10,
    offset: 0,
    total: 20,
  ),
);

/// ===============================
/// 🎯 API RESPONSE WRAPPERS
/// ===============================

/// Mock API Response for Profile Views (Paginated)
ApiResponse<PaginatedData<ViewerModel>> mockProfileViewsApiResponse({
  int page = 1,
  int limit = 10,
  bool canViewFull = false,
}) {
  final allViewers = profileViewMock.views;
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, allViewers.length);
  final pagedViewers = canViewFull 
      ? allViewers.sublist(start, end)
      : allViewers.take(3).toList(); // Nếu không có quyền xem full, chỉ show 3 viewers

  return mockPaginatedResponse<ViewerModel>(
    items: pagedViewers,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: canViewFull ? allViewers.length : 3,
    message: 'Profile views fetched successfully',
  );
}

/// Mock API Response for Profile View Summary
final mockProfileViewSummaryApiResponse = mockSuccessResponse<Map<String, dynamic>>(
  {
    'user_id': profileViewMock.userId,
    'can_view_full': profileViewMock.canViewFull,
    'total': profileViewMock.total,
    'recent_views': profileViewMock.views.take(3).map((v) => {
      'viewer_id': v.viewerId,
      'username': v.username,
      'avatar_url': v.avatarUrl,
      'view_time': v.viewTime.toIso8601String(),
    }).toList(),
  },
  message: 'Profile view summary fetched successfully',
);
