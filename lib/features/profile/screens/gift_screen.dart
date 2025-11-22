import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_wall_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/recent_gifts_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/gift_wall_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/recent_gifts_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_screen/recent_gift_tab.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_screen/gift_wall_tab.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_screen/profile_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_screen/tab_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/recent_gift_item.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_screen/gift_wall_grid.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/gift_screen/recent_gift_list.dart';

class GiftScreen extends ConsumerStatefulWidget {
  const GiftScreen({super.key});

  @override
  ConsumerState<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends ConsumerState<GiftScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _giftWallScrollController = ScrollController();
  final ScrollController _recentGiftsScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _setupScrollListeners();

    // Load initial data và check if need load more
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(giftWallControllerProvider.notifier).refresh();
      ref.read(recentGiftsControllerProvider.notifier).refresh();
      _checkLoadMoreIfListNotFull();
      _checkRecentGiftsLoadMore();
    });
  }

  void _setupScrollListeners() {
    // Gift Wall tab scroll listener
    _giftWallScrollController.addListener(() {
      if (_giftWallScrollController.position.pixels >=
          _giftWallScrollController.position.maxScrollExtent - 200) {
        final controller = ref.read(giftWallControllerProvider.notifier);
        controller.loadMore();
      }
    });

    // Recent Gifts tab scroll listener
    _recentGiftsScrollController.addListener(() {
      if (_recentGiftsScrollController.position.pixels >=
          _recentGiftsScrollController.position.maxScrollExtent - 200) {
        final controller = ref.read(recentGiftsControllerProvider.notifier);
        controller.loadMore();
      }
    });
  }

  void _checkLoadMoreIfListNotFull() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_giftWallScrollController.hasClients &&
          _giftWallScrollController.position.maxScrollExtent <=
              _giftWallScrollController.position.viewportDimension) {
        final notifier = ref.read(myGiftWallProvider.notifier);
        if (notifier.hasNext) {
          ref.read(giftWallControllerProvider.notifier).loadMore().then((_) {
            _checkLoadMoreIfListNotFull();
          });
        }
      }
    });
  }

  void _checkRecentGiftsLoadMore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_recentGiftsScrollController.hasClients &&
          _recentGiftsScrollController.position.maxScrollExtent <=
              _recentGiftsScrollController.position.viewportDimension) {
        final notifier = ref.read(myRecentGiftsProvider.notifier);
        if (notifier.hasNext) {
          ref.read(recentGiftsControllerProvider.notifier).loadMore().then((_) {
            _checkRecentGiftsLoadMore();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _giftWallScrollController.dispose();
    _recentGiftsScrollController.dispose();
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
            child: Image.asset(AppImages.giftBg, fit: BoxFit.cover),
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
                  ProfileSectionWidget(user: user),
                  // Tab Bar
                  ProfileTabBarWidget(tabController: _tabController),
                  // Gift Grid
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GiftWallTabWidget(
                          scrollController: _giftWallScrollController,
                          onCheckLoadMore: _checkLoadMoreIfListNotFull,
                          buildGiftGrid: (gifts, notifier) =>
                              GiftWallGridWidget(
                                gifts: gifts,
                                scrollController: _giftWallScrollController,
                                isLoadingMore: notifier.isLoadingMore,
                              ),
                        ),
                        RecentGiftsTabWidget(
                          scrollController: _recentGiftsScrollController,
                          onCheckLoadMore: _checkRecentGiftsLoadMore,
                          buildRecentGiftsList: (transactions, notifier) =>
                              RecentGiftsListWidget(
                                transactions:
                                    transactions as List<GiftTransactionModel>,
                                scrollController: _recentGiftsScrollController,
                                isLoadingMore: notifier.isLoadingMore,
                                notifier: notifier,
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

  Widget _buildRecentGiftsList(transactions, notifier) {
    final isLoadingMore = notifier.isLoadingMore;

    return ListView.separated(
      controller: _recentGiftsScrollController,
      itemCount: transactions.length + (isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) {
        if (index < transactions.length - 1) {
          return Divider(
            height: 1,
            thickness: 1,
            color: Colors.white.withOpacity(0.1),
          );
        }
        return const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        if (index < transactions.length) {
          return RecentGiftItem(
            transaction: transactions[index],
            onTap: () {
              // TODO: Navigate to sender profile or gift detail
              print(
                'Tapped on gift from ${transactions[index].sender.nickname}',
              );
            },
          );
        } else {
          // Loading indicator
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.pink,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
