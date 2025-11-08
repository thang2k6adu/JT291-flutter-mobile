import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
  
class UserUtils {
  static String getUserId(WidgetRef ref) {
    final user = ref.watch(userGeneralProvider);
    final id = user.when(
      data: (data) => data?.unionId,
      error: (error, stackTrace) => null,
      loading: () => null,
    );
    if (id == null) throw Exception('User ID is null');
    return id;
  }
}
