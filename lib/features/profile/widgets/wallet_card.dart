import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.balance,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  final double balance;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: _WalletCardContent(balance: balance),
      ),
    );
  }
}

class _WalletCardContent extends StatelessWidget {
  const _WalletCardContent({
    required this.balance,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF64B5F6),
            Color(0xFFBA68C8),
            Color(0xFFF06292),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(),
          _buildBalanceSection(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'My Wallet',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Row(
      children: [
        _buildIcon(),
        const SizedBox(width: 8),
        _buildBalanceText(),
        const SizedBox(width: 8),
        _buildChevronIcon(),
      ],
    );
  }

  Widget _buildIcon() {
    return const Text(
      '💎',
      style: TextStyle(fontSize: 24),
    );
  }

  Widget _buildBalanceText() {
    return Text(
      _formatBalance(balance),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildChevronIcon() {
    return const Icon(
      Icons.chevron_right,
      color: Colors.white,
    );
  }

  String _formatBalance(double balance) {
    return balance.toStringAsFixed(2);
  }
}