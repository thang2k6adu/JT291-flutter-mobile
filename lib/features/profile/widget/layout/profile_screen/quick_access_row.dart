import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/stat_item.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class QuickAccessRow extends StatelessWidget {
  final List<(Widget, String)> items;
  const QuickAccessRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .map(
              (e) => Expanded(child: 
              StatItem(
                label: e.$2,
                icon: e.$1,
              ),
            ),
          )
          .toList(),
      ),
    );
  }
}
