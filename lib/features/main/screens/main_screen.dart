import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';
import 'package:jt291_flutter_mobile/features/auth/screens/splash_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_me_screen.dart';

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
      const UserMeScreen(),
    ];

    return asyncAuth.when(
      data: (currentUer) {
        return Scaffold(
          body: children[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: touchBottomNavBar,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0
                      ? AppColors.primary
                      : AppColors.gray[3],
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 1
                      ? AppColors.primary
                      : AppColors.gray[3],
                ),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 2
                      ? AppColors.primary
                      : AppColors.gray[3],
                ),
                label: "Reels",
              ),
              BottomNavigationBarItem(
                icon: currentUer?.avatarUrl != null
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.network(currentUer?.avatarUrl ?? ""),
                      )
                    : Icon(
                        Icons.home,
                        color: selectedIndex == 2
                            ? AppColors.primary
                            : AppColors.gray[3],
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
