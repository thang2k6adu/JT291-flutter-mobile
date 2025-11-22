import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';

class RecentGiftItem extends StatelessWidget {
  final GiftTransactionModel transaction;
  final VoidCallback? onTap;

  const RecentGiftItem({
    super.key,
    required this.transaction,
    this.onTap,
  });

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('MM-dd HH:mm').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            // Avatar người gửi
            AvatarWidget(
              image: transaction.sender.avatar.isNotEmpty
                  ? NetworkImage(transaction.sender.avatar)
                  : const AssetImage('assets/images/default_avatar.png')
                      as ImageProvider,
              size: 48,
              borderWidth: 0,
            ),
            const SizedBox(width: 12),
            
            // Thông tin người gửi và thời gian
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.sender.nickname,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTimestamp(transaction.timestamp),
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            
            // Gift info
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Gift image
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: transaction.giftInfo.imageUrl.isNotEmpty
                        ? Image.network(
                            transaction.giftInfo.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.card_giftcard,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 6),
                
                // Gift name and quantity
                Text(
                  'Quà tặng x${transaction.giftInfo.quantity}',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

