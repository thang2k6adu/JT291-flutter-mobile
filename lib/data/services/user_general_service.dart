import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/following_mock.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';
import 'package:jt291_flutter_mobile/data/mocks/follower_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/friend_mock.dart';

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
  FutureOr<List<UserSummaryModel>> getFollowingList() async {
    try {
      // Fake API call với mock data
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // simulate network delay
      return followingMock.data ?? [];

      // Khi có API thật, bỏ comment này
      // final response = await _apiService.get('/v1/users/following');
      // return (response['data'] as List)
      //     .map((e) => FollowingModel.fromJson(e))
      //     .toList();
    } catch (e) {
      print("getFollowingList failed: $e");
      return [];
    }
  }

  /// get Follower list
  FutureOr<List<UserSummaryModel>> getFollowerList() async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // simulate network delay
      return followerMock.data ?? [];
      // final response = await _apiService.get('/v1/users/followers');
      // return (response['data'] as List)
      //     .map((e) => FollowerModel.fromJson(e))
      //     .toList();
    } catch (e) {
      print("getFollowerList failed: $e");
      return [];
    }
  }

  /// get Friend list
  FutureOr<List<UserSummaryModel>> getFriendList() async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // simulate network delay
      return friendMock.data ?? [];
      // final response = await _apiService.get('/v1/users/friends');
      // return (response['data'] as List)
      //     .map((e) => FriendModel.fromJson(e))
      //     .toList();
    } catch (e) {
      print("getFriendList failed: $e");
      return [];
    }
  }
}

/// Provider để inject vào Riverpod
final userGeneralServiceProvider = Provider<UserGeneralService>((ref) {
  return UserGeneralService();
});
