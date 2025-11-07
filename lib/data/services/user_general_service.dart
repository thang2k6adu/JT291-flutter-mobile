import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/relationship_mock.dart';
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

  UserGeneralService();

  /// Lấy thông tin người dùng hiện tại (dựa trên accessToken)
  FutureOr<UserModel?> getCurrentUser() async {
    try {
      final response = await _apiService.get('/v1/users/me');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      print("getCurrentUser failed: $e");
      return null;
    }
  }

  /// Cập nhật thông tin người dùng hiện tại
  /// [data] có thể bao gồm nickname, bio, gender, date_of_birth,...
  FutureOr<bool> updateCurrentUser(Map<String, dynamic> data) async {
    try {
      print('updateCurrentUser: $data');
      final response = await _apiService.put('/v1/users/me', data: data);
      return response['success'] as bool;
    } catch (e) {
      print("updateCurrentUser failed: $e");
      return false;
    }
  }

  /// Lấy thông tin profile của người dùng khác qua [userId]
  FutureOr<UserModel?> getUserProfile(String userId) async {
    try {
      final response = await _apiService.get('/v1/users/profile/$userId');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      print("getUserProfile failed: $e");
      return null;
    }
  }

  /// Lấy token để sử dụng Stream (chat, video call, ...)
  FutureOr<String?> getStreamToken() async {
    try {
      final response = await _apiService.get('/v1/users/stream/token');
      return response['data']['token'] as String;
    } catch (e) {
      print("getStreamToken failed: $e");
      return null;
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

      final response = await _apiService.post(
        '/v1/users/attachments/upload',
        data: formData,
        headers: {'Content-Type': 'multipart/form-data'},
      );

      final List<dynamic> urls = response['data'];
      return urls
          .map((e) => (e as Map<String, dynamic>)['source_url'] as String)
          .toList();
    } catch (e) {
      print("uploadAttachments failed: $e");
      return [];
    }
  }

  /// get Following list
  /// GET /v1/users/123/followers?page=2&limit=10&search=john
  FutureOr<UserListResponse?> getFollowingList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      // Mock data
      await Future.delayed(const Duration(milliseconds: 500));

      var allData = followingMock.data ?? [];
      if (search != null && search.isNotEmpty) {
        allData = allData
            .where(
              (u) =>
                  u.username?.toLowerCase().contains(search.toLowerCase()) ??
                  false,
            )
            .toList();
      }
      final start = (page - 1) * limit;
      final end = (start + limit).clamp(0, allData.length);
      final pagedData = allData.sublist(start, end);

      // Tạo response phân trang mock
      return UserListResponse(
        data: pagedData,
        pagination: PaginationModel(
          offset: page,
          limit: limit,
          total: allData.length,
          hasNext: end < allData.length,
        ),
      );

      // final response = await _apiService.get(
      //   '/v1/users/following',
      //   queryParameters: {'page': page, 'limit': limit, 'search': search},
      // );
      // Xây pagination (tự tính hasNext)
      // final pagination = buildPagination(response['pagination']);

      // // Trả về dữ liệu hoàn chỉnh
      // return UserListResponse(
      //   data:
      //       (response['data'] as List<dynamic>?)
      //           ?.map((e) => UserSummaryModel.fromJson(e))
      //           .toList() ??
      //       [],
      //   pagination: pagination,
      // );
    } catch (e) {
      print("getFollowingList failed: $e");
      return const UserListResponse(data: []);
    }
  }

  /// get Follower list
  FutureOr<UserListResponse?> getFollowerList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      var allData = followerMock.data ?? [];
      if (search != null && search.isNotEmpty) {
        allData = allData
            .where(
              (u) =>
                  u.username?.toLowerCase().contains(search.toLowerCase()) ??
                  false,
            )
            .toList();
      }
      final start = (page - 1) * limit;
      final end = (start + limit).clamp(0, allData.length);
      final pagedData = allData.sublist(start, end);

      // Tạo response phân trang mock
      return UserListResponse(
        data: pagedData,
        pagination: PaginationModel(
          offset: page,
          limit: limit,
          total: allData.length,
          hasNext: end < allData.length,
        ),
      );
      // final response = await _apiService.get(
      //   '/v1/users/followers',
      //   queryParameters: {'page': page, 'limit': limit, 'search': search},
      // );
      // Xây pagination (tự tính hasNext)
      // final pagination = buildPagination(response['pagination']);

      // // Trả về dữ liệu hoàn chỉnh
      // return UserListResponse(
      //   data:
      //       (response['data'] as List<dynamic>?)
      //           ?.map((e) => UserSummaryModel.fromJson(e))
      //           .toList() ??
      //       [],
      //   pagination: pagination,
      // );
    } catch (e) {
      print("getFollowerList failed: $e");
      return const UserListResponse(data: []);
    }
  }

  /// get Friend list
  FutureOr<UserListResponse?> getFriendList({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // simulate network delay
      var allData = friendMock.data ?? [];
      if (search != null && search.isNotEmpty) {
        allData = allData
            .where(
              (u) =>
                  u.username?.toLowerCase().contains(search.toLowerCase()) ??
                  false,
            )
            .toList();
      }
        final start = (page - 1) * limit;
      final end = (start + limit).clamp(0, allData.length);
      final pagedData = allData.sublist(start, end);

      return UserListResponse(
        data: pagedData,
        pagination: PaginationModel(
          offset: page,
          limit: limit,
          total: allData.length,
          hasNext: end < allData.length,
        ),
      );
      // final response = await _apiService.get(
      //   '/v1/users/friends',
      //   queryParameters: {'page': page, 'limit': limit, 'search': search},
      // );
      // Xây pagination (tự tính hasNext)
      // final pagination = buildPagination(response['pagination']);

      // // Trả về dữ liệu hoàn chỉnh
      // return UserListResponse(
      //   data:
      //       (response['data'] as List<dynamic>?)
      //           ?.map((e) => UserSummaryModel.fromJson(e))
      //           .toList() ??
      //       [],
      //   pagination: pagination,
      // );
    } catch (e) {
      print("getFriendList failed: $e");
      return const UserListResponse(data: []);
    }
  }

  FutureOr<bool> followUser(String userId, String targetId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Follow user $targetId');
      return true;

      // final response = await _apiService.post('/v1/users/$userId/following/$targetId');
      // return response['success'] == true;
    } catch (e) {
      print("followUser failed: $e");
      return false;
    }
  }

  FutureOr<bool> unfollowUser(String userId, String followingId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Unfollow user $followingId');
      return true;

      // final response = await _apiService.delete('/v1/users/$userId/following/$followingId');
      // return response['success'] == true;
    } catch (e) {
      print("unfollowUser failed: $e");
      return false;
    }
  }

  /// Hủy follower (xóa người đang follow mình)
  FutureOr<bool> removeFollower(String userId, String followerId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Remove follower $followerId');
      return true;

      // final response = await _apiService.delete('/v1/users/$userId/followers/$followerId');
      // return response['success'] == true;
    } catch (e) {
      print("removeFollower failed: $e");
      return false;
    }
  }

  /// Hủy kết bạn
  FutureOr<bool> unfriend(String userId, String friendId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Unfriend $friendId');
      return true;

      // final response = await _apiService.delete('/v1/users/$userId/friends/$friendId');
      // return response['success'] == true;
    } catch (e) {
      print("unfriend failed: $e");
      return false;
    }
  }

  /// Lấy thống kê bạn bè/follow
  FutureOr<Map<String, int>> getUserStats(String userId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      return {
        "following_count": 24,
        "followers_count": 18,
        "friends_count": 12,
      };

      // final response = await _apiService.get('/v1/users/$userId/stats');
      // return Map<String, int>.from(response['data']);
    } catch (e) {
      print("getUserStats failed: $e");
      return {"following_count": 0, "followers_count": 0, "friends_count": 0};
    }
  }

  /// GET /users/{user_id}/following?search=<query>
  FutureOr<UserListResponse?> searchFollowing(
    String userId, {
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400)); // simulate delay

      var data = followingMock.data ?? [];

      // Filter theo search khi dùng mock
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (u) =>
                  u.username?.toLowerCase().contains(search.toLowerCase()) ??
                  false,
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
      return const UserListResponse(data: []);
    }
  }

  /// GET /users/{user_id}/followers?search=<query>
  FutureOr<UserListResponse?> searchFollower(
    String userId, {
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var data = followerMock.data ?? [];
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (u) =>
                  u.username?.toLowerCase().contains(search.toLowerCase()) ??
                  false,
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
      return const UserListResponse(data: []);
    }
  }

  /// GET /users/{user_id}/friends?search=<query>
  FutureOr<UserListResponse?> searchFriend(
    String userId, {
    String? search,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var data = friendMock.data ?? [];
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (u) =>
                  u.username?.toLowerCase().contains(search.toLowerCase()) ??
                  false,
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
      return const UserListResponse(data: []);
    }
  }
}

/// Provider để inject vào Riverpod
final userGeneralServiceProvider = Provider<UserGeneralService>((ref) {
  return UserGeneralService();
});
