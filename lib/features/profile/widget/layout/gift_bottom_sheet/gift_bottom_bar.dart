import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';

class GiftBottomBar extends StatelessWidget {
  final int walletBalance;
  final List<int> quickQuantities;
  final int selectedQuantity;
  final GiftModel? selectedGift;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback? onSendPressed;
  final VoidCallback? onWalletTap;
  final bool isLoading;

  const GiftBottomBar({
    super.key,
    required this.walletBalance,
    required this.quickQuantities,
    required this.selectedQuantity,
    required this.selectedGift,
    required this.onQuantityChanged,
    this.onSendPressed,
    this.onWalletTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _buildWalletBalance(),
            const SizedBox(width: 12),
            ...quickQuantities.map((quantity) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildQuantityButton(quantity),
              );
            }),
            const Spacer(),
            _buildSendButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletBalance() {
    return GestureDetector(
      onTap: onWalletTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(AppIcons.diamondPng, width: 16, height: 16),
            const SizedBox(width: 4),
            Text(
              convertToCompactFormNumber(walletBalance),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.chevron_right,
              size: 16,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(int quantity) {
    final isSelected = selectedQuantity == quantity;

    return GestureDetector(
      onTap: () => onQuantityChanged(quantity),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[300],
          border: Border.all(
            color: isSelected ? const Color(0xFFE65983) : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '$quantity',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFFE65983) : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    final bool isDisabled = selectedGift == null || isLoading;
    
    return ElevatedButton(
      onPressed: isDisabled ? null : onSendPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF6B9D),
        disabledBackgroundColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading) ...[
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
          Text(
            isLoading ? '' : 'Send',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}