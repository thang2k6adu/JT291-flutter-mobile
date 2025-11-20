import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/auth_service.dart';

final userAuthProvider = AsyncNotifierProvider<UserAuthNotifier, UserModel?>(
  () => UserAuthNotifier(),
);

class UserAuthNotifier extends AsyncNotifier<UserModel?> {
  late final AuthService _authService;

  @override
  Future<UserModel?> build() async {
    // Inject service
    _authService = ref.read(authServiceProvider);

    // fetch firebase user
    final firebaseUser = FirebaseAuth.instance.currentUser;
    print('UserAuthNotifier build firebaseUser: $firebaseUser');
    if (firebaseUser == null) {
      final me = await _authService.getCurrentUser();
      print('UserAuthNotifier build no firebase user, me=$me');
      if (me != null) {
        return me;
      }

      await Future.delayed(Duration(seconds: 2));
      return null;
    }

    final idToken = await firebaseUser.getIdToken();
    if (idToken == null) return null;

    // Call API login
    await _authService.loginWithToken(idToken);
    final me = await _authService.getCurrentUser();
    return me;
  }

  /// Login User with idToken
  Future<UserModel?> login(String idToken) async {
    state = const AsyncLoading();
    try {
      await _authService.loginWithToken(idToken);
      final loggedInUser = await _authService.getCurrentUser();
      state = AsyncData(loggedInUser);
      return loggedInUser;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }
  
  Future<UserModel?> loginWithEmailAndPassword(String username, String password) async {
    state = const AsyncLoading();
    try {
      await _authService.loginWithEmailAndPassword(username, password);
      final user = await _authService.getCurrentUser();
      print('loginWithEmailAndPassword user: $user');
      if (user != null) {
        state = AsyncData(user);
        return user;
      } else {
        throw Exception("loginWithEmailAndPassword failed");
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Logout User
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Invalidate để build lại thành null
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// refresh profile loggedInUser
  Future<void> refresh() async {
    try {
      final loggedInUser = await _authService.getCurrentUser();
      state = AsyncData(loggedInUser);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
