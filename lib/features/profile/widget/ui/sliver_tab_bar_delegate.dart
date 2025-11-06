import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final EdgeInsets padding;
  
  const SliverTabBarDelegate({
    required this.tabBar,
    this.padding = EdgeInsets.zero,
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      padding: padding,
      child: tabBar,
    );
  }
  
  @override
  double get maxExtent => padding.top + 48.0;
  
  @override
  double get minExtent => padding.top + 48.0;
  
  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar || padding != oldDelegate.padding;
  }
}
