import 'package:flutter/material.dart';

class BackgroundMap extends StatelessWidget {
  const BackgroundMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'lib/assets/images/demo3.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
