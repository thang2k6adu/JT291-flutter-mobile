import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
  
class UserUtils {
  static String getUserId(WidgetRef ref) {
    final user = ref.read(userGeneralProvider);
    final id = user.value?.unionId;
    if (id == null) throw Exception('User ID is null');
    return id;
  }
}
