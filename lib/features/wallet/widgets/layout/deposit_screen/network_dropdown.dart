import 'package:flutter/material.dart';

class NetworkDropdown extends StatelessWidget {
  final List<String> networks;
  final String selectedNetwork;
  final ValueChanged<String?> onChanged;

  const NetworkDropdown({
    super.key,
    required this.networks,
    required this.selectedNetwork,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Network',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedNetwork,
              isExpanded: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: networks.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 16, color: Colors.black87)))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
