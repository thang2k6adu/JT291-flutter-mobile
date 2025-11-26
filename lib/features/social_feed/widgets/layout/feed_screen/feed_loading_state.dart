import 'package:flutter/material.dart';

/// Loading state widget for feed
class FeedLoadingState extends StatelessWidget {
  const FeedLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFFFF69B4)),
    );
  }
}

