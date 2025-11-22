import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<GiftItem> gifts = [
    GiftItem(
      id: 1,
      name: 'Quà tặng 1',
      progress: 5,
      total: 10,
      icon: '🐷',
      isUnlocked: true,
    ),
    GiftItem(
      id: 2,
      name: 'Quà tặng 2',
      progress: 1,
      total: 10,
      icon: '🎁',
      isUnlocked: true,
    ),
    GiftItem(
      id: 3,
      name: 'Quà tặng 3',
      progress: 1,
      total: 10,
      icon: '✊',
      isUnlocked: true,
    ),
    GiftItem(
      id: 4,
      name: 'Quà tặng 4',
      progress: 1,
      total: 10,
      icon: '🥦',
      isUnlocked: true,
    ),
    GiftItem(
      id: 5,
      name: 'Quà tặng 5',
      progress: 0,
      total: 10,
      icon: '🔫',
      isUnlocked: false,
    ),
    GiftItem(
      id: 6,
      name: 'Quà tặng 6',
      progress: 1,
      total: 10,
      icon: '🐥',
      isUnlocked: true,
    ),
    GiftItem(
      id: 7,
      name: 'Quà tặng 7',
      progress: 1,
      total: 10,
      icon: '🎫',
      isUnlocked: true,
    ),
    GiftItem(
      id: 8,
      name: 'Quà tặng 8',
      progress: 0,
      total: 10,
      icon: '🍪',
      isUnlocked: false,
    ),
    GiftItem(
      id: 9,
      name: 'Quà tặng 9',
      progress: 0,
      total: 10,
      icon: '🐥',
      isUnlocked: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWithBack(
        title: 'Gift',
        backgroundColor: Colors.transparent,
        textColor: Colors.white,
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: User Detail (Column)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar
                      AvatarWidget(
                        image: NetworkImage(
                          'https://bom.edu.vn/public/upload/2024/12/meme-buaa-17.webp',
                        ),
                        size: 62,
                        borderWidth: 1.38,
                        showGlow: true,
                      ),
                      const SizedBox(height: 12),
                      // User Info
                      const Text(
                        'Darlene Bears',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Help me light up the Gift Wall.',
                        style: TextStyle(color: Colors.grey[400] , fontSize: 14, fontWeight: FontWeight.w500  ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Right: Level Badge
                Column(
                  children: [
                    Image.asset(AppIcons.badge1Png, width: 74, height: 74),
                    const SizedBox(height: 4),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(
                          '112/200',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Level 34',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tab Bar
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white12, width: 1),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.pink,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: 'Tường quà tặng'),
                Tab(text: 'Quà tặng gần đây'),
              ],
            ),
          ),
          // Gift Grid
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGiftGrid(),
                const Center(
                  child: Text(
                    'Quà tặng gần đây',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        return _buildGiftCard(gifts[index]);
      },
    );
  }

  Widget _buildGiftCard(GiftItem gift) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gift Icon
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gift.isUnlocked
                    ? [Colors.purple.shade400, Colors.blue.shade600]
                    : [Colors.grey.shade800, Colors.grey.shade900],
              ),
            ),
            child: Center(
              child: Text(
                gift.icon,
                style: TextStyle(
                  fontSize: 35,
                  color: gift.isUnlocked ? Colors.white : Colors.white24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Gift Name
          Text(
            gift.name,
            style: TextStyle(
              color: gift.isUnlocked ? Colors.white : Colors.white38,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          // Progress
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${gift.progress}',
                  style: TextStyle(
                    color: gift.progress > 0 ? Colors.pink : Colors.white38,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '/${gift.total}',
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GiftItem {
  final int id;
  final String name;
  final int progress;
  final int total;
  final String icon;
  final bool isUnlocked;

  GiftItem({
    required this.id,
    required this.name,
    required this.progress,
    required this.total,
    required this.icon,
    required this.isUnlocked,
  });
}
