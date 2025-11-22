import 'package:flutter/material.dart';

class ProfileTabBarWidget extends StatelessWidget {
  final TabController tabController;

  const ProfileTabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white12, width: 1)),
      ),
      child: TabBar(
        controller: tabController,
        indicatorColor: Colors.pink,
        indicatorWeight: 3,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white54,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  
        tabs: const [
          Tab(text: 'Tường quà tặng'),
          Tab(text: 'Quà tặng gần đây'),
        ],
      ),
    );
  }
}