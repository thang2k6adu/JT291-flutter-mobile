import 'package:flutter/material.dart';

class PortsTabContent extends StatelessWidget {
  const PortsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Center(
        child: Text(
          'Ports Tab Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
