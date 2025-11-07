import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_app_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_bottom_navbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/wallet_card.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/quick_access_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/menu_section.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_stats_provider.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static final quickAccessItems = [
    (Image.asset(AppIcons.vipPng, width: 40, height: 40), 'Vip'),
    (Image.asset(AppIcons.storePng, width: 40, height: 40), 'Store'),
    (Image.asset(AppIcons.taskCenterPng, width: 40, height: 40), 'Task Center'),
    (Image.asset(AppIcons.loveSpacePng, width: 40, height: 40), 'Love Space'),
  ];

  static final menuSection1 = [
    (SvgIconSimple.asset(AppIcons.myPosts), 'My posts'),
    (SvgIconSimple.asset(AppIcons.myBackpack), 'My backpack'),
    (SvgIconSimple.asset(AppIcons.taskClans), 'Task clans'),
    (SvgIconSimple.asset(AppIcons.myReferral), 'My referral'),
  ];

  static final menuSection2 = [
    (SvgIconSimple.asset(AppIcons.customerService), 'Customer Service'),
    (SvgIconSimple.asset(AppIcons.helpCenter), 'Help center'),
    (SvgIconSimple.asset(AppIcons.feedback), 'Feedback'),
    (SvgIconSimple.asset(AppIcons.contractUs), 'Contract Us'),
  ];

  static final List<BottomNavigationBarItem> profileNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 15,
        backgroundImage: Image.network(
          'https://statictuoitre.mediacdn.vn/thumb_w/640/2017/7-1512755474943.jpg',
        ).image,
      ),
      label: '',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userGeneralAsync = ref.watch(userGeneralProvider);
    final userStatsAsync = ref.watch(userStatsProvider);


    return userGeneralAsync.when(
      data: (user) => Scaffold(
        backgroundColor: Colors.white,
        appBar: ProfileAppBar(title: user?.nickname ?? ''),
        body: SingleChildScrollView(
          child: Column(
            children:  [
              ProfileHeader(
                avatarUrl: user?.avatarUrl,
                followingCount: userStatsAsync.value?.followingCount ?? 0,
                followersCount: userStatsAsync.value?.followersCount ?? 0,
                viewsCount: user?.viewsCount ?? 0,
                onAvatarTap: () {
                  pushScreen(context, RouteConstants.userMe);
                },
                onStatsTap: () {
                  pushScreen(context, RouteConstants.userRelationships);
                },
              ),
              VerticalSection(child: WalletCard(balance: '100')),
              VerticalSection(child: QuickAccessRow(items: quickAccessItems)),
              VerticalSection(spacing: 10, child: MenuSection(items: menuSection1)),
              VerticalSection(spacing: 100, child: MenuSection(items: menuSection2)),
            ],
          ),
        ),
        bottomNavigationBar: ProfileBottomNavBar(
          currentIndex: 4,
          onTap: (index) {},
          profileNavItems: profileNavItems,
          image: user?.avatarUrl != null
              ? Image.network(user!.avatarUrl!).image
              : null,
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
