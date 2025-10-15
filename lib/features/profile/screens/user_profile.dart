import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/custom_bottom_nav.dart';
import 'package:flutter_boilerplate/features/profile/widgets/features_grid.dart';
import 'package:flutter_boilerplate/features/profile/widgets/menu_list.dart';
import 'package:flutter_boilerplate/features/profile/widgets/profile_header.dart';
import 'package:flutter_boilerplate/features/profile/widgets/profile_stats.dart';
import 'package:flutter_boilerplate/features/profile/widgets/wallet_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeader(
                      userName: 'John Doe',
                      onCreditCardPressed: () {
                        // Handle credit card tap
                      },
                      onSettingsPressed: () {
                        // Handle settings tap
                      },
                    ),
                    ProfileStats(
                      profileImageUrl: 'https://i.pravatar.cc/300',
                      followingCount: 360,
                      followersCount: 160000,
                      viewsCount: 0,
                      newViewsCount: 12,
                    ),
                    WalletCard(),
                    FeaturesGrid(),
                    MenuList(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            const CustomBottomNav(),
          ],
        ),
      ),
    );
  }
}
