import 'package:riverpod/riverpod.dart';
import '../../data/services/secure_storage_service.dart';

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});