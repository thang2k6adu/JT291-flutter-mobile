import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final String balance;
  final String currencyIcon; // ví dụ: 💎 hoặc $
  final VoidCallback? onTap;

  const WalletCard({
    super.key,
    this.title = 'My Wallet',
    required this.balance,
    this.currencyIcon = '💎',
    this.onTap,
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
            gradient: const LinearGradient(
              colors: [
                Color(0xFFB4A5F3),
                Color(0xFFF3A5C7),
                Color(0xFFA5D8F3),
              ],
            ),
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
                    Text(currencyIcon, style: const TextStyle(fontSize: 24)),
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
