import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DepositQrSection extends StatelessWidget {
  final String depositAddress;

  const DepositQrSection({super.key, required this.depositAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: QrImageView(
              data: depositAddress,
              version: QrVersions.auto,
              size: 200,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Deposit address',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
