import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/profile_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_loading.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_error.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/profile_tab_content.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/sliver_tab_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

/// Main content component cho Profile Screen
class ProfileContent extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final String? userId;
   final DraggableScrollableController sheetController;

  const ProfileContent({
    super.key,
    required this.scrollController,
    this.userId,
    required this.sheetController,
  });

  @override
  ConsumerState<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<ProfileContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Initialize TabController
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileControllerProvider.notifier)
          .initializeTabController(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileData = ref.watch(profileScreenProvider);
    final draggableState = ref.watch(draggableSheetControllerProvider);
    
    // Sử dụng provider phù hợp tùy theo userId
    final userGeneralAsync = widget.userId == null
        ? profileData.userGeneralAsync
        : ref.watch(userProfileByIdProvider(widget.userId));

    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        // User Header
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            ProfileConstants.paddingHorizontal, 
            0, 
            ProfileConstants.paddingHorizontal, 
            0
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              userGeneralAsync.when(
                data: (user) => UserHeader.fromUserGeneral(user: user),
                loading: () => const UserHeaderLoading(),
                error: (error, stack) => UserHeaderError(error: error),
              ),
            ]),
          ),
        ),

        // TabBar as SliverPersistentHeader
        if (profileData.profileState.tabController != null)
          SliverTabBar(
            tabController: profileData.profileState.tabController!,
            padding: _getTabBarPadding(draggableState.currentExtent),
          ),

        // Tab Content
        SliverFillRemaining(
          hasScrollBody: true,
          child: profileData.profileState.tabController != null
              ? ProfileTabContent(
                  tabController: profileData.profileState.tabController!,
                  scrollController: widget.scrollController,
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }

  /// Calculate tab bar padding based on extent (local method)
  EdgeInsets _getTabBarPadding(double currentExtent) {
    // Clamp currentExtent to valid range
    final clampedExtent = currentExtent.clamp(
      ProfileConstants.minChildSize,
      ProfileConstants.maxChildSize,
    );
    
    // Check if extent is above threshold
    if (clampedExtent >= ProfileConstants.paddingThreshold) {
      final extraExtent = clampedExtent - ProfileConstants.paddingThreshold;
      
      // Ensure paddingRange is not zero to avoid division by zero
      if (ProfileConstants.paddingRange <= 0) {
        return EdgeInsets.zero;
      }
      
      // Calculate padding value with bounds checking
      final normalizedExtra = extraExtent / ProfileConstants.paddingRange;
      final paddingValue = (normalizedExtra * ProfileConstants.maxPadding)
          .clamp(0.0, ProfileConstants.maxPadding);
      
      return EdgeInsets.only(top: paddingValue);
    }
    
    return EdgeInsets.zero;
  }
}
