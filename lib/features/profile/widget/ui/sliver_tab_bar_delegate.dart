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
  double get maxExtent => 48.0 + padding.top;
  
  @override
  double get minExtent => 48.0 + padding.top;
  
  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar || padding != oldDelegate.padding;
  }
}
