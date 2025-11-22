import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/gift_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/gift_item.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';

class GiftGridView extends ConsumerWidget {
  final TabController tabController;
  final List<String> tabs;
  final GiftModel? selectedGift;
  final ValueChanged<GiftModel> onGiftSelected;

  const GiftGridView({
    super.key,
    required this.tabController,
    required this.tabs,
    required this.selectedGift,
    required this.onGiftSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabBarView(
      controller: tabController,
      children: tabs.map((categoryName) {
        final category = categoryName.toLowerCase();
        final giftsAsync = ref.watch(giftByCategoryProvider(category));

        return giftsAsync.when(
          data: (gifts) {
            if (gifts.isEmpty) {
              return _buildEmptyState();
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
                final isSelected = selectedGift?.id == gift.id;

                return GiftItemWidget(
                  gift: gift,
                  isSelected: isSelected,
                  contentWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppIcons.diamondPng, width: 10, height: 10),
                      Text(
                        ' ${convertToCompactFormNumber(gift.price ?? 0)}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  onTap: () => onGiftSelected(gift),
                );
              },
            );
          },
          loading: () => _buildLoadingState(),
          error: (error, stack) => _buildErrorState(ref, category),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState() {
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
            style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFFFF6B9D)),
    );
  }

  Widget _buildErrorState(WidgetRef ref, String category) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
          const SizedBox(height: 16),
          Text(
            'Error loading gifts',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
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
    );
  }
}
