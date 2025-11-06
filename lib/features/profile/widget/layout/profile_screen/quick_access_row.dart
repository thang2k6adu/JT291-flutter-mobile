import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/stat_item.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class QuickAccessRow extends StatelessWidget {
  const QuickAccessRow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (Image.asset(AppIcons.vipPng, width: 40, height: 40), 'Vip'),
      (Image.asset(AppIcons.storePng, width: 40, height: 40), 'Store'),
      (Image.asset(AppIcons.taskCenterPng, width: 40, height: 40), 'Task Center'),
      (Image.asset(AppIcons.loveSpacePng, width: 40, height: 40), 'Love Space'),
    ];

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
