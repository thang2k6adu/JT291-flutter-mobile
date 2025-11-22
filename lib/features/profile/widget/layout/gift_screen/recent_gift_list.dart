import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/recent_gifts_provider.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/recent_gift_item.dart';

class RecentGiftsListWidget extends StatelessWidget {
  final List<GiftTransactionModel> transactions;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final MyRecentGiftsNotifier notifier;

  const RecentGiftsListWidget({
    super.key,
    required this.transactions,
    required this.scrollController,
    required this.isLoadingMore,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: transactions.length + (isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) {
        if (index < transactions.length - 1) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.white.withOpacity(0.1),
          );
        }
        return const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        if (index < transactions.length) {
          return RecentGiftItem(
            transaction: transactions[index],
            onTap: () {
              // TODO: Navigate to sender profile or gift detail
              print(
                'Tapped on gift from ${transactions[index].sender.nickname}',
              );
            },
          );
        } else {
          // Loading indicator
          return const Padding(
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
          );
        }
      },
    );
  }
}