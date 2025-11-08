import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final String balance;
  final String currencyIcon; // ví dụ: 💎 hoặc $
  final VoidCallback? onTap;
  final ImageProvider? backgroundImage;

  const WalletCard({
    super.key,
    this.title = 'My Wallet',
    required this.balance,
    this.currencyIcon = AppIcons.diamondPng,
    this.onTap,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: backgroundImage != null
                ? DecorationImage(image: backgroundImage!, fit: BoxFit.cover)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Wallet title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Wallet info (icon + balance + arrow)
                Row(
                  children: [
                    Image.asset(currencyIcon, width: 24, height: 24),
                    const SizedBox(width: 8),
                    Text(
                      balance,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
