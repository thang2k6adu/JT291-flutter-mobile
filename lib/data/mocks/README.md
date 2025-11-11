# Mock Data Documentation

Tất cả mock data trong project đều sử dụng `ApiResponse` và `PaginatedData` để đảm bảo tính nhất quán với API thật từ backend.

## 📁 Cấu trúc Files

```
lib/data/mocks/
├── mock_api_response.dart      # Helper functions để tạo mock responses
├── relationship_mock.dart       # Mock data: following, followers, friends, user stats
├── wallet_mock.dart            # Mock data: wallet, transactions, recharge packages
├── profile_view_mock.dart      # Mock data: profile views
└── search_user_mock.dart       # Mock data: search users
```

## 🎯 Base Model Structure

### ApiResponse<T>
```dart
ApiResponse<T> {
  bool error;           // false = success, true = error
  int code;             // HTTP status code (200, 400, 404, etc.)
  String message;       // Response message
  T? data;              // Data payload (generic type)
  String? traceId;      // Trace ID for debugging
}
```

### PaginatedData<T>
```dart
PaginatedData<T> {
  List<T> items;        // List of items
  PaginationMeta meta;  // Pagination metadata
}

PaginationMeta {
  int itemCount;        // Number of items in current page
  int totalItems;       // Total number of items
  int itemsPerPage;     // Items per page
  int totalPages;       // Total number of pages
  int currentPage;      // Current page number
}
```

## 🔧 Helper Functions

### mockSuccessResponse<T>
Tạo một `ApiResponse` thành công:

```dart
final response = mockSuccessResponse<UserModel>(
  userData,
  message: 'User fetched successfully',
);
```

### mockErrorResponse<T>
Tạo một `ApiResponse` lỗi:

```dart
final response = mockErrorResponse<String>(
  message: 'User not found',
  code: 404,
);
```

### mockPaginatedResponse<T>
Tạo một `ApiResponse` với `PaginatedData`:

```dart
final response = mockPaginatedResponse<UserModel>(
  items: users,
  currentPage: 1,
  itemsPerPage: 10,
  totalItems: 100,
  message: 'Users fetched successfully',
);
```

## 📚 Mock Data Usage

### 1. Search Users (`search_user_mock.dart`)

```dart
// Search users với query và pagination
final response = mockSearchUsersApiResponse(
  query: 'leo',
  page: 1,
  limit: 10,
);

// Check for errors
if (!response.error && response.data != null) {
  final users = response.data!.items;
  final meta = response.data!.meta;
  
  print('Found ${meta.totalItems} users');
  print('Current page: ${meta.currentPage}/${meta.totalPages}');
}

// Empty results
final emptyResponse = mockSearchUsersEmptyApiResponse;

// Error case
final errorResponse = mockSearchUsersErrorApiResponse;

// Access all mock data
final allUsers = allSearchUsersMockData; // List<UserModel>
```

**Ví dụ trong Service:**
```dart
FutureOr<UserListResponse?> searchUsers({
  required String query,
  int page = 1,
  int limit = 10,
}) async {
  // Get mock API response
  final apiResponse = mockSearchUsersApiResponse(
    query: query,
    page: page,
    limit: limit,
  );

  // Check for errors
  if (apiResponse.error || apiResponse.data == null) {
    return const UserListResponse(data: []);
  }

  // Extract data
  final paginatedData = apiResponse.data!;
  final meta = paginatedData.meta;

  // Convert to your response format
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

### 2. User Relationships (`relationship_mock.dart`)

```dart
// Get paginated following list
final response = mockFollowingApiResponse(page: 1, limit: 10);
final users = response.data?.items ?? [];

// Get paginated follower list
final response = mockFollowerApiResponse(page: 1, limit: 10);

// Get paginated friend list
final response = mockFriendApiResponse(page: 1, limit: 10);

// Get user stats
final response = mockUserStatsApiResponse;
final stats = response.data; // UserStatsModel

// Get single user profile
final response = mockUserProfileApiResponse('user_id_123');
final user = response.data; // UserModel
```

### 3. Wallet & Transactions (`wallet_mock.dart`)

```dart
// Get wallet summary
final response = mockWalletSummaryApiResponse;
final summary = response.data; // WalletSummaryModel

// Get recharge packages
final response = mockRechargePackagesApiResponse;
final packages = response.data; // List<RechargePackageModel>

// Get monthly cards
final response = mockMonthlyCardsApiResponse;
final cards = response.data; // List<MonthlyCardModel>

// Get transaction history (paginated)
final response = mockTransactionHistoryApiResponse(page: 1, limit: 10);
final transactions = response.data?.items ?? [];

// Purchase package
final response = mockPurchasePackageApiResponse(packageId);
if (!response.error) {
  print('Purchase successful: ${response.message}');
}

// Subscribe monthly card
final response = mockSubscribeMonthlyCardApiResponse(cardId);
```

### 4. Profile Views (`profile_view_mock.dart`)

```dart
// Get profile views (paginated)
final response = mockProfileViewsApiResponse(
  page: 1,
  limit: 10,
  canViewFull: true, // User có quyền xem full list không
);
final viewers = response.data?.items ?? [];

// Get profile view summary
final response = mockProfileViewSummaryApiResponse;
final summary = response.data; // Map<String, dynamic>
```

## ✅ Best Practices

### 1. Always Check Error Flag
```dart
final response = mockSearchUsersApiResponse(query: 'john');

if (!response.error && response.data != null) {
  // Use data safely
  final users = response.data!.items;
} else {
  print('Error: ${response.message}');
}
```

### 2. Handle Null Data Safely
```dart
final items = response.data?.items ?? [];
```

### 3. Check Pagination for Infinite Scroll
```dart
final meta = response.data?.meta;
final hasMore = meta != null && meta.currentPage < meta.totalPages;

if (hasMore) {
  // Load more data
  loadNextPage(meta.currentPage + 1);
}
```

### 4. Use TraceId for Debugging
```dart
print('TraceId: ${response.traceId}');
print('Error: ${response.error}');
print('Code: ${response.code}');
print('Message: ${response.message}');
```

## 🔄 Migration to Real API

Khi chuyển từ mock sang API thật, bạn chỉ cần:

**Before (Mock):**
```dart
final apiResponse = mockSearchUsersApiResponse(
  query: query,
  page: page,
  limit: limit,
);
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

Logic xử lý data sau đó **GIỐNG HỆT NHAU**! 🎉

## 📊 Mock Data Statistics

- **Search Users**: 10 users với đa dạng trạng thái (verified, following, mutual followers)
- **Following**: 20 users
- **Followers**: 20 users  
- **Friends**: 20 users
- **Transactions**: 9 transactions với các types khác nhau
- **Recharge Packages**: 6 packages
- **Monthly Cards**: 3 cards
- **Profile Views**: 20 viewers

## 🎨 Mock Data Features

### Search Users Mock
- ✅ Filter by query (nickname, bio, username)
- ✅ Pagination support
- ✅ Various user states (verified, following status, mutual followers)
- ✅ Realistic avatars and bios
- ✅ Empty results case
- ✅ Error case

### Relationship Mock
- ✅ Following/Follower/Friend lists
- ✅ User stats
- ✅ Individual user profiles
- ✅ Pagination for all lists

### Wallet Mock
- ✅ Wallet summary
- ✅ Transaction history with pagination
- ✅ Various transaction types (deposit, withdrawal, gift, etc.)
- ✅ Recharge packages
- ✅ Monthly cards
- ✅ Purchase/Subscribe responses

### Profile View Mock
- ✅ Paginated viewers
- ✅ Access control (canViewFull)
- ✅ View summary

## 💡 Tips

1. **Consistent API Structure**: Tất cả mock data đều follow cùng structure `ApiResponse<T>` hoặc `ApiResponse<PaginatedData<T>>`

2. **Type Safety**: Sử dụng generic types để đảm bảo type safety

3. **Easy Testing**: Mock data có đủ edge cases để test (empty, error, success)

4. **Realistic Data**: Mock data có trạng thái và relationships thực tế

5. **Debugging**: Mỗi response có `traceId` unique để debug dễ dàng

6. **Flexible**: Có thể customize pagination, search query, filters, etc.

