import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/utils/currency_formatter.dart';
import 'package:jt291_flutter_mobile/core/utils/currency_formatter_with_icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class DiamondPackageCard extends StatelessWidget {
  final String diamondsCount;
  final String price;
  final Widget icon;
  final VoidCallback? onTap;
  final String? currencyIcon;
  final int? bonusDiamonds;

  const DiamondPackageCard({
    super.key,
    required this.diamondsCount,
    required this.price,
    required this.icon,
    this.currencyIcon,
    this.onTap,
    this.bonusDiamonds = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 12,
              left: 12,
              right: 12,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1F2).withValues(alpha: 0.7), // 70%
              borderRadius: BorderRadius.circular(16),
              // border: Border.all(color: const Color(0xFFEEEEEE), width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Diamond Icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    const SizedBox(height: 3),
                    Text(
                      diamondsCount,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),

                // Price Button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 2,
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE65983),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: currencyIcon == null
                      ? Text(
                          CurrencyFormatter.format(num.parse(price)),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : CurrencyFormatterWithIcon(
                          iconPath: currencyIcon!,
                          value: num.parse(price),
                        ),
                ),
              ],
            ),
          ),

          bonusDiamonds != null
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: bonusDiamonds != null && bonusDiamonds! < 30000 ? Color(0xFFFECDD3) : Color(0xFF6599FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '+${bonusDiamonds ?? 0}',
                          style: TextStyle(
                            color: bonusDiamonds != null && bonusDiamonds! < 30000 ? Color(0xFFE65983) : Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(AppIcons.diamondPng, width: 12, height: 12),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
