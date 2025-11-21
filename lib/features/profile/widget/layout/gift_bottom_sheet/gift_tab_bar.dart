import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class GiftTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  final VoidCallback? onBackpackTap;

  const GiftTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    this.onBackpackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TabBar(
              controller: controller,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: const Color(0xFFFF6B9D),
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              labelPadding: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.only(left: 16),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFFFF6B9D), width: 4),
                insets: EdgeInsets.symmetric(horizontal: 4),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              dividerHeight: 0,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: GestureDetector(
              onTap: onBackpackTap,
              child: SvgPicture.asset(
                AppIcons.myBackpack,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}