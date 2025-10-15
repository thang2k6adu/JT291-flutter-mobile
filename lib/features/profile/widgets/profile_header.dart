import 'package:flutter/material.dart';

/// A reusable profile header widget that displays user name and action buttons
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.userName,
    this.onCreditCardPressed,
    this.onSettingsPressed,
    this.padding = const EdgeInsets.all(16.0),
    this.textStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  });

  final String userName;
  final VoidCallback? onCreditCardPressed;
  final VoidCallback? onSettingsPressed;
  final EdgeInsets padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            userName,
            style: textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              _buildIconButton(
                icon: Icons.credit_card_outlined,
                onPressed: onCreditCardPressed,
                tooltip: 'Payment methods',
              ),
              const SizedBox(width: 8),
              _buildIconButton(
                icon: Icons.settings_outlined,
                onPressed: onSettingsPressed,
                tooltip: 'Settings',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback? onPressed,
    required String tooltip,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      tooltip: tooltip,
      splashRadius: 20, // Better touch target
    );
  }
}
