import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

/// Use case for user interactions (block, follow, etc.)
class UserInteractionUseCase {
  final Ref ref;

  UserInteractionUseCase(this.ref);

  /// Block a user
  /// [blockedId] is the ID of the user to be blocked
  Future<bool> blockUser(String blockedId) async {
    try {
      final userService = ref.read(userGeneralServiceProvider);
      final currentUser = ref.read(userGeneralProvider).value;
      
      if (currentUser == null || currentUser.id.isEmpty) {
        throw Exception('Current user not found');
      }

      final success = await userService.blockUser(currentUser.id, blockedId);
      return success;
    } catch (e) {
      throw Exception('Failed to block user: $e');
    }
  }
}

