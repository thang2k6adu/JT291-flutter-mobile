import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class DiamondScreen extends ConsumerWidget {
  const DiamondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWithBack(
        title: 'Diamonds',
        bottomBorder: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgIconSimple.asset(AppIcons.receipt),
          ),
        ],
      ),
    );
  }
}