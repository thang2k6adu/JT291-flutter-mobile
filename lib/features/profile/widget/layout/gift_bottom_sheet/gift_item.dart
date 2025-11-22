import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';

class GiftItemWidget extends StatelessWidget {
  final GiftModel gift;
  final bool isSelected;
  final VoidCallback onTap;
  final int? quantity; // If provided, show quantity instead of price
  final bool showQuantity; // Whether to show quantity or price

  const GiftItemWidget({
    super.key,
    required this.gift,
    required this.isSelected,
    required this.onTap,
    this.quantity,
    this.showQuantity = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1AE65983) : Colors.transparent,
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6B9D) : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      gift.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.card_giftcard,
                          size: 32,
                          color: Colors.grey.shade400,
                        );
                      },
                    ),
                  ),
                ),
                if (gift.isEvent)
                  Positioned(
                    top: -12,
                    right: -16,

                    child: Image.asset(
                      AppIcons.eventTagPng,
                      width: 33,
                      height: 16,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              gift.name,
              style: const TextStyle(fontSize: 11, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            if (showQuantity && quantity != null)
              Text(
                'x$quantity',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppIcons.diamondPng, width: 12, height: 12),
                  const SizedBox(width: 2),
                  Text(
                    '${convertToCompactFormNumber(gift.price!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
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
