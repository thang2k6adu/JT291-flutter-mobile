import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../data/repositories/auth_repository.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.watch(firebaseAuthServiceProvider);
  return AuthRepository(service);
});