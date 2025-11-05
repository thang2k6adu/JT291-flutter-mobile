import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/ui/action_button.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ActionButton(icon: Icons.auto_fix_high, size: 44),
            SizedBox(width: 16),
            ActionButton(label: '99+', size: 52),
            SizedBox(width: 16),
            ActionButton(icon: Icons.my_location, size: 44),
          ],
        ),
      ),
    );
  }
}
