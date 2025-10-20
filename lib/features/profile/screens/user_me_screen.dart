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
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/app_bar/app_bar.dart';

class UserMeScreen extends ConsumerStatefulWidget {
  const UserMeScreen({super.key});

  @override
  ConsumerState<UserMeScreen> createState() => _UserMeScreenState();
}

class _UserMeScreenState extends ConsumerState<UserMeScreen> {
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

          // Draggable Sheet với data
          ReusableDraggableSheet(
            initialChildSize: 0.87,
            minChildSize: 0.12,
            maxChildSize: 0.87,
            builder: (context, scrollController) {
              return ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                children: [
                  // UserHeader với data thực
                  userGeneralAsync.when(
                    data: (user) => UserHeader.fromUserGeneral(user: user),
                    loading: () => const UserHeaderLoading(),
                    error: (error, stack) => UserHeaderError(error: error),
                  ),
                  const ProfileTabContent(),
                ],
              );
            },
          ),
          CustomTopBar(),
        ],
      ),
    );
  }
}
