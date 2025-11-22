import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_wall_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/gift_wall_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_bottom_sheet/gift_item.dart';

class GiftScreen extends ConsumerStatefulWidget {
  const GiftScreen({super.key});

  @override
  ConsumerState<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends ConsumerState<GiftScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    final userAsync = ref.watch(userGeneralProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWithBack(
        title: 'Gift',
        backgroundColor: Colors.transparent,
        textColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_image.png', // đường dẫn đến ảnh của bạn
              fit: BoxFit.cover,
            ),
          ),

          userAsync.when(
            data: (user) {
              if (user == null) {
                return const Center(
                  child: Text(
                    'Không thể tải thông tin người dùng',
                    style: TextStyle(color: Colors.white54),
                  ),
                );
              }

              return Column(
                children: [
                  // Profile Section
                  _buildProfileSection(user),
                  // Tab Bar
                  _buildTabBar(),
                  // Gift Grid
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildGiftWallTab(),
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
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.pink),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lỗi: $error',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(userGeneralProvider);
                    },
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(user) {
    final level = user.level;
    final currentLevel = level?.currentLevel ?? 0;
    final currentExp = level?.currentExp ?? 0;
    final nextLevelExp = level?.nextLevelExp ?? 50;

    return Container(
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
                  image: user.avatar.isNotEmpty
                      ? NetworkImage(user.avatar)
                      : const AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
                  size: 62,
                  borderWidth: 1.38,
                  showGlow: true,
                ),
                const SizedBox(height: 12),
                // User Info
                Text(
                  user.nickname,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.bio ?? 'Help me light up the Gift Wall.',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(
                    '$currentExp/$nextLevelExp',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                'Level $currentLevel',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white12, width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
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

  Widget _buildGiftWallTab() {
    final giftWallAsync = ref.watch(myGiftWallProvider);
    final controller = ref.read(giftWallControllerProvider.notifier);

    return giftWallAsync.when(
      data: (gifts) {
        if (gifts.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.refresh();
            },
            child: ListView(
              children: const [
                SizedBox(height: 200),
                Center(
                  child: Text(
                    'Chưa có quà tặng nào',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.refresh();
          },
          child: _buildGiftGrid(gifts),
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(color: Colors.pink)),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lỗi: $error',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.refresh();
              },
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftGrid(List<GiftModel> gifts) {
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
        return GiftItemWidget(
          gift: gifts[index],
          color: Colors.white.withValues(alpha: 0.1),
          nameStyle: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          height: 6,
          contentWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${gifts[index].currentCount}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Text(
                '/${gifts[index].requiredCount}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
