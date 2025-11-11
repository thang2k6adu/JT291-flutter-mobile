# Search User Flow Documentation

Tài liệu chi tiết về luồng search user từ Mock Data → Service → Provider → Screen.

## 📊 Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                         SCREEN LAYER                             │
│                 (search_user_screen.dart)                        │
│  • Display UI                                                    │
│  • Handle user interactions (search, scroll, tap)                │
│  • Navigate to user profiles                                     │
└──────────────────────────┬───────────────────────────────────────┘
                           │ watch/read provider
                           ↓
┌─────────────────────────────────────────────────────────────────┐
│                        PROVIDER LAYER                            │
│                (search_user_provider.dart)                       │
│  • State management với Riverpod                                 │
│  • Pagination logic (load more, refresh)                         │
│  • Follow/Unfollow actions                                       │
│  • Convert service response → List<UserModel>                    │
└──────────────────────────┬───────────────────────────────────────┘
                           │ call service methods
                           ↓
┌─────────────────────────────────────────────────────────────────┐
│                        SERVICE LAYER                             │
│              (user_general_service.dart)                         │
│  • Business logic                                                │
│  • Call mock data (hoặc real API)                               │
│  • Unwrap ApiResponse → UserListResponse                         │
│  • Error handling                                                │
└──────────────────────────┬───────────────────────────────────────┘
                           │ get mock data
                           ↓
┌─────────────────────────────────────────────────────────────────┐
│                         MOCK DATA LAYER                          │
│                  (search_user_mock.dart)                         │
│  • Simulate API response                                         │
│  • Return ApiResponse<PaginatedData<UserModel>>                  │
│  • Support search filtering & pagination                         │
│  • 30 users cho realistic testing                               │
└─────────────────────────────────────────────────────────────────┘
```

## 🔄 Data Flow Details

### 1️⃣ MOCK DATA LAYER

**File:** `lib/data/mocks/search_user_mock.dart`

**Responsibility:** Cung cấp mock data giống như backend API thật sẽ trả về.

**Output Format:**
```dart
ApiResponse<PaginatedData<UserModel>> {
  error: false,
  code: 200,
  message: "Users fetched successfully",
  data: PaginatedData<UserModel> {
    items: [ UserModel(...), UserModel(...), ... ],
    meta: PaginationMeta {
      itemCount: 10,       // Số items trong page hiện tại
      totalItems: 30,      // Tổng số items
      itemsPerPage: 10,    // Số items per page
      totalPages: 3,       // Tổng số pages
      currentPage: 1,      // Page hiện tại
    }
  },
  traceId: "mock_trace_..."
}
```

**Features:**
- ✅ 30 users với data đa dạng (verified, following status, mutual followers)
- ✅ Search filtering by nickname, username, bio
- ✅ Proper pagination (page, limit)
- ✅ Realistic data structure matching backend API

**Example:**
```dart
final response = mockSearchUsersApiResponse(
  query: 'leo',
  page: 1,
  limit: 10,
);

print(response.data.items.length);  // 10 users
print(response.data.meta.hasMore);  // true (có trang kế tiếp)
```

---

### 2️⃣ SERVICE LAYER

**File:** `lib/data/services/user_general_service.dart`

**Responsibility:** Business logic layer, unwrap mock response thành format chuẩn của app.

**Method:** `searchUsers()`

**Input:**
- `query`: String - search term
- `page`: int - page number (default: 1)
- `limit`: int - items per page (default: 10)

**Output:** `UserListResponse?`

**Flow:**
```dart
FutureOr<UserListResponse?> searchUsers({
  required String query,
  int page = 1,
  int limit = 10,
}) async {
  // 1. Get mock API response
  final apiResponse = mockSearchUsersApiResponse(
    query: query,
    page: page,
    limit: limit,
  );

  // 2. Check for errors
  if (apiResponse.error || apiResponse.data == null) {
    return const UserListResponse(data: []);
  }

  // 3. Extract paginated data
  final paginatedData = apiResponse.data!;
  final meta = paginatedData.meta;

  // 4. Convert to UserListResponse
  return UserListResponse(
    data: paginatedData.items,
    pagination: PaginationModel(
      offset: meta.currentPage,
      limit: meta.itemsPerPage,
      total: meta.totalItems,
      hasNext: meta.currentPage < meta.totalPages,
    ),
  );
}
```

**Why this layer?**
- Tách biệt mock data format vs app internal format
- Dễ dàng thay thế mock bằng real API call
- Error handling centralized
- Easy migration path

---

### 3️⃣ PROVIDER LAYER

**File:** `lib/data/providers/search/search_user_provider.dart`

**Responsibility:** State management, pagination, user actions (follow/unfollow).

**Provider Type:** `AsyncNotifierProvider<SearchUserNotifier, List<UserModel>>`

**State:** `AsyncValue<List<UserModel>>`

**Key Components:**

1. **_UserListPaginatedResponse**: Wrapper để convert `UserListResponse` sang `PaginatedResponse<T>` interface
   ```dart
   class _UserListPaginatedResponse implements PaginatedResponse<UserModel> {
     final UserListResponse? _response;
     
     @override
     List<UserModel> get data => _response?.data ?? [];
     
     @override
     bool get hasNext => _response?.pagination?.hasNext ?? false;
   }
   ```

2. **SearchUserNotifier**: Extends `BasePaginatedNotifier` với pagination built-in
   ```dart
   class SearchUserNotifier extends BasePaginatedNotifier<UserModel>
       with ListItemUpdateMixin<UserModel> {
     
     // Fetch một page từ service
     @override
     Future<PaginatedResponse<UserModel>> fetchPage({...}) async {
       final response = await _service.searchUsers(...);
       return _UserListPaginatedResponse(response);
     }
     
     // Follow user
     Future<void> followUser(String userId, String targetUserId) async {
       await updateItemAsync(...);  // Update item in list optimistically
     }
     
     // Unfollow user
     Future<void> unfollowUser(String userId, String targetUserId) async {
       await updateItemAsync(...);
     }
   }
   ```

**Features từ BasePaginatedNotifier:**
- ✅ Auto pagination management (_page, _hasNext, _isLoadingMore)
- ✅ `loadMore()` - Load thêm page kế tiếp
- ✅ `refresh()` - Refresh toàn bộ data
- ✅ `fetchData(reset: true, search: query)` - Search mới
- ✅ Automatic state handling (loading, error, data)

**Features từ ListItemUpdateMixin:**
- ✅ `updateItem()` - Update một item trong list
- ✅ `updateItemAsync()` - Update item với async operation (optimistic update)

---

### 4️⃣ SCREEN LAYER

**File:** `lib/features/profile/screens/search_user_screen.dart`

**Responsibility:** UI rendering, user interactions, navigation.

**Key Features:**

1. **Search với Debounce**
   ```dart
   void _onSearchChanged(String query) {
     if (_debounce?.isActive ?? false) _debounce!.cancel();
     
     _debounce = Timer(const Duration(milliseconds: 500), () {
       if (query != _currentQuery) {
         _currentQuery = query;
         ref.read(searchUserProvider.notifier).fetchData(
           reset: true,
           search: query,
         );
       }
     });
   }
   ```

2. **Infinite Scroll**
   ```dart
   void _setupScrollListener() {
     _scrollController.addListener(() {
       if (_scrollController.position.pixels >=
           _scrollController.position.maxScrollExtent - 200) {
         ref.read(searchUserProvider.notifier).loadMore();
       }
     });
   }
   ```

3. **Follow/Unfollow Actions**
   ```dart
   void _handleUserButtonPressed(UserRelationItem user, UserButtonType type) {
     final currentUserId = 'current_user_id';
     
     switch (type) {
       case UserButtonType.follow:
         ref.read(searchUserProvider.notifier).followUser(
           currentUserId,
           user.id,
         );
         break;
       case UserButtonType.following:
         ref.read(searchUserProvider.notifier).unfollowUser(
           currentUserId,
           user.id,
         );
         break;
     }
   }
   ```

4. **Navigation to User Profile**
   ```dart
   onTap: () {
     pushScreen(context, '${RouteConstants.userMe}?id=${user.id}');
   }
   ```

5. **UI States**
   ```dart
   searchState.when(
     data: (users) {
       // Empty state
       if (_currentQuery.isEmpty && users.isEmpty) {
         return EmptySearchWidget();
       }
       
       // No results
       if (_currentQuery.isNotEmpty && users.isEmpty) {
         return NoMatchingResults();
       }
       
       // Show list
       return ListView.builder(...);
     },
     loading: () => CircularProgressIndicator(),
     error: (error, stack) => ErrorWidget(),
   );
   ```

---

## 🎯 Complete Flow Example

### User types "leo" in search:

1. **Screen Layer:**
   ```dart
   _onSearchChanged("leo")  // Debounce 500ms
   → ref.read(searchUserProvider.notifier).fetchData(reset: true, search: "leo")
   ```

2. **Provider Layer:**
   ```dart
   fetchData(reset: true, search: "leo")
   → _page = 1, _hasNext = true
   → fetchPage(page: 1, limit: 10, search: "leo")
   ```

3. **Service Layer:**
   ```dart
   searchUsers(query: "leo", page: 1, limit: 10)
   → mockSearchUsersApiResponse(query: "leo", page: 1, limit: 10)
   ```

4. **Mock Data Layer:**
   ```dart
   mockSearchUsersApiResponse(...)
   → Filter: _searchUsersMockData.where(nickname/username/bio contains "leo")
   → Result: ["Leo Herwitz"]
   → Paginate: items[0:10]
   → Return: ApiResponse<PaginatedData<UserModel>>
   ```

5. **Service Layer (unwrap):**
   ```dart
   Convert ApiResponse → UserListResponse
   → Return UserListResponse(data: [UserModel], pagination: PaginationModel)
   ```

6. **Provider Layer (convert):**
   ```dart
   _UserListPaginatedResponse(response)
   → Extract data: [UserModel]
   → Update state: AsyncData([UserModel])
   ```

7. **Screen Layer (render):**
   ```dart
   searchState.when(data: (users) => ListView.builder(...))
   → Display: 1 user "Leo Herwitz"
   ```

### User scrolls to bottom:

1. **Screen:** Scroll listener triggers
   ```dart
   → ref.read(searchUserProvider.notifier).loadMore()
   ```

2. **Provider:** Load next page
   ```dart
   loadMore()
   → if (_hasNext && !_isLoadingMore)
   → fetchData() // without reset, _page = 2
   ```

3. **Service → Mock → Service → Provider:**
   ```dart
   → Get page 2 data
   → Append to existing list
   → state = AsyncData([...oldUsers, ...newUsers])
   ```

4. **Screen:** Auto updates with new data

---

## ✅ Best Practices Implemented

### 1. **Separation of Concerns**
- Mock data chỉ lo simulate API
- Service lo business logic
- Provider lo state management
- Screen lo UI

### 2. **Type Safety**
- Generic types `ApiResponse<T>`, `PaginatedData<T>`
- Proper model conversions
- No magic strings or numbers

### 3. **Error Handling**
- ApiResponse có `error` flag
- Service check và return safe defaults
- Provider handle AsyncError
- Screen display error UI

### 4. **Performance**
- Debounce search input (500ms)
- Pagination với 10 items/page
- Optimistic updates cho follow/unfollow
- Scroll listener với threshold 200px

### 5. **Testability**
- Mock data dễ dàng customize
- Service layer có thể test riêng
- Provider có clear interfaces
- Screen có dependency injection

### 6. **Maintainability**
- Clear naming conventions
- Comprehensive comments
- Consistent patterns
- Easy to extend

---

## 🔧 Migration to Real API

Khi chuyển sang real API, chỉ cần sửa Service Layer:

**Before (Mock):**
```dart
final apiResponse = mockSearchUsersApiResponse(...);
```

**After (Real API):**
```dart
final response = await _apiService.get(
  '/v1/users/search',
  queryParameters: {'query': query, 'page': page, 'limit': limit},
);

final apiResponse = ApiResponse.fromJson(
  response,
  (data) => PaginatedData.fromJson(
    data as Map<String, dynamic>,
    (item) => UserModel.fromJson(item as Map<String, dynamic>),
  ),
);
```

Logic sau đó **GIỐNG HỆT NHAU**! 🎉

---

## 📈 Testing Checklist

- [ ] Search với empty query → Show all 30 users
- [ ] Search "leo" → Show 1 result
- [ ] Search "user" → Show users 21-30
- [ ] Scroll to bottom → Load page 2 (items 11-20)
- [ ] Pull to refresh → Reset to page 1
- [ ] Click Follow button → Update UI optimistically
- [ ] Click user → Navigate to profile
- [ ] Error from service → Show error UI
- [ ] Network delay → Show loading indicator

---

## 🎨 Mock Data Stats

- **Total Users**: 30
- **Verified Users**: 40%
- **Following**: 40%
- **Mutual**: 20%
- **Page Size**: 10
- **Total Pages**: 3

**Categories:**
- Group 1 (1-3): Premium verified users
- Group 2 (4-10): Regular active users
- Group 3 (11-20): Named users với diverse profiles
- Group 4 (21-30): Generated users for pagination testing

---

## 💡 Tips & Tricks

1. **Debug Pagination:** Set limit = 5 để test pagination nhanh hơn
2. **Debug Search:** Log query trong mock để see filtering logic
3. **Debug State:** Use Riverpod DevTools để see state changes
4. **Performance:** Profile scroll performance với 100+ users mock data
5. **Edge Cases:** Test empty results, single result, exact page size results

---

## 📚 Related Files

- `lib/data/mocks/search_user_mock.dart` - Mock data
- `lib/data/mocks/mock_api_response.dart` - Helper functions
- `lib/data/models/base/api_response.dart` - Base models
- `lib/data/models/users/user_model.dart` - User model
- `lib/data/models/users/user_list_response.dart` - Response model
- `lib/data/services/user_general_service.dart` - Service
- `lib/data/providers/search/search_user_provider.dart` - Provider
- `lib/features/profile/screens/search_user_screen.dart` - Screen
- `lib/core/base/base_pagination_notifier.dart` - Base pagination logic

