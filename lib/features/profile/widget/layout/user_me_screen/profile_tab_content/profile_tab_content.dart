import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/general_tab_content.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/ports_tab_content/ports_tab_content.dart';

class ProfileTabContent extends ConsumerWidget {
  final TabController tabController;
  
  const ProfileTabContent({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userGeneralAsync = ref.watch(userGeneralProvider);
    
    return userGeneralAsync.when(
      data: (user) => TabBarView(
        controller: tabController,
        children: [
          GeneralTabContent(user: user),
          const PortsTabContent(),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}