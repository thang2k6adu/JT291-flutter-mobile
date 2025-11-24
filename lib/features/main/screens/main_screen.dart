import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';
import 'package:jt291_flutter_mobile/features/auth/screens/splash_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/profile_screen.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/features/social_feed/screens/feed_screen.dart';


class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int selectedIndex = 0;

  void touchBottomNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncAuth = ref.watch(userAuthProvider);
    final List<Widget> children = [
      const SplashScreen(title: "Home"),
      const SplashScreen(title: "Messages"),
      const SplashScreen(title: "Reels"),
      const FeedScreen(),
      ProfileScreen(),
    ];

    return asyncAuth.when(
      data: (currentUser) {
        return Scaffold(
          body: children[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: touchBottomNavBar,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 8,
            items: [
              // Home icon
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.homePng,
                  width: 28,
                  height: 28,
                  color: selectedIndex == 0
                      ? AppColors.primary
                      : AppColors.black,
                ),
                label: "Home",
              ),
              // Grid/Apps icon
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.menuPng,
                  width: 28,
                  height: 28,
                  color: selectedIndex == 1 ? AppColors.primary : AppColors.black,
                ),
                label: "Messages",
              ),
              // Messages/Chat icon
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.messagePng,
                  width: 28,
                  height: 28,
                  color: selectedIndex == 2 ? AppColors.primary : AppColors.black,
                ),
                label: "Reels",
              ),
              // Globe/Explore icon
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.networkPng,
                  width: 28,
                  height: 28,
                  color: selectedIndex == 3 ? AppColors.primary : AppColors.black,
                ),
                label: "Explore",
              ),
              // Profile avatar
              BottomNavigationBarItem(
                icon: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: currentUser?.avatar != null
                        ? Image.network(
                            currentUser?.avatar ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.account_circle,
                                color: selectedIndex == 4
                                    ? AppColors.primary
                                    : AppColors.gray[3],
                                size: 28,
                              );
                            },
                          )
                        : Icon(
                            Icons.account_circle,
                            color: selectedIndex == 4
                                ? AppColors.primary
                                : AppColors.gray[3],
                            size: 28,
                          ),
                  ),
                ),
                label: "Me",
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text("Error Main Screen")),
      loading: () => Center(child: Text("Reading Main Screen")),
    );
  }
}
