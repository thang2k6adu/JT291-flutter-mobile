import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/profile_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/wallet_card.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/quick_access_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_screen/menu_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Darlene Bears',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgIconSimple.asset(AppIcons.scanner),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgIconSimple.asset(AppIcons.setting),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ProfileHeader(
              avatarUrl:
                  'https://statictuoitre.mediacdn.vn/thumb_w/640/2017/7-1512755474943.jpg',
              followingCount: 100,
              followersCount: 100,
              viewsCount: 100,
            ),
            WalletCard(balance: '100'),
            SizedBox(height: 20),
            QuickAccessRow(),
            SizedBox(height: 20),
            MenuSection(
              items: [
                (SvgIconSimple.asset(AppIcons.myPosts), 'My posts'),
                (SvgIconSimple.asset(AppIcons.myBackpack), 'My backpack'),
                (SvgIconSimple.asset(AppIcons.taskClans), 'Task clans'),
                (SvgIconSimple.asset(AppIcons.myReferral), 'My referral'),
              ],
            ),
            SizedBox(height: 10),
            MenuSection(
              items: [
                (SvgIconSimple.asset(AppIcons.customerService), 'Customer Service'),
                (SvgIconSimple.asset(AppIcons.helpCenter), 'Help center'),
                (SvgIconSimple.asset(AppIcons.feedback), 'Feedback'),
                (SvgIconSimple.asset(AppIcons.contractUs), 'Contract Us'),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
