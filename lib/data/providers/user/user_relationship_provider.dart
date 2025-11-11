import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_relationship_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

/// Provider để lấy thông tin relationship với target user
final userRelationshipProvider =
    FutureProvider.family<UserRelationshipModel, String?>((ref, targetUserId) async {
  final userService = ref.read(userGeneralServiceProvider);
  
  if (targetUserId == null || targetUserId.isEmpty) {
    // Nếu không có targetUserId, return isMe = true (xem profile chính mình)
    return const UserRelationshipModel(isMe: true);
  }
  
  return await userService.getUserRelationship(targetUserId);
});

