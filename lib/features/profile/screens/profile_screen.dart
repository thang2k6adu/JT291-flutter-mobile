import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_app_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_bottom_navbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/wallet_card.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/quick_access_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/menu_section.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/wallet_summary_provider.dart';

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
    final walletSummaryAsync = ref.watch(walletSummaryProvider);

    return userGeneralAsync.when(
      data: (user) => Scaffold(
        backgroundColor: Colors.white,
        appBar: ProfileAppBar(
          title: user?.nickname ?? '',
          scannerOnPressed: () {
            pushScreen(context, RouteConstants.searchUser);
          },
          settingOnPressed: () {
            pushScreen(context, RouteConstants.userSetting);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(
                avatarUrl: user?.avatar,
                followingCount: userStatsAsync.value?.followingCount ?? 0,
                followersCount: userStatsAsync.value?.followersCount ?? 0,
                viewsCount: userStatsAsync.value?.viewsCount ?? 0,
                onAvatarTap: () {
                  pushScreen(context, RouteConstants.userMe);
                },
                onFollowingTap: () {
                  pushScreen(context, RouteConstants.userRelationships);
                },
                onFollowersTap: () {
                  pushScreen(context, RouteConstants.userRelationships);
                },
                onViewsTap: () {
                  pushScreen(context, RouteConstants.userProfileView);
                },
              ),
              VerticalSection(
                child: WalletCard(
                  backgroundImage: AssetImage(AppImages.myWallet),
                  balance: formatNumberWithCommas(
                    walletSummaryAsync.value?.totalDiamondBalance ?? 0,
                  ),
                  onTap: () {
                    pushScreen(context, RouteConstants.diamonds);
                  },
                ),
              ),
              VerticalSection(child: QuickAccessRow(items: quickAccessItems)),
              VerticalSection(
                spacing: 10,
                child: MenuSection(items: menuSection1),
              ),
              VerticalSection(
                spacing: 100,
                child: MenuSection(items: menuSection2),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ProfileBottomNavBar(
          currentIndex: 4,
          onTap: (index) {},
          profileNavItems: profileNavItems,
          image: user?.avatar != null
              ? Image.network(user!.avatar).image
              : null,
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
