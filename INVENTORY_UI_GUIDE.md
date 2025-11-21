# Inventory UI - Bottom Sheet Guide

## 🎨 Overview

Inventory Bottom Sheet sử dụng cùng layout và components với Gift Bottom Sheet, nhưng hiển thị inventory items với quantity thay vì price.

## 📁 Files

### Created
1. **`inventory_bottom_sheet.dart`** - Main inventory bottom sheet widget
2. **`INVENTORY_UI_GUIDE.md`** - This guide

### Modified
1. **`gift_item.dart`** - Thêm support cho quantity display
   - `quantity` parameter - số lượng item
   - `showQuantity` flag - hiển thị quantity thay vì price
2. **`gift_bottom_sheet.dart`** - Handle backpack tap để show inventory

## 🎯 Key Features

### GiftItemWidget Updates
```dart
GiftItemWidget(
  gift: giftModel,
  isSelected: isSelected,
  onTap: onTap,
  quantity: 5,           // ✨ NEW: số lượng item
  showQuantity: true,    // ✨ NEW: hiển thị "x5" thay vì price
)
```

### InventoryBottomSheet
- ✅ Không có header phức tạp, chỉ có title + close button
- ✅ Không có tabs/categories
- ✅ GridView giống hệt Gift Bottom Sheet
- ✅ Items hiển thị quantity (x1, x2, x3...)
- ✅ Bottom bar với quick quantity selection
- ✅ Auto validate quantity không vượt quá available amount
- ✅ Close bottom sheet sau khi send thành công

## 🚀 Usage

### 1. Show Inventory Bottom Sheet

```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (context) => InventoryBottomSheet(
    userId: '2001',
    userName: 'John Doe',
  ),
);
```

### 2. From Gift Bottom Sheet (Backpack Button)

Đã được tích hợp sẵn! Khi click vào backpack icon trong `GiftTabBar`:
```dart
GiftTabBar(
  controller: _tabController,
  tabs: _tabs,
  onBackpackTap: _handleBackpackTap, // ← Auto show InventoryBottomSheet
)
```

### 3. GiftItemWidget - Display Modes

#### Mode 1: Show Price (Gift Catalog)
```dart
GiftItemWidget(
  gift: giftModel,
  isSelected: false,
  onTap: () {},
  // price sẽ được hiển thị với diamond icon
)
```

#### Mode 2: Show Quantity (Inventory)
```dart
GiftItemWidget(
  gift: giftModel,
  isSelected: false,
  onTap: () {},
  quantity: 5,        // số lượng
  showQuantity: true, // hiển thị "x5"
)
```

## 🎨 UI Layout

### Inventory Bottom Sheet Structure
```
┌─────────────────────────────────────────┐
│  🎒 Túi quà của tôi              [X]    │ ← Simple header
├─────────────────────────────────────────┤
│                                         │
│   [Gift1]  [Gift2]  [Gift3]  [Gift4]  │
│    x3       x5       x1       x2       │
│                                         │
│   [Gift5]  [Gift6]  [Gift7]  [Gift8]  │
│    x10      x1       x4       x3       │
│                                         │
│                 ...                     │
│                                         │
├─────────────────────────────────────────┤
│  💎10K  [1] [9] [99]         [Send]    │ ← Bottom bar
└─────────────────────────────────────────┘
```

### Comparison: Gift vs Inventory

| Feature | Gift Bottom Sheet | Inventory Bottom Sheet |
|---------|------------------|------------------------|
| Header | Full header với emoji | Simple với icon + title |
| Tabs | Yes (Hot, Event, etc) | No tabs |
| Item Display | Price với 💎 icon | Quantity với "x5" |
| Categories | Multiple categories | All items |
| Wallet Section | Active, clickable | Display only |
| Quick Quantity | 1, 9, 99 | 1, 9, 99 (limited by available) |
| Validation | Check wallet balance | Check available quantity |

## 💡 Example: Complete Flow

### Step 1: User Profile Screen
```dart
ElevatedButton(
  onPressed: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GiftBottomSheet(
        userId: targetUserId,
        userName: targetUserName,
      ),
    );
  },
  child: Text('Send Gift'),
)
```

### Step 2: Gift Bottom Sheet Opens
User sees gift catalog with tabs (Hot, Event, etc)

### Step 3: User Clicks Backpack Icon
```dart
// In GiftTabBar
IconButton(
  icon: Icon(Icons.backpack),
  onPressed: onBackpackTap, // ← Calls _handleBackpackTap
)
```

### Step 4: Inventory Bottom Sheet Opens
```dart
void _handleBackpackTap() {
  Navigator.pop(context);           // Close gift sheet
  
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => InventoryBottomSheet(
      userId: widget.userId,
      userName: widget.userName,
    ),
  );
}
```

### Step 5: User Selects Item & Sends
- Select item from inventory (shows x5, x3, etc)
- Choose quantity (1, 9, 99) - auto limited to available
- Tap "Send"
- Inventory auto updates (quantity decreases)
- Bottom sheet closes

## 🔧 Customization

### Change Quick Quantities
```dart
final List<int> _quickQuantities = [1, 5, 10, 20]; // Custom quantities
```

### Customize Header
```dart
Widget _buildHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: Row(
      children: [
        // Your custom header content
      ],
    ),
  );
}
```

### Add Loading State
Already included! Uses `ref.watch(myInventoryProvider)`:
- `loading` - Shows CircularProgressIndicator
- `data` - Shows grid of items
- `error` - Shows error message with retry button

## 🎯 Best Practices

1. **Always validate quantity**: Đảm bảo không vượt quá available amount
2. **Close after success**: Auto close bottom sheet sau khi send thành công
3. **Show feedback**: Snackbar notification cho success/error
4. **Handle empty state**: Hiển thị friendly message khi inventory trống
5. **Error handling**: Retry button khi có lỗi load inventory

## 📊 Mock Data Available

Test với 6 items mẫu trong inventory:
- Rose (x3)
- Chocolate Box (x5)
- Christmas Tree (x2, event)
- Diamond (x3, event)
- Four Leaf Clover (x1)
- Diamond Ring (x1, VIP)

## 🔍 Linter Status
✅ **No errors** - All components clean!

---

**Related Files:**
- `INVENTORY_IMPLEMENTATION.md` - Backend implementation
- `INVENTORY_QUICK_START.md` - Quick reference for service/provider

