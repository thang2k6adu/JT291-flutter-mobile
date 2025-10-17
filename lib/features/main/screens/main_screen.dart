import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';
import 'package:jt291_flutter_mobile/features/auth/screens/splash_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
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
      SplashScreen(title: "Home"),
      SplashScreen(title: "Messages"),
      SplashScreen(title: "Reels"),
      SplashScreen(title: "Me"),
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
                icon: currentUer?.partner?.thumbnail != null
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.network(
                          currentUer?.partner?.thumbnail ?? "",
                        ),
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
