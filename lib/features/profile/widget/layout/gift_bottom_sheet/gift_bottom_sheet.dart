import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/gift_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_tab_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_grid_view.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_bottom_bar.dart';

class GiftBottomSheet extends ConsumerStatefulWidget {
  final String userId;
  final String userName;

  const GiftBottomSheet({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  ConsumerState<GiftBottomSheet> createState() => _GiftBottomSheetState();
}

class _GiftBottomSheetState extends ConsumerState<GiftBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedQuantity = 1;
  GiftModel? _selectedGift;

  final List<String> _tabs = ['Hot', 'Event', 'Lucky', 'Friendship', 'Vip'];
  final List<int> _quickQuantities = [1, 9, 99];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const GiftHeader(),
          GiftTabBar(
            controller: _tabController,
            tabs: _tabs,
            onBackpackTap: _handleBackpackTap,
          ),
          Expanded(
            child: GiftGridView(
              tabController: _tabController,
              tabs: _tabs,
              selectedGift: _selectedGift,
              onGiftSelected: (gift) {
                setState(() => _selectedGift = gift);
              },
            ),
          ),
          GiftBottomBar(
            walletBalance: 10000, // TODO: Get from user profile
            quickQuantities: _quickQuantities,
            selectedQuantity: _selectedQuantity,
            selectedGift: _selectedGift,
            onQuantityChanged: (quantity) {
              setState(() => _selectedQuantity = quantity);
            },
            onSendPressed: _handleSendGift,
            onWalletTap: _handleWalletTap,
          ),
        ],
      ),
    );
  }

  void _handleBackpackTap() {
    // TODO: Navigate to backpack screen
  }

  void _handleWalletTap() {
    // TODO: Navigate to wallet/recharge screen
  }

  Future<void> _handleSendGift() async {
    if (_selectedGift == null) return;

    final totalCost = _selectedGift!.price * _selectedQuantity;
    final controller = ref.read(giftControllerProvider.notifier);

    print('Sending gift:');
    print('  Gift: ${_selectedGift!.name}');
    print('  Quantity: $_selectedQuantity');
    print('  Total cost: $totalCost diamonds');
    print('  Recipient: ${widget.userName} (${widget.userId})');

    await controller.sendGift(
      context,
      giftId: _selectedGift!.id,
      recipientId: widget.userId,
      quantity: _selectedQuantity,
    );
  }
}