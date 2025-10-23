import 'package:flutter/material.dart';

class PortsTabContent extends StatelessWidget {
  const PortsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Center(
        child: Text(
          'Ports Tab Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
