# Mock Data với ApiResponse

Tất cả mock data trong project đều follow theo base model `ApiResponse` để đảm bảo tính nhất quán với API thật.

## 📁 Cấu trúc

```
lib/data/mocks/
├── mock_api_response.dart      # Helper functions để tạo mock responses
├── relationship_mock.dart       # Mock data cho user relationships (following, followers, friends)
├── wallet_mock.dart            # Mock data cho wallet & transactions
└── profile_view_mock.dart      # Mock data cho profile views
```

## 🔧 Helper Functions

### `mockSuccessResponse<T>`
Tạo một ApiResponse thành công với data type T.

```dart
final response = mockSuccessResponse<UserModel>(
  userData,
  message: 'User fetched successfully',
);
```

### `mockErrorResponse<T>`
Tạo một ApiResponse lỗi.

```dart
final response = mockErrorResponse<String>(
  message: 'User not found',
  code: 404,
);
```

### `mockPaginatedResponse<T>`
Tạo một ApiResponse với PaginatedData cho list data.

```dart
final response = mockPaginatedResponse<UserModel>(
  items: users,
  currentPage: 1,
  itemsPerPage: 10,
  totalItems: 100,
);
```

## 📝 Cách sử dụng Mock Data

### 1. User Relationships

```dart
// Get paginated following list
final response = mockFollowingApiResponse(page: 1, limit: 10);
final users = response.data?.items ?? [];
final hasNext = response.data?.meta.currentPage < response.data?.meta.totalPages;

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

### 2. Wallet & Transactions

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

### 3. Profile Views

```dart
// Get profile views (paginated)
final response = mockProfileViewsApiResponse(
  page: 1, 
  limit: 10,
  canViewFull: true,
);
final viewers = response.data?.items ?? [];

// Get profile view summary
final response = mockProfileViewSummaryApiResponse;
final summary = response.data; // Map<String, dynamic>
```

## 🎯 Structure của ApiResponse

```dart
ApiResponse<T> {
  bool error;           // false = success, true = error
  int code;             // HTTP status code (200, 400, 404, etc.)
  String message;       // Response message
  T? data;              // Data payload (generic type)
  String? traceId;      // Trace ID for debugging
}
```

## 📊 Structure của PaginatedData

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

## ✅ Best Practices

1. **Luôn check error flag** trước khi sử dụng data:
   ```dart
   if (!response.error) {
     final data = response.data;
     // Use data
   } else {
     print('Error: ${response.message}');
   }
   ```

2. **Handle null data** safely:
   ```dart
   final items = response.data?.items ?? [];
   ```

3. **Check pagination** để implement infinite scroll:
   ```dart
   final hasMore = response.data?.meta.currentPage < response.data?.meta.totalPages;
   ```

4. **Use traceId** cho debugging:
   ```dart
   print('TraceId: ${response.traceId}');
   ```

## 🔄 Migration từ Old Mock Data

Nếu bạn đang sử dụng mock data cũ (không có ApiResponse wrapper), hãy update:

**Before:**
```dart
final users = followingMock.data; // List<UserModel>
```

**After:**
```dart
final response = mockFollowingApiResponse(page: 1, limit: 10);
final users = response.data?.items ?? [];
```

## 📌 Notes

- Tất cả mock responses đều có `traceId` unique dựa trên timestamp
- Mock error responses có thể custom code và message
- Pagination trong mock data follow đúng logic của backend
- Mock data có simulate delay (trong services) để giống API thật

