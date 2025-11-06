import 'package:flutter/material.dart';

class CenterCharacter extends StatelessWidget {
  const CenterCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'lib/assets/images/demo2.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 4),
            Container(
              width: 60,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
