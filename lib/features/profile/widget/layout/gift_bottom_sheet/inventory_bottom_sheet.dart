import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/inventory_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/inventory_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_item.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_bottom_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_bottom_sheet.dart';

class InventoryBottomSheet extends ConsumerStatefulWidget {
  final String userId;
  final String userName;

  const InventoryBottomSheet({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  ConsumerState<InventoryBottomSheet> createState() =>
      _InventoryBottomSheetState();
}

class _InventoryBottomSheetState extends ConsumerState<InventoryBottomSheet> {
  int _selectedQuantity = 1;
  GiftModel? _selectedItem;

  final List<int> _quickQuantities = [1, 9, 99];

  @override
  Widget build(BuildContext context) {
    final inventoryState = ref.watch(myInventoryProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Simple header without close button
          _buildHeader(),

          // Grid view of inventory items
          Expanded(
            child: inventoryState.when(
              data: (items) {
                if (items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.noItemAvailablePng,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No items available',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GiftItemWidget(
                      gift: item,
                      isSelected: _selectedItem?.id == item.id,
                      contentWidget: Text(
                        'x${item.quantity}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () => setState(() => _selectedItem = item),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Không thể tải túi quà',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(inventoryControllerProvider.notifier)
                            .refresh();
                      },
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom bar with send button
          GiftBottomBar(
            walletBalance: 10000, // This is just for UI, not used for inventory
            quickQuantities: _quickQuantities,
            selectedQuantity: _selectedQuantity,
            selectedGift: _selectedItem != null
                ? GiftModel(
                    id: _selectedItem!.id,
                    name: _selectedItem!.name,
                    imageUrl: _selectedItem!.imageUrl,
                    price: _selectedItem!.price,
                    type: _selectedItem!.type,
                    isEvent: _selectedItem!.isEvent,
                    eventEndDate: _selectedItem!.eventEndDate,
                    description: _selectedItem!.description,
                    category: _selectedItem!.category,
                  )
                : null,
            onQuantityChanged: (quantity) {
              print('Quantity changed: $quantity');
              setState(() {
                // Limit quantity to available amount
                if (_selectedItem != null) {
                  print('Selected item: ${_selectedItem!.quantity}');
                  _selectedQuantity = quantity > _selectedItem!.quantity
                      ? _selectedItem!.quantity
                      : quantity;
                } else {
                  _selectedQuantity = quantity;
                }
              });
            },
            onSendPressed: _handleSendGift,
            onWalletTap: () => handleWalletTap(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onBackPressed,
            child: const Icon(Icons.arrow_back_ios, color: Color(0xFF030712)),
          ),
          const SizedBox(width: 8),
          const Text(
            'Bag',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  void handleWalletTap(BuildContext context) {
    pushScreen(context, RouteConstants.diamonds);
  }

  void _onBackPressed() {
    Navigator.pop(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          GiftBottomSheet(userId: widget.userId, userName: widget.userName),
    );
  }

  Future<void> _handleSendGift() async {
    if (_selectedItem == null) return;

    // Validate quantity
    if (_selectedQuantity > _selectedItem!.quantity) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Bạn chỉ có ${_selectedItem!.quantity} ${_selectedItem!.name}',
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final controller = ref.read(inventoryControllerProvider.notifier);

    print('Sending gift from inventory:');
    print('  Gift: ${_selectedItem!.name}');
    print('  Quantity: $_selectedQuantity');
    print('  Available: ${_selectedItem!.quantity}');
    print('  Recipient: ${widget.userName} (${widget.userId})');

    final success = await controller.sendGift(
      context,
      recipientId: widget.userId,
      itemId: _selectedItem!.id,
      quantity: _selectedQuantity,
    );

    if (success) {
      // Close bottom sheet after successful send
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}
