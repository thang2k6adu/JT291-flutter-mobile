# API Response Flow - Chuẩn Backend Format

Document này giải thích luồng dữ liệu mới, giữ nguyên format `ApiResponse` từ backend đến provider.

## 🎯 Thay đổi chính

### ❌ Trước (Old Flow):

```
[Mock Data]
ApiResponse<PaginatedData<UserModel>>
  ↓ UNWRAP trong Service
[Service]
UserListResponse (format riêng của app)
  ↓ WRAP lại trong Provider
[Provider]
_UserListPaginatedResponse → PaginatedResponse
  ↓
[Screen]
List<UserModel>
```

**Vấn đề:**
- Unwrap rồi wrap lại → thừa logic
- Mất thông tin từ ApiResponse (error, code, message, traceId)
- Format khác nhau giữa mock và real API

---

### ✅ Sau (New Flow):

```
[Mock Data]
ApiResponse<PaginatedData<UserModel>>
  ↓ PASS-THROUGH (không unwrap)
[Service]
ApiResponse<PaginatedData<UserModel>>
  ↓ EXTRACT data trong Provider
[Provider]
_ApiPaginatedResponse → PaginatedResponse
  ↓
[Screen]
List<UserModel>
```

**Lợi ích:**
- ✅ Giữ nguyên format backend → dễ dàng migration
- ✅ Có full thông tin: error, code, message, traceId
- ✅ Provider xử lý error logic centralized
- ✅ Service layer đơn giản hơn
- ✅ Consistent với tất cả API responses

---

## 📋 Chi tiết Implementation

### 1️⃣ Service Layer

**File:** `lib/data/services/user_general_service.dart`

**Method:** `searchUsers()`

**Return Type:** `ApiResponse<PaginatedData<UserModel>>`

```dart
/// Search users trong toàn hệ thống
/// Returns ApiResponse<PaginatedData<UserModel>> directly from backend
FutureOr<ApiResponse<PaginatedData<UserModel>>> searchUsers({
  required String query,
  int page = 1,
  int limit = 10,
}) async {
  try {
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock API response directly - NO UNWRAPPING
    return mockSearchUsersApiResponse(
      query: query,
      page: page,
      limit: limit,
    );

    // Khi có API thật:
    // final response = await _apiService.get(
    //   '/v1/users/search',
    //   queryParameters: {'query': query, 'page': page, 'limit': limit},
    // );
    // 
    // return ApiResponse.fromJson(
    //   response,
    //   (data) => PaginatedData.fromJson(
    //     data as Map<String, dynamic>,
    //     (item) => UserModel.fromJson(item as Map<String, dynamic>),
    //   ),
    // );
  } catch (e) {
    // Return error response với proper structure
    return ApiResponse<PaginatedData<UserModel>>(
      error: true,
      code: 500,
      message: 'Failed to search users: $e',
      data: PaginatedData<UserModel>(
        items: const [],
        meta: PaginationMeta(
          itemCount: 0,
          totalItems: 0,
          itemsPerPage: limit,
          totalPages: 0,
          currentPage: page,
        ),
      ),
    );
  }
}
```

**Key Points:**
- ✅ Return `ApiResponse` directly, không unwrap
- ✅ Error handling trả về proper `ApiResponse` structure
- ✅ Easy migration: chỉ cần uncomment API call code

---

### 2️⃣ Provider Layer

**File:** `lib/data/providers/search/search_user_provider.dart`

**Class:** `_ApiPaginatedResponse`

```dart
/// Wrapper để convert ApiResponse<PaginatedData<T>> sang PaginatedResponse interface
class _ApiPaginatedResponse implements PaginatedResponse<UserModel> {
  final ApiResponse<PaginatedData<UserModel>> _response;

  const _ApiPaginatedResponse(this._response);

  @override
  List<UserModel> get data {
    // Nếu có error hoặc data null, return empty list
    if (_response.error || _response.data == null) {
      return [];
    }
    return _response.data!.items;
  }

  @override
  bool get hasNext {
    // Nếu có error hoặc data null, return false
    if (_response.error || _response.data == null) {
      return false;
    }
    final meta = _response.data!.meta;
    return meta.currentPage < meta.totalPages;
  }
}
```

**Key Points:**
- ✅ Check `_response.error` trước khi extract data
- ✅ Handle null data safely
- ✅ Extract `items` từ `_response.data.items`
- ✅ Calculate `hasNext` từ `meta.currentPage < meta.totalPages`

**Method:** `fetchPage()`

```dart
@override
Future<PaginatedResponse<UserModel>> fetchPage({
  required int page,
  required int limit,
  String? search,
}) async {
  final apiResponse = await _service.searchUsers(
    query: search ?? '',
    page: page,
    limit: limit,
  );
  
  // Log error nếu có
  if (apiResponse.error) {
    print('Search users error: ${apiResponse.message}');
  }
  
  return _ApiPaginatedResponse(apiResponse);
}
```

**Key Points:**
- ✅ Nhận `ApiResponse` từ service
- ✅ Log error message nếu có
- ✅ Wrap trong `_ApiPaginatedResponse` để convert sang `PaginatedResponse` interface

---

## 🔍 Complete Data Flow Example

### User search "leo", page 1:

**1. Screen → Provider:**
```dart
ref.read(searchUserProvider.notifier).fetchData(reset: true, search: "leo")
```

**2. Provider → Service:**
```dart
fetchPage(page: 1, limit: 10, search: "leo")
  ↓
_service.searchUsers(query: "leo", page: 1, limit: 10)
```

**3. Service → Mock:**
```dart
mockSearchUsersApiResponse(query: "leo", page: 1, limit: 10)
```

**4. Mock Returns:**
```json
{
  "error": false,
  "code": 200,
  "message": "Users fetched successfully",
  "data": {
    "items": [
      {
        "id": "s_001",
        "uid": "u_s_001",
        "nickname": "Leo Herwitz",
        "username": "leo_herwitz",
        "avatar_url": "https://i.pravatar.cc/150?u=s_001",
        "bio": "Striving for excellence...",
        "gender": "female",
        "is_following": true,
        "follow_status": "following",
        "verified": true,
        "mutual_followers_count": 12
      }
    ],
    "meta": {
      "item_count": 1,
      "total_items": 1,
      "items_per_page": 10,
      "total_pages": 1,
      "current_page": 1
    }
  },
  "traceId": "mock_trace_1699999999999"
}
```

**5. Service Returns:**
```dart
ApiResponse<PaginatedData<UserModel>> (same as mock, không unwrap)
```

**6. Provider Extracts:**
```dart
_ApiPaginatedResponse(apiResponse)
  ↓
data getter:
  - Check: apiResponse.error? → false
  - Check: apiResponse.data == null? → false
  - Return: apiResponse.data!.items → [UserModel(id: "s_001", ...)]

hasNext getter:
  - Check: apiResponse.error? → false
  - Check: apiResponse.data == null? → false
  - Calculate: meta.currentPage < meta.totalPages
  - Return: 1 < 1 = false (no more pages)
```

**7. Provider Updates State:**
```dart
state = AsyncData([UserModel(...)])
```

**8. Screen Renders:**
```dart
searchState.when(
  data: (users) => ListView.builder(itemCount: 1, ...)
)
```

---

## 🎨 Access Full API Response Info

Với format mới, Provider có access đầy đủ thông tin từ backend:

```dart
@override
Future<PaginatedResponse<UserModel>> fetchPage({...}) async {
  final apiResponse = await _service.searchUsers(...);
  
  // ✅ Can access full response info:
  print('Error: ${apiResponse.error}');
  print('Code: ${apiResponse.code}');
  print('Message: ${apiResponse.message}');
  print('TraceId: ${apiResponse.traceId}');
  
  if (apiResponse.error) {
    // Handle specific error codes
    switch (apiResponse.code) {
      case 400:
        // Bad request
        break;
      case 404:
        // Not found
        break;
      case 500:
        // Server error
        break;
    }
  }
  
  // Access pagination metadata
  final meta = apiResponse.data?.meta;
  print('Total items: ${meta?.totalItems}');
  print('Current page: ${meta?.currentPage}/${meta?.totalPages}');
  
  return _ApiPaginatedResponse(apiResponse);
}
```

---

## ✅ Benefits Recap

### 1. **Consistency**
- Mock data format = Real API format
- Không cần convert qua lại
- Easy to understand

### 2. **Full Information**
- Error flag & error code
- Success/failure message
- TraceId cho debugging
- Pagination metadata đầy đủ

### 3. **Better Error Handling**
- Service có thể return error response structure
- Provider có thể check error trước khi extract data
- Screen có thể show specific error messages

### 4. **Easy Migration**
Mock → Real API chỉ cần thay 1 dòng:

```dart
// Before
return mockSearchUsersApiResponse(...);

// After
final response = await _apiService.get('/v1/users/search', ...);
return ApiResponse.fromJson(response, ...);
```

### 5. **Type Safety**
- Generic types throughout: `ApiResponse<T>`, `PaginatedData<T>`
- Compile-time checking
- IDE autocomplete support

### 6. **Testability**
- Easy to mock `ApiResponse` với different error states
- Easy to test error handling logic
- Clear interfaces

---

## 🧪 Testing Different Scenarios

### Success Case:
```dart
final response = mockSearchUsersApiResponse(query: 'leo', page: 1, limit: 10);
expect(response.error, false);
expect(response.data?.items.length, greaterThan(0));
```

### Empty Results:
```dart
final response = mockSearchUsersApiResponse(query: 'xyz123notfound', page: 1, limit: 10);
expect(response.error, false);
expect(response.data?.items, isEmpty);
expect(response.data?.meta.totalItems, 0);
```

### Error Case:
```dart
// Simulate network error in service
final response = ApiResponse<PaginatedData<UserModel>>(
  error: true,
  code: 500,
  message: 'Network error',
  data: null,
);
expect(response.error, true);
expect(response.code, 500);
```

### Pagination:
```dart
// Page 1
final page1 = mockSearchUsersApiResponse(query: '', page: 1, limit: 10);
expect(page1.data?.meta.currentPage, 1);
expect(page1.data?.meta.totalPages, 3); // 30 users / 10 per page
expect(page1.data?.items.length, 10);

// Page 2
final page2 = mockSearchUsersApiResponse(query: '', page: 2, limit: 10);
expect(page2.data?.meta.currentPage, 2);
expect(page2.data?.items.length, 10);

// Page 3
final page3 = mockSearchUsersApiResponse(query: '', page: 3, limit: 10);
expect(page3.data?.meta.currentPage, 3);
expect(page3.data?.items.length, 10);

// Page 4 (out of range)
final page4 = mockSearchUsersApiResponse(query: '', page: 4, limit: 10);
expect(page4.data?.items, isEmpty);
```

---

## 📊 Response Structure Reference

```dart
ApiResponse<PaginatedData<UserModel>> {
  error: bool,              // false = success, true = error
  code: int,                // HTTP status code (200, 400, 404, 500, etc.)
  message: String,          // Human-readable message
  data: PaginatedData<UserModel> {
    items: List<UserModel>,
    meta: PaginationMeta {
      itemCount: int,       // Items trong page hiện tại
      totalItems: int,      // Tổng số items
      itemsPerPage: int,    // Số items per page
      totalPages: int,      // Tổng số pages
      currentPage: int,     // Page hiện tại (1-indexed)
    }
  },
  traceId: String,          // Unique ID cho debugging
}
```

---

## 🚀 Migration Checklist

Khi chuyển từ mock sang real API:

- [x] Service return `ApiResponse` ✅
- [x] Provider handle `ApiResponse` format ✅
- [ ] Update API endpoint URLs
- [ ] Add authentication headers
- [ ] Add retry logic for network errors
- [ ] Add caching if needed
- [ ] Add analytics tracking
- [ ] Test with real backend
- [ ] Monitor error rates
- [ ] Setup error reporting (Sentry, etc.)

---

## 📚 Related Files

- `lib/data/models/base/api_response.dart` - Base models
- `lib/data/mocks/mock_api_response.dart` - Helper functions
- `lib/data/mocks/search_user_mock.dart` - Mock data
- `lib/data/services/user_general_service.dart` - Service layer
- `lib/data/providers/search/search_user_provider.dart` - Provider layer
- `lib/features/profile/screens/search_user_screen.dart` - Screen layer

---

## 💡 Pro Tips

1. **Always check error flag first:**
   ```dart
   if (apiResponse.error) {
     // Handle error
     return;
   }
   ```

2. **Use traceId for debugging:**
   ```dart
   print('Request failed. TraceId: ${apiResponse.traceId}');
   ```

3. **Check null before accessing data:**
   ```dart
   final items = apiResponse.data?.items ?? [];
   ```

4. **Log pagination info during development:**
   ```dart
   final meta = apiResponse.data?.meta;
   print('Page ${meta?.currentPage}/${meta?.totalPages}');
   ```

5. **Handle specific error codes:**
   ```dart
   switch (apiResponse.code) {
     case 401: navigateToLogin(); break;
     case 403: showNoPermissionDialog(); break;
     case 404: showNotFoundMessage(); break;
     case 500: showServerErrorDialog(); break;
   }
   ```

---

Với flow mới này, code clean hơn, dễ maintain hơn, và sẵn sàng cho production! 🎉

