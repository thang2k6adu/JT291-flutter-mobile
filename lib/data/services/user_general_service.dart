import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/profile_view_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_level_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_relationship_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_stats_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/relationship_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/profile_view_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/search_user_mock.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

PaginationModel buildPagination(Map<String, dynamic>? json) {
  if (json == null) return const PaginationModel();

  final pagination = PaginationModel.fromJson(json);
  final hasNext =
      ((pagination.offset ?? 1) * (pagination.limit ?? 10)) <
      (pagination.total ?? 0);

  return pagination.copyWith(hasNext: hasNext);
}

class UserGeneralService {
  final ApiService _apiService = ApiService();
  final mockUserId = 'bb335450-d70f-4f7c-913d-2145006eb973';

  UserGeneralService();

  /// Lấy thông tin người dùng hiện tại (dựa trên accessToken)
  FutureOr<UserModel?> getCurrentUser() async {
    try {
      // final response = await _apiService.get('/v1/users/me');
      final response = await _apiService.get('/auth/me');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      print("getCurrentUser failed: $e");
      throw Exception('Get current user failed: $e');
    }
  }

  /// Cập nhật thông tin người dùng hiện tại
  /// [data] có thể bao gồm nickname, bio, gender, date_of_birth,...
  FutureOr<bool> updateCurrentUser(Map<String, dynamic> data) async {
    try {
      print('updateCurrentUser: $data');
      final response = await _apiService.patch('/profile/me', data: data);
      print('updateCurrentUser response: $response');
      return response['success'] as bool;
    } catch (e) {
      print("updateCurrentUser failed: $e");
      throw Exception('Update current user failed: $e');
    }
  }

  /// Lấy thông tin profile của người dùng khác qua [userId]
  FutureOr<UserModel?> getUserProfile(String userId) async {
    try {
      // Mock delay
      // await Future.delayed(const Duration(milliseconds: 500));

      // // Mock data - tìm user trong search_user_mock data
      // final allUsers = allSearchUsersMockData;

      // final foundUser = allUsers.firstWhere(
      //   (u) => u.id == userId,
      //   orElse: () => allUsers.isNotEmpty
      //       ? allUsers.first
      //       : UserModel(
      //           id: userId,
      //           nickname: 'Unknown User',
      //           avatar: 'https://i.pravatar.cc/150?u=unknown',
      //           bio: 'This is a mock user profile',
      //           gender: 'male',
      //           isFollowing: false,
      //         ),
      // );

      // // Return user with full profile data
      // return foundUser.copyWith(
      //   profileUrls: [
      //     'https://picsum.photos/400/600?random=$userId',
      //     'https://picsum.photos/400/600?random=${userId}2',
      //     'https://picsum.photos/400/600?random=${userId}3',
      //   ],
      //   interests: ['Music', 'Travel', 'Photography', 'Food'],
      //   birthday: DateTime(1995, 3, 15),
      //   level: const UserLevelModel(
      //     currentLevel: 25,
      //     currentExp: 750,
      //     totalExp: 2500,
      //     nextLevelExp: 1000,
      //   ),
      // );

      // Khi có API thật:
      final response = await _apiService.get('/users/$userId');

      print('getUserProfile response: $response');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      print("getUserProfile failed: $e");
      throw Exception('Get user profile failed: $e');
    }
  }

  /// Lấy token để sử dụng Stream (chat, video call, ...)
  FutureOr<String?> getStreamToken() async {
    try {
      final response = await _apiService.get('/v1/users/stream/token');
      return response['data']['token'] as String;
    } catch (e) {
      print("getStreamToken failed: $e");
      throw Exception('Get stream token failed: $e');
    }
  }

  /// Upload nhiều file ảnh (avatar, profile URLs)
  /// [files] là danh sách File cần upload
  FutureOr<List<String>> uploadAttachments(List<File> files) async {
    try {
      final formData = FormData();

      for (final file in files) {
        formData.files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      print('uploadAttachments formData: $formData');

      final response = await _apiService.post(
        '/upload/images',
        data: formData,
        headers: {'Content-Type': 'multipart/form-data'},
      );
      
      print('uploadAttachments response: $response');

      final List<dynamic> urls = response['data']['urls'];
      return urls.map((e) => e as String).toList();
    } catch (e) {
      print("uploadAttachments failed: $e");
      throw Exception('Upload attachments failed: $e');
    }
  }

  /// get Following list
  /// GET /v1/users/123/followers?page=2&limit=10&search=john
  FutureOr<ApiResponse<PaginatedData<UserModel>>?> getFollowingList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      // Mock data
      // await Future.delayed(const Duration(milliseconds: 500));

      // var allData = followingMock.data ?? [];
      // if (search != null && search.isNotEmpty) {
      //   allData = allData
      //       .where(
      //         (u) =>
      //             u.nickname.toLowerCase().contains(search.toLowerCase()) ||
      //             (u.bio?.toLowerCase().contains(search.toLowerCase()) ??
      //                 false),
      //       )
      //       .toList();
      // }
      // final start = (page - 1) * limit;
      // final end = (start + limit).clamp(0, allData.length);
      // final pagedData = allData.sublist(start, end);

      // // Tạo response phân trang mock
      // return UserListResponse(
      //   data: pagedData,
      //   pagination: PaginationModel(
      //     offset: page,
      //     limit: limit,
      //     total: allData.length,
      //     hasNext: end < allData.length,
      //   ),
      // );
      print(
        'getFollowingList queryParameters: {page: $page, limit: $limit, search: $search, type: following}',
      );

      final response = await _apiService.get(
        '/connections/following',
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': search,
        },
      );

      print('getFollowingList response: $response');
      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => UserModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("getFollowingList failed: $e");
      throw Exception('Get following list failed: $e');
    }
  }

  /// get Follower list
  FutureOr<ApiResponse<PaginatedData<UserModel>>?> getFollowerList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 500));

      // var allData = followerMock.data ?? [];
      // if (search != null && search.isNotEmpty) {
      //   allData = allData
      //       .where(
      //         (u) =>
      //             u.nickname.toLowerCase().contains(search.toLowerCase()) ||
      //             (u.bio?.toLowerCase().contains(search.toLowerCase()) ??
      //                 false),
      //       )
      //       .toList();
      // }
      // final start = (page - 1) * limit;
      // final end = (start + limit).clamp(0, allData.length);
      // final pagedData = allData.sublist(start, end);

      // // Tạo response phân trang mock
      // return UserListResponse(
      //   data: pagedData,
      //   pagination: PaginationModel(
      //     offset: page,
      //     limit: limit,
      //     total: allData.length,
      //     hasNext: end < allData.length,
      //   ),
      // );
      final response = await _apiService.get(
        '/connections/followers',
        queryParameters: {
          'page': page,
          'limit': limit,
          'search': search,
        },
      );
      print('getFollowerList response: $response');
      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => UserModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("getFollowerList failed: $e");
      throw Exception('Get follower list failed: $e');
    }
  }

  /// get Friend list
  FutureOr<ApiResponse<PaginatedData<UserModel>>?> getFriendList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      // await Future.delayed(
      //   const Duration(milliseconds: 500),
      // ); // simulate network delay
      // var allData = friendMock.data ?? [];
      // if (search != null && search.isNotEmpty) {
      //   allData = allData
      //       .where(
      //         (u) =>
      //             u.nickname.toLowerCase().contains(search.toLowerCase()) ||
      //             (u.bio?.toLowerCase().contains(search.toLowerCase()) ??
      //                 false),
      //       )
      //       .toList();
      // }
      // final start = (page - 1) * limit;
      // final end = (start + limit).clamp(0, allData.length);
      // final pagedData = allData.sublist(start, end);

      // return ApiResponse<PaginatedData<UserModel>>(
      //   error: false,
      //   code: 200,
      //   message: 'Friend list fetched successfully',
      //   data: PaginatedData<UserModel>(
      //     items: pagedData,
      //     meta: PaginationMeta(
      //       itemCount: allData.length,
      //       totalItems: allData.length,
      //       itemsPerPage: limit,
      //       totalPages: (allData.length / limit).ceil(),
      //       currentPage: page,
      //     ),
      //   ),
      // );

      final response = await _apiService.get(
        '/connections/friends',
        queryParameters: {'page': page, 'limit': limit, 'search': search},
      );
      // Xây pagination (tự tính hasNext)
      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => UserModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("getFriendList failed: $e");
      throw Exception('Get friend list failed: $e');
    }
  }

  FutureOr<bool> followUser(String userId, String targetId) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 300));
      // print('Follow user $targetId');
      // return true;

      final response = await _apiService.post(
        '/connections/following/$targetId',
      );
      if (response['error'] == false) {
        return true;
      } else {
        throw Exception('Follow user failed: ${response['message']}');
      }
    } catch (e) {
      print("followUser failed: $e");
      throw Exception('Follow user failed: $e');
    }
  }

  FutureOr<bool> unfollowUser(String userId, String followingId) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 300));
      // print('Unfollow user $followingId');
      // return true;

      final response = await _apiService.delete(
        '/connections/following/$followingId',
      );
      if (response['error'] == false) {
        return true;
      } else {
        throw Exception('Unfollow user failed: ${response['message']}');
      }
    } catch (e) {
      print("unfollowUser failed: $e");
      throw Exception('Unfollow user failed: $e');
    }
  }

  /// Hủy follower (xóa người đang follow mình)
  FutureOr<bool> removeFollower(String userId, String followerId) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 300));
      final response = await _apiService.delete(
        '/connections/followers/$followerId',
      );
      print('Remove follower $followerId');
      if (response['error'] == false) {
        return true;
      } else {
        throw Exception('Remove follower failed: ${response['message']}');
      }

      // final response = await _apiService.delete('/connections/followers/$followerId');
    } catch (e) {
      print("removeFollower failed: $e");
      throw Exception('Remove follower failed: $e');
    }
  }

  /// Hủy kết bạn
  FutureOr<bool> unfriend(String userId, String friendId) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 300));
      // print('Unfriend $friendId');
      // return true;

      final response = await _apiService.delete(
        '/connections/friends/$friendId',
      );
      if (response['error'] == false) {
        return true;
      } else {
        throw Exception('Unfriend failed: ${response['message']}');
      }
    } catch (e) {
      print("unfriend failed: $e");
      throw Exception('Unfriend failed: $e');
    }
  }

  /// Lấy thống kê bạn bè/follow
  FutureOr<UserStatsModel?> getUserStats(String userId) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 300));
      // return userStatsMock;

      final response = await _apiService.get('/connections/stats');

      print('getUserStats response: $response');
      return UserStatsModel.fromJson(response['data']);
    } catch (e) {
      print("getUserStats failed: $e");
      throw Exception('Get user stats failed: $e');
    }
  }

  /// GET /users/{user_id}/following?search=<query>
  FutureOr<UserListResponse?> searchFollowing(
    String userId, {
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400)); // simulate delay

      var data = followingMock.data;

      // Filter theo search khi dùng mock
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (u) =>
                  u.nickname.toLowerCase().contains(search.toLowerCase()) ||
                  (u.bio?.toLowerCase().contains(search.toLowerCase()) ??
                      false),
            )
            .toList();
      }

      return followingMock.copyWith(data: data);

      // Khi có API thật:
      // final response = await _apiService.get(
      //   '/v1/users/$userId/following',
      //   queryParameters: {'search': search},
      // );
      // return UserListResponse.fromJson(response);
    } catch (e) {
      print('searchFollowing failed: $e');
      throw Exception('Search following failed: $e');
    }
  }

  /// GET /users/{user_id}/followers?search=<query>
  FutureOr<UserListResponse?> searchFollower(
    String userId, {
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var data = followerMock.data;
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (u) =>
                  u.nickname.toLowerCase().contains(search.toLowerCase()) ||
                  (u.bio?.toLowerCase().contains(search.toLowerCase()) ??
                      false),
            )
            .toList();
      }

      return followerMock.copyWith(data: data);

      // Khi có API thật:
      // final response = await _apiService.get(
      //   '/v1/users/$userId/followers',
      //   queryParameters: {'search': search},
      // );
      // return UserListResponse.fromJson(response);
    } catch (e) {
      print('searchFollower failed: $e');
      throw Exception('Search follower failed: $e');
    }
  }

  /// GET /users/{user_id}/friends?search=<query>
  FutureOr<UserListResponse?> searchFriend(
    String userId, {
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var data = friendMock.data;
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (u) =>
                  u.nickname.toLowerCase().contains(search.toLowerCase()) ||
                  (u.bio?.toLowerCase().contains(search.toLowerCase()) ??
                      false),
            )
            .toList();
      }

      return friendMock.copyWith(data: data);

      // Khi có API thật:
      // final response = await _apiService.get(
      //   '/v1/users/$userId/friends',
      //   queryParameters: {'search': search},
      // );
      // return UserListResponse.fromJson(response);
    } catch (e) {
      print('searchFriend failed: $e');
      throw Exception('Search friend failed: $e');
    }
  }

  /// GET /users/{user_id}/profile-views?page=2&limit=10
  FutureOr<ProfileViewModel?> getProfileViews(
    String userId, {
    int page = 1,
    int limit = 10,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var allData = profileViewMock.views ?? [];
      final start = (page - 1) * limit;
      final end = (start + limit).clamp(0, allData.length);
      final pagedData = allData.sublist(start, end);

      return profileViewMock.copyWith(
        views: pagedData,
        pagination: PaginationModel(
          offset: page,
          limit: limit,
          total: allData.length,
          hasNext: end < allData.length,
        ),
      );

      // final response = await _apiService.get(
      //   '/v1/users/$userId/profile-views',
      //   queryParameters: {'page': page, 'limit': limit},
      // );
      // final pagination = buildPagination(response['pagination']);
      // return ProfileViewModel.fromJson(response['data'], pagination: pagination);
      // );
    } catch (e) {
      print('getProfileViews failed: $e');
      throw Exception('Get profile views failed: $e');
    }
  }

  /// Lấy thông tin relationship giữa current user và target user
  /// GET /v1/users/relationship/{targetUserId}
  FutureOr<UserRelationshipModel> getUserRelationship(
    String targetUserId,
  ) async {
    try {
      // Mock delay
      await Future.delayed(const Duration(milliseconds: 300));

      // Nếu id có chứa "me" hoặc "current" thì là chính mình
      if (targetUserId.toLowerCase().contains('me') ||
          targetUserId.toLowerCase().contains('current')) {
        return const UserRelationshipModel(
          isMe: true,
          isFollowing: false,
          isFollower: false,
          isFriend: false,
        );
      }

      // Check trong following list
      final isInFollowing = allSearchUsersMockData.any(
        (u) => u.id == targetUserId && u.isFollowing,
      );

      final isInFollower = allSearchUsersMockData.any(
        (u) => u.id == targetUserId && u.followStatus == 'follower',
      );
      final isInFriend = allSearchUsersMockData.any(
        (u) => u.id == targetUserId && u.followStatus == 'friend',
      );

      return UserRelationshipModel(
        isMe: false,
        isFollowing: isInFollowing,
        isFollower: isInFollower,
        isFriend: isInFriend,
        isBlocked: false,
      );

      // Khi có API thật:
      // final response = await _apiService.get('/v1/users/relationship/$targetUserId');
      // return UserRelationshipModel.fromJson(response['data']);
    } catch (e) {
      print("getUserRelationship failed: $e");
      throw Exception('Get user relationship failed: $e');
    }
  }

  /// Search users trong toàn hệ thống
  /// GET /v1/users?query=<query>&page=1&limit=10
  /// Returns ApiResponse<PaginatedData<UserModel>> directly from backend
  FutureOr<ApiResponse<PaginatedData<UserModel>>> searchUsers({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      // await Future.delayed(const Duration(milliseconds: 500));

      // // Return mock API response directly
      // return mockSearchUsersApiResponse(query: query, page: page, limit: limit);

      print('searchUsers query: $query');
      // Khi có API thật, parse và return ApiResponse:
      // TODO: Data bên be nên trả về meta data (pagination)
      final response = await _apiService.get(
        '/users',
        queryParameters: {'search': query, 'page': page, 'limit': limit},
      );

      print('searchUsers response: $response');
      return ApiResponse.fromJson(
        response,
        (data) => PaginatedData.fromJson(
          data as Map<String, dynamic>,
          (item) => UserModel.fromJson(item as Map<String, dynamic>),
          dataKey: 'items',
          metaKey: 'meta',
        ),
      );
    } catch (e) {
      print("searchUsers failed: $e");
      throw Exception('Search users failed: $e');
    }
  }
}

/// Provider để inject vào Riverpod
final userGeneralServiceProvider = Provider<UserGeneralService>((ref) {
  return UserGeneralService();
});
