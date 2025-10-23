import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/sliver_tab_bar_delegate.dart';

class SliverTabBar extends StatelessWidget {
  final TabController tabController;

  const SliverTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverTabBarDelegate(
        tabBar: TabBar(
          controller: tabController,
          indicatorColor: AppColors.pink[6],
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColors.pink[6],
          unselectedLabelColor: AppColors.gray[5],
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: 'General'),
            Tab(text: 'Ports'),
          ],
        ),
      ),
    );
  }
}
