import 'package:flutter/material.dart';

class DepositAddressField extends StatelessWidget {
  final String depositAddress;
  final VoidCallback onCopy;

  const DepositAddressField({super.key, required this.depositAddress, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(child: Text(depositAddress, style: const TextStyle(fontSize: 16, color: Colors.black87))),
              const SizedBox(width: 8),
              InkWell(onTap: onCopy, child: const Icon(Icons.copy_outlined, size: 20, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }
}
