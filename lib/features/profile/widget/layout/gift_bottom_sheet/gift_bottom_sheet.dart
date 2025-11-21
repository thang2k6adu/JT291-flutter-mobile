import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/gift_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_item.dart';

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
    // Không cần listener vì mỗi tab tự động watch provider của category riêng
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
          _buildHeader(),
          _buildTabBar(),
          Expanded(child: _buildGiftGrid()),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      child: Image.asset(
        AppImages.giftBottomSheetBg,
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: const Color(0xFFFF6B9D),
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              labelPadding: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.only(left: 16),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFFFF6B9D), width: 4),
                insets: EdgeInsets.symmetric(horizontal: 4),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              dividerHeight: 0,
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: GestureDetector(
              onTap: () {
                // Xử lý khi bấm vào icon backpack
              },
              child: SvgPicture.asset(
                AppIcons.myBackpack,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftGrid() {
    return TabBarView(
      controller: _tabController,
      children: _tabs.map((categoryName) {
        final category = categoryName.toLowerCase();
        
        // Watch gifts của category này - mỗi category có cache riêng
        return Consumer(
          builder: (context, ref, child) {
            final giftsAsync = ref.watch(giftByCategoryProvider(category));
            
            return giftsAsync.when(
              data: (gifts) {
                if (gifts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_giftcard_outlined,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No gifts available',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: gifts.length,
                  itemBuilder: (context, index) {
                    final gift = gifts[index];
                    final isSelected = _selectedGift?.id == gift.id;

                    return GiftItemWidget(
                      gift: gift,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          _selectedGift = gift;
                        });
                      },
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFF6B9D),
                ),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading gifts',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        ref.read(giftControllerProvider.notifier).refresh(category);
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Wallet balance
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(AppIcons.diamondPng, width: 16, height: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${convertToCompactFormNumber(10000)}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Quantity buttons
            ..._quickQuantities.map((quantity) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildQuantityButton(quantity),
              );
            }),
            
            const Spacer(),
            
            // Send button with total cost
            ElevatedButton(
              onPressed: _selectedGift == null ? null : _handleSendGift,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B9D),
                disabledBackgroundColor: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(int quantity) {
    final isSelected = _selectedQuantity == quantity;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedQuantity = quantity;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[300],
          border: Border.all(
            color: isSelected ? const Color(0xFFE65983) : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '$quantity',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFFE65983) : Colors.black87,
          ),
        ),
      ),
    );
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

    // Use controller to send gift
    final success = await controller.sendGift(
      context,
      giftId: _selectedGift!.id,
      recipientId: widget.userId,
      quantity: _selectedQuantity,
    );

    if (success) {
      // Close bottom sheet after successful send
      if (mounted) {
        Navigator.pop(context);
        
        // Show custom success message with gift details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Sent ${_selectedGift!.name} ×$_selectedQuantity to ${widget.userName}',
                  ),
                ),
                Image.asset(AppIcons.diamondPng, width: 16, height: 16),
                const SizedBox(width: 4),
                Text('$totalCost'),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }
}