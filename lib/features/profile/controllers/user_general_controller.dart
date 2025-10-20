import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/components.dart';
import 'package:jt291_flutter_mobile/data/models/user_general/user_general.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

class UserGeneralController extends AutoDisposeNotifier<void> {
  late final UserGeneralService _userService;

  @override
  void build() {
    _userService = ref.read(userGeneralServiceProvider);
  }

  /// Cập nhật profile kèm overlay thông báo
  Future<void> updateProfileWithOverlay(
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    final overlay = UOverlay(context);
    overlay.show(message: "Đang cập nhật profile...", loading: true);

    try {
      final updatedUser =
          await ref.read(userGeneralProvider.notifier).updateProfile(data);
      if (updatedUser != null) {
        overlay.showWithTimeout(message: "Cập nhật thành công");
      } else {
        overlay.showWithTimeout(message: "Cập nhật thất bại");
      }
    } catch (e) {
      overlay.showWithTimeout(message: "Cập nhật thất bại");
    } finally {
      overlay.hide();
    }
  }

  /// Upload nhiều ảnh kèm overlay
  Future<List<String>> uploadAttachmentsWithOverlay(
    BuildContext context,
    List<File> files,
  ) async {
    final overlay = UOverlay(context);
    overlay.show(message: "Đang upload ảnh...", loading: true);

    try {
      final urls =
          await ref.read(userGeneralProvider.notifier).uploadAttachments(files);
      overlay.showWithTimeout(
          message: urls.isNotEmpty ? "Upload thành công" : "Upload thất bại");
      return urls;
    } catch (e) {
      overlay.showWithTimeout(message: "Upload thất bại");
      return [];
    } finally {
      overlay.hide();
    }
  }

  /// Refresh profile hiện tại kèm overlay
  Future<void> refreshProfileWithOverlay(BuildContext context) async {
    final overlay = UOverlay(context);
    overlay.show(message: "Đang làm mới profile...", loading: true);

    try {
      await ref.read(userGeneralProvider.notifier).refreshProfile();
      overlay.showWithTimeout(message: "Làm mới thành công");
    } catch (e) {
      overlay.showWithTimeout(message: "Làm mới thất bại");
    } finally {
      overlay.hide();
    }
  }
}

/// Provider controller để inject vào UI
final userGeneralControllerProvider =
    AutoDisposeNotifierProvider<UserGeneralController, void>(
        UserGeneralController.new);
