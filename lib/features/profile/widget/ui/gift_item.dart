import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';

class GiftItemWidget extends StatelessWidget {
  final GiftModel gift;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color color;
  final TextStyle? nameStyle;
  final Widget? contentWidget;
  final double height;

  const GiftItemWidget({
    super.key,
    required this.gift,
    this.isSelected = false,
    this.onTap,
    this.color = Colors.transparent,
    this.nameStyle = const TextStyle(
      fontSize: 11,
      color: Colors.black,
      overflow: TextOverflow.ellipsis,
    ),
    this.contentWidget,
    this.height = 4,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1AE65983) : color,
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6B9D) : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Expanded(
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
              if (contentWidget != null) SizedBox(height: height),
              Text(gift.name, style: nameStyle),
              contentWidget ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
