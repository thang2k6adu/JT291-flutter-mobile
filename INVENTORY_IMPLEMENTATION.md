# Gift Inventory & Send Gift Implementation

## Overview
This implementation provides a complete gift inventory system with the following features:
- View current user's gift inventory (gift bag)
- Pagination support for large inventories using `BasePaginatedNotifier`
- Send gifts from inventory to other users
- Real-time inventory updates after sending gifts

## File Structure

### Models
- **`lib/data/models/gift/inventory_item_model.dart`** - Inventory item model with quantity
  - Uses Freezed for immutability
  - Extends gift data with `quantity` field
  - Includes event information (`isEvent`, `eventEndDate`)

### Mock Data
- **`lib/data/mocks/inventory_mock.dart`** - Mock data for testing
  - Current user inventory (`_myInventory`)
  - Mock success/error responses for both get inventory and send gift

### Services
- **`lib/data/services/gift_service.dart`** - Unified API service layer
  - `getGifts(category, page, limit)` - Fetch gift catalog
  - `getMyInventory(page, limit)` - Fetch current user's inventory
  - `sendGift(recipientId, itemId, quantity)` - Send gift to another user
  - Ready for real API integration (commented code included)

### Providers
- **`lib/data/providers/gift/inventory_provider.dart`** - State management
  - `myInventoryProvider` - Provider for current user's inventory
  - Extends `BasePaginatedNotifier` for automatic pagination
  - Uses `ListItemUpdateMixin` for local updates
  - Automatic state updates after sending gifts

### Controllers
- **`lib/features/profile/controllers/inventory_controller.dart`** - Business logic
  - Load more items
  - Refresh inventory
  - Send gift with validation and error handling
  - Snackbar notifications for success/error

### Example UI
- **`lib/features/profile/widget/layout/inventory_example.dart`** - Example implementation
  - Shows how to use the inventory system
  - Complete send gift dialog
  - Error handling and loading states

## API Endpoints

### 1. Get My Inventory
```
GET /users/me/inventory?page=1&limit=20
```

**Response:**
```json
{
  "error": false,
  "code": 0,
  "message": "Success",
  "data": {
    "items": [
      {
        "id": 101,
        "name": "Rose",
        "image_url": "...",
        "price": 10,
        "type": "normal",
        "quantity": 3,
        "is_event": false,
        "description": "A beautiful red rose",
        "category": "hot"
      }
    ],
    "meta": {
      "item_count": 6,
      "total_items": 6,
      "items_per_page": 20,
      "total_pages": 1,
      "current_page": 1
    }
  },
  "traceId": "VIHOLaKaWe"
}
```

### 2. Send Gift
```
POST /gifts/send
Content-Type: application/json

{
  "recipient_id": 2001,
  "item_id": 101,
  "quantity": 1
}
```

**Response:**
```json
{
  "error": false,
  "code": 0,
  "message": "Gift sent successfully",
  "data": {
    "recipient_id": 2001,
    "item_id": 101,
    "quantity": 1,
    "sent_at": "2025-11-21T10:30:00Z"
  },
  "traceId": "SEND_GIFT_123456"
}
```

## Usage Examples

### 1. Display My Inventory

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/inventory_provider.dart';

class MyInventoryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(myInventoryProvider);
    
    return inventoryState.when(
      data: (items) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('${item.price} coins'),
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

### 2. Send Gift from Inventory

```dart
import 'package:jt291_flutter_mobile/features/profile/controllers/inventory_controller.dart';

// In your widget
final controller = ref.read(inventoryControllerProvider.notifier);

final success = await controller.sendGift(
  context,
  recipientId: 2001,
  itemId: 101,
  quantity: 1,
);

if (success) {
  // Gift sent successfully
  // Inventory automatically updated
}
```

### 3. Refresh Inventory

```dart
// Refresh current user's inventory
await ref.read(inventoryControllerProvider.notifier).refresh();
```

### 4. Load More Items (Pagination)

```dart
// Load next page of items
await ref.read(inventoryControllerProvider.notifier).loadMore();
```

## Key Features

### 1. BasePaginatedNotifier Integration
- Extends `BasePaginatedNotifier<InventoryItemModel>`
- Automatic pagination handling
- Built-in loading states
- Error handling

### 2. ListItemUpdateMixin
- Optimistic UI updates
- Local state management
- Automatic item removal when quantity reaches 0

### 3. Unified Service Layer
- All gift-related APIs in one service (`GiftService`)
- Gift catalog + Inventory + Send gift
- Consistent error handling

### 4. Current User Focus
- No need for family providers
- Single inventory for "me"
- Simpler state management

### 5. Real-time Updates
- Local state updates after sending gifts
- Quantity decreases automatically
- Items removed when quantity reaches 0

### 6. Error Handling
- Validation for quantity and recipient ID
- User-friendly error messages
- Retry functionality on errors

### 7. Event Gifts
- Special handling for event gifts
- Display event end date
- Event badge in UI

## Architecture

```
┌─────────────────────────────────────────────────────┐
│                    UI Layer                          │
│  ┌──────────────────────────────────────────────┐  │
│  │   InventoryExample (ConsumerWidget)          │  │
│  └──────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
                      ↓ ref.watch/read
┌─────────────────────────────────────────────────────┐
│                Controller Layer                      │
│  ┌──────────────────────────────────────────────┐  │
│  │   InventoryController                        │  │
│  │   - loadMore()                               │  │
│  │   - refresh()                                │  │
│  │   - sendGift()                               │  │
│  └──────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
                      ↓ ref.read
┌─────────────────────────────────────────────────────┐
│                Provider Layer                        │
│  ┌──────────────────────────────────────────────┐  │
│  │   MyInventoryNotifier                        │  │
│  │   extends BasePaginatedNotifier              │  │
│  │   with ListItemUpdateMixin                   │  │
│  │   - fetchPage()                              │  │
│  │   - updateItemQuantity()                     │  │
│  └──────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
                      ↓ calls
┌─────────────────────────────────────────────────────┐
│                 Service Layer                        │
│  ┌──────────────────────────────────────────────┐  │
│  │   GiftService                                │  │
│  │   - getGifts()                               │  │
│  │   - getMyInventory()                         │  │
│  │   - sendGift()                               │  │
│  └──────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
                      ↓ returns
┌─────────────────────────────────────────────────────┐
│                  Mock Data                           │
│  ┌──────────────────────────────────────────────┐  │
│  │   InventoryMock / GiftMock                   │  │
│  └──────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
```

## Integration with Real API

To integrate with real API, uncomment the code in:

1. **`gift_service.dart`**
   ```dart
   // Uncomment these lines:
   // final ApiService _apiService = ApiService();
   // final response = await _apiService.get('/users/me/inventory', ...);
   ```

2. Remove mock delays:
   ```dart
   // Remove this line:
   await Future.delayed(const Duration(milliseconds: 500));
   ```

## Testing

The implementation includes comprehensive mock data for testing:

### My Inventory (Current User)
- Rose (qty: 3)
- Chocolate Box (qty: 5)
- Christmas Tree (qty: 2, event)
- Diamond (qty: 3, event)
- Four Leaf Clover (qty: 1)
- Diamond Ring (qty: 1, VIP)

## Error Codes

| Code | Message | Description |
|------|---------|-------------|
| 40001 | User not found | Invalid user ID |
| 40002 | Limit cannot exceed 50 | Page limit validation |
| 40003 | Insufficient quantity | Not enough items to send |
| 40004 | Quantity must be greater than 0 | Invalid quantity |
| 40005 | Invalid recipient ID | Recipient validation failed |

## Notes

- All mock data uses same placeholder image URL
- Event gifts have expiration dates (2025-12-31)
- VIP gifts have higher prices (1000+ coins)
- Inventory updates are local-only until refresh
- Uses `BasePaginatedNotifier` for consistent pagination behavior
- No family providers needed - single user (me) focus
