import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/user_general/user_general.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final userGeneralProvider =
    AsyncNotifierProvider<UserGeneralNotifier, UserGeneralModel?>(
  () => UserGeneralNotifier(),
);

class UserGeneralNotifier extends AsyncNotifier<UserGeneralModel?> {
  late final UserGeneralService _userService;

  @override
  Future<UserGeneralModel?> build() async {
    // Inject service
    _userService = ref.read(userGeneralServiceProvider);

    // Tải thông tin user hiện tại khi provider được khởi tạo
    try {
      final me = await _userService.getCurrentUser();
      return me;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Cập nhật thông tin user hiện tại
  Future<bool> updateProfile(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    try {
      final updatedUser = await _userService.updateCurrentUser(data);
      print('updatedUser: $updatedUser');
      return updatedUser;
    } catch (e, st) {
      print('updateProfile failed: $e');
      return false;
    }
  }

  /// Lấy thông tin profile người dùng khác
  Future<UserGeneralModel?> getUserProfile(String userId) async {
    try {
      final user = await _userService.getUserProfile(userId);
      return user;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Lấy stream token (dùng cho chat, video call,...)
  Future<String?> getStreamToken() async {
    try {
      final token = await _userService.getStreamToken();
      return token;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Upload nhiều ảnh (avatar hoặc profile URLs)
  Future<List<String>> uploadAttachments(List<File> files) async {
    try {
      final urls = await _userService.uploadAttachments(files);
      return urls;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  /// Làm mới lại dữ liệu user hiện tại
  Future<void> refreshProfile() async {
    try {
      final me = await _userService.getCurrentUser();
      state = AsyncData(me);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
