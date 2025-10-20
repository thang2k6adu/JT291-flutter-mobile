import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_tab_content/general_tab_content/general_tab_content.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_tab_content/ports_tab_content/ports_tab_content.dart';

class ProfileTabContent extends ConsumerStatefulWidget {
  const ProfileTabContent({super.key});

  @override
  ConsumerState<ProfileTabContent> createState() => _ProfileTabContentState();
}

class _ProfileTabContentState extends ConsumerState<ProfileTabContent>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userGeneralAsync = ref.watch(userGeneralProvider);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: AppColors.pink[6],
          indicatorWeight: 2,
          labelColor: AppColors.pink[6],
          unselectedLabelColor: AppColors.gray[5],
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'General'),
            Tab(text: 'Ports'),
          ],
        ),
        userGeneralAsync.when(
          data: (user) => _buildTabContent(user),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }

  Widget _buildTabContent(user) {
    if (_selectedTabIndex == 0) {
      return GeneralTabContent(user: user);
    } else {
      return const PortsTabContent();
    }
  }
}