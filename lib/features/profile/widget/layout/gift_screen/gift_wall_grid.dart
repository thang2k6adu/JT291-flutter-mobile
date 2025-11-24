import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/gift_item.dart';

class GiftWallGridWidget extends StatelessWidget {
  final List<GiftModel> gifts;
  final ScrollController scrollController;
  final bool isLoadingMore;

  const GiftWallGridWidget({
    super.key,
    required this.gifts,
    required this.scrollController,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final gift = gifts[index];
                final isInactive = gift.currentCount == 0;
                
                return Opacity(
                  opacity: isInactive ? 0.4 : 1.0,
                  child: GiftItemWidget(
                    gift: gift,
                    color: Colors.white.withValues(alpha: 0.1),
                    nameStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    height: 6,
                    contentWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${gift.currentCount}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: gift.currentCount < gift.requiredCount ? AppColors.primary : Colors.green,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '/${gift.requiredCount}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: gifts.length,
            ),
          ),
        ),
        // Loading indicator khi đang load more
        if (isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}