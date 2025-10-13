import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import '../providers/auth_provider.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<UserModel?>>((ref) {
      final repo = ref.watch(authRepositoryProvider);
      return AuthController(repo);
    });

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository _repo;

  AuthController(this._repo) : super(const AsyncValue.loading()) {
    // 🔥 Listen auth state từ FirebaseAuth
    _repo.authStateChanges.listen((user) {
      state = AsyncValue.data(user);
    });
  }

  /// Đăng nhập bằng email & password
  Future<void> signIn(String email, String password) async {
    await _handleAuthAction(() => _repo.signInWithEmail(email, password));
  }

  /// Đăng ký tài khoản mới
  Future<void> register(String email, String password) async {
    await _handleAuthAction(() => _repo.registerWithEmail(email, password));
  }

  /// Đăng nhập bằng Google
  Future<void> signInWithGoogle() async {
    await _handleAuthAction(() => _repo.signInWithGoogle());
  }

  /// Đăng nhập bằng Facebook
  Future<void> signInWithFacebook() async {
    await _handleAuthAction(() => _repo.signInWithFacebook());
  }

  /// Đăng xuất
  Future<void> signOut() async {
    await _repo.signOut();
    state = const AsyncValue.data(null);
  }

  /// Hàm helper để quản lý state loading / error / data
  Future<void> _handleAuthAction(Future<UserModel?> Function() action) async {
    state = const AsyncValue.loading();
    try {
      final user = await action();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
