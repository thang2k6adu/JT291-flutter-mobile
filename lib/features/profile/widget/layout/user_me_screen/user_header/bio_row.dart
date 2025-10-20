import 'package:flutter/material.dart';

class BioRow extends StatelessWidget {
  final String bio;
  
  const BioRow({
    super.key,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      bio,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.grey[600],
        height: 1.4,
      ),
    );
  }
}
