import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/utils/currency_formatter.dart';
import 'package:jt291_flutter_mobile/core/utils/currency_formatter_with_icon.dart';

class DiamondPackageCard extends StatelessWidget {
  final String diamondsCount;
  final String price;
  final Widget icon;
  final VoidCallback? onTap;
  final String? currencyIcon;

  const DiamondPackageCard({
    super.key,
    required this.diamondsCount,
    required this.price,
    required this.icon,
    this.currencyIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFE65983),
                borderRadius: BorderRadius.circular(20),
              ),
              child: 
              currencyIcon == null ? Text(
                CurrencyFormatter.format(num.parse(price)),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ), 
              ) : CurrencyFormatterWithIcon(iconPath: currencyIcon!, value: num.parse(price)),
            ),
          ],
        ),
      ),
    );
  }
}
