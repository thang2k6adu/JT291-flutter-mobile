import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';


final userGeneralProvider =
    AsyncNotifierProvider<UserGeneralNotifier, UserModel?>(
      () => UserGeneralNotifier(),
    );

/// Provider để lấy thông tin user theo ID (có thể là user hiện tại hoặc user khác)
/// Nếu userId = null thì lấy thông tin user hiện tại
final userProfileByIdProvider =
    FutureProvider.family<UserModel?, String?>((ref, userId) async {
  final userService = ref.read(userGeneralServiceProvider);
  
  if (userId == null || userId.isEmpty) {
    // Lấy thông tin user hiện tại
    return await userService.getCurrentUser();
  } else {
    // Lấy thông tin user khác theo ID
    return await userService.getUserProfile(userId);
  }
});

class UserGeneralNotifier extends AsyncNotifier<UserModel?> {
  late final UserGeneralService _userService;

  @override
  Future<UserModel?> build() async {
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
    } catch (e) {
      print('updateProfile failed: $e');
      return false;
    }
  }

  /// Lấy thông tin profile người dùng khác
  Future<UserModel?> getUserProfile(String userId) async {
    try {
      final user = await _userService.getUserProfile(userId);
      return user;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
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
