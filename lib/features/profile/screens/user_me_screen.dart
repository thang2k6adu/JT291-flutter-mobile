// lib/features/profile/screens/user_me_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/assets/assets.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_loading.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_error.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/profile_tab_content.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/sliver_tab_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/animated_header.dart';
import 'package:go_router/go_router.dart';

class UserMeScreen extends ConsumerStatefulWidget {
  const UserMeScreen({super.key});

  @override
  ConsumerState<UserMeScreen> createState() => _UserMeScreenState();
}

class _UserMeScreenState extends ConsumerState<UserMeScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late DraggableScrollableController _draggableController;
  double _currentExtent = 0.87; // Initial extent

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _draggableController = DraggableScrollableController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _draggableController.dispose();
    super.dispose();
  }

  void _onExtentChanged(double extent) {
    setState(() {
      _currentExtent = extent;
    });
  }

  EdgeInsets _getTabBarPadding() {
    if (_currentExtent >= 0.95) {
      // Tính toán padding top dựa trên mức độ vượt quá 0.95
      final extraExtent = _currentExtent - 0.95;
      final maxPadding = 80.0; // Padding top tối đa
      final paddingValue = (extraExtent / 0.05) * maxPadding; // 0.05 là khoảng từ 0.95 đến 1.0
      return EdgeInsets.only(top: paddingValue);
    }
    return EdgeInsets.zero;
  }

  @override
  Widget build(BuildContext context) {
    final userGeneralAsync = ref.watch(userGeneralProvider);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagePaths.getPath(ImagePath.splash),
              fit: BoxFit.cover,
            ),
          ),

          // Draggable Sheet với CustomScrollView
          ReusableDraggableSheet(
            controller: _draggableController,
            initialChildSize: 0.87,
            minChildSize: 0.12,
            maxChildSize: 1,
            onExtentChanged: _onExtentChanged,
            builder: (context, scrollController) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  // User Header
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        userGeneralAsync.when(
                          data: (user) =>
                              UserHeader.fromUserGeneral(user: user),
                          loading: () => const UserHeaderLoading(),
                          error: (error, stack) =>
                              UserHeaderError(error: error),
                        ),
                      ]),
                    ),
                  ),

                  // TabBar as SliverPersistentHeader
                  SliverTabBar(
                    tabController: _tabController,
                    padding: _getTabBarPadding(),
                  ),

                  // Tab Content
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: ProfileTabContent(tabController: _tabController),
                  ),
                ],
              );
            },
          ),
          userGeneralAsync.when(
            data: (user) => AnimatedCustomTopBar(
              extent: _currentExtent,
              avatarUrl: user?.avatarUrl,
              nickname: user?.nickname,
              uid: user?.unionId,
              onBackPressed: () => GoRouter.of(context).pop(),
            ),
            loading: () => AnimatedCustomTopBar(
              extent: _currentExtent,
              onBackPressed: () => GoRouter.of(context).pop(),
            ),
            error: (error, stack) => AnimatedCustomTopBar(
              extent: _currentExtent,
              onBackPressed: () => GoRouter.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
