# Gift Inventory - Quick Start Guide

## 🎯 Quick Summary

Inventory system được tích hợp vào `GiftService` với architecture đơn giản hơn:
- ✅ **Single provider** cho current user (không cần family provider)
- ✅ **BasePaginatedNotifier** để xử lý pagination tự động
- ✅ **Unified service** - tất cả gift APIs trong một nơi

## 📁 File Structure

```
lib/
├── data/
│   ├── models/gift/
│   │   └── inventory_item_model.dart        ✨ NEW
│   ├── mocks/
│   │   └── inventory_mock.dart              ✨ NEW
│   ├── services/
│   │   └── gift_service.dart                🔄 UPDATED (thêm inventory methods)
│   └── providers/gift/
│       └── inventory_provider.dart          ✨ NEW (uses BasePaginatedNotifier)
└── features/profile/
    ├── controllers/
    │   └── inventory_controller.dart        ✨ NEW
    └── widget/layout/
        └── inventory_example.dart           ✨ NEW
```

## 🚀 Usage

### 1. Watch Inventory in UI

```dart
import 'package:jt291_flutter_mobile/data/providers/gift/inventory_provider.dart';

class MyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(myInventoryProvider);
    
    return inventory.when(
      data: (items) => ListView.builder(...),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}
```

### 2. Send Gift

```dart
import 'package:jt291_flutter_mobile/features/profile/controllers/inventory_controller.dart';

// Gửi gift
final success = await ref.read(inventoryControllerProvider.notifier).sendGift(
  context,
  recipientId: 2001,
  itemId: 101,
  quantity: 1,
);
```

### 3. Load More / Refresh

```dart
// Load more items
await ref.read(inventoryControllerProvider.notifier).loadMore();

// Refresh
await ref.read(inventoryControllerProvider.notifier).refresh();
```

## 🔌 API Endpoints

### Get My Inventory
```
GET /users/me/inventory?page=1&limit=20
```

### Send Gift
```
POST /gifts/send
Body: {"recipient_id": 2001, "item_id": 101, "quantity": 1}
```

## 📊 Mock Data

Mock inventory có sẵn 6 items:
- Rose (qty: 3)
- Chocolate Box (qty: 5)
- Christmas Tree (qty: 2, event)
- Diamond (qty: 3, event)
- Four Leaf Clover (qty: 1)
- Diamond Ring (qty: 1, VIP)

## 🎨 Key Features

1. **Auto Pagination** - Sử dụng `BasePaginatedNotifier`
2. **Optimistic Updates** - Inventory update ngay khi send gift
3. **Error Handling** - Validation + user-friendly messages
4. **Event Support** - Display event gifts với countdown

## 📝 To-Do khi integrate API thật

1. Uncomment API calls trong `gift_service.dart`
2. Remove mock delays
3. Test với backend API

---

Xem chi tiết hơn tại `INVENTORY_IMPLEMENTATION.md`

