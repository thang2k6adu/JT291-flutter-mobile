# User Profile Architecture

## Overview

Đây là architecture mới cho User Profile Screen, áp dụng ViewModel pattern để quản lý state tập trung, dễ bảo trì và test hơn.

## Architecture Components

### 1. State Model (`user_profile_state.dart`)

Model chứa toàn bộ state cần thiết cho Profile Screen:

```dart
class UserProfileState {
  final UserModel? user;                    // Thông tin user
  final UserRelationshipModel? relationship; // Quan hệ với current user
  final bool isLoading;                      // Loading state chính
  final bool isFollowLoading;                // Loading khi follow/unfollow
  final String? error;                       // Error message
  final List<String> profileImages;          // Danh sách ảnh profile
}
```

**Helpers:**
- `hasData` - Check xem đã có đủ data chưa
- `isMe` - Check xem có phải profile của mình không
- `avatarUrl` - Lấy avatar URL với fallback
- `nickname` - Lấy nickname với fallback

### 2. Notifier (`user_profile_notifier.dart`)

Quản lý business logic và state transitions:

**Key Methods:**
- `loadProfile()` - Load user data và relationship song song
- `followUser()` - Follow một user và update state
- `unfollowUser()` - Unfollow một user và update state
- `refresh()` - Refresh toàn bộ data

**Features:**
- ✅ Auto-load data khi khởi tạo
- ✅ Parallel loading (user + relationship cùng lúc)
- ✅ Automatic state management
- ✅ Error handling với message
- ✅ Loading states (chính + follow action)
- ✅ Build profile images từ user data

### 3. Provider

```dart
final userProfileProvider = StateNotifierProvider.family<
  UserProfileNotifier, 
  UserProfileState, 
  String?
>(...)
```

Provider family cho phép tạo instance khác nhau cho mỗi `userId`.

## Usage trong Screen

### Basic Setup

```dart
class UserMeScreen extends ConsumerWidget {
  final String? userId;  // null = profile của mình
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch state
    final profileState = ref.watch(userProfileProvider(userId));
    
    // Get notifier để gọi actions
    final profileNotifier = ref.read(userProfileProvider(userId).notifier);
    
    // Handle loading/error states...
    // Render UI với profileState...
  }
}
```

### Handle States

```dart
// Loading state
if (profileState.isLoading) {
  return Center(child: CircularProgressIndicator());
}

// Error state
if (profileState.error != null) {
  return ErrorWidget(
    message: profileState.error,
    onRetry: () => profileNotifier.refresh(),
  );
}

// Success state - use data
Text(profileState.nickname);
Avatar(url: profileState.avatarUrl);
```

### Actions

```dart
// Follow/Unfollow
if (profileState.relationship!.isFollowing) {
  await profileNotifier.unfollowUser(currentUserId: 'current_user');
} else {
  await profileNotifier.followUser(currentUserId: 'current_user');
}

// Refresh
await profileNotifier.refresh();
```

## Benefits

### ✅ Dễ bảo trì
- Logic tập trung ở một nơi (Notifier)
- State được quản lý rõ ràng
- UI chỉ việc render state

### ✅ Testable
- Có thể test Notifier độc lập
- Mock dependencies dễ dàng
- State changes có thể verify

### ✅ Reusable
- Provider có thể dùng cho nhiều screens
- Actions có thể gọi từ bất kỳ đâu
- State helpers tiện lợi

### ✅ Type-safe
- Freezed generate immutable state
- Compiler check missing fields
- Auto-complete trong IDE

### ✅ Performance
- Parallel loading (user + relationship)
- State updates chỉ khi cần
- Widget rebuilds tối ưu với Consumer

## Migration Guide

### From Old Pattern

**Before:**
```dart
// Scattered logic
final relationshipAsync = ref.watch(userRelationshipProvider(userId));
final userService = ref.read(userGeneralServiceProvider);

// Manual handling
relationshipAsync.when(
  data: (relationship) {
    // Logic ở đây
  },
  loading: () => ...,
  error: (e, st) => ...,
);
```

**After:**
```dart
// Centralized state
final profileState = ref.watch(userProfileProvider(userId));
final profileNotifier = ref.read(userProfileProvider(userId).notifier);

// Clean conditionals
if (profileState.isLoading) return LoadingWidget();
if (profileState.error != null) return ErrorWidget();

// Use data
Text(profileState.nickname);
```

### Migration Steps

1. Replace old provider watches với `userProfileProvider`
2. Remove manual service calls
3. Use `profileState` properties thay vì trực tiếp gọi service
4. Use `profileNotifier` methods cho actions
5. Remove error handling logic (đã có trong Notifier)

## Future Enhancements

Có thể mở rộng thêm:

- [ ] Cache profile data
- [ ] Optimistic updates
- [ ] Offline support
- [ ] Profile update actions
- [ ] Block/Unblock user
- [ ] Report user
- [ ] Share profile
- [ ] Analytics tracking

## Related Files

- `lib/features/profile/providers/user_profile_state.dart`
- `lib/features/profile/providers/user_profile_notifier.dart`
- `lib/features/profile/screens/user_me_screen.dart`
- `lib/data/services/user_general_service.dart`
- `lib/data/models/users/user_model.dart`
- `lib/data/models/users/user_relationship_model.dart`

