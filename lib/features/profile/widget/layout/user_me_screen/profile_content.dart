import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/profile_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_loading.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_error.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/sliver_tab_bar.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/interests_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/gifts_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/supporters_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/relationship_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/clan_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/room_section.dart';

/// Main content component cho Profile Screen
class ProfileContent extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final String? userId;

  const ProfileContent({
    super.key,
    required this.scrollController,
    this.userId,
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
      ref
          .read(profileControllerProvider.notifier)
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
            0,
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

        // Tab Content - Render directly as sliver items
        if (profileData.profileState.tabController != null)
          _buildTabContentSliver(
            profileData.profileState.tabController!,
            ref.watch(userGeneralProvider),
          )
        else
          const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
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

  /// Build tab content as sliver based on current tab
  Widget _buildTabContentSliver(
    TabController tabController,
    AsyncValue userAsync,
  ) {
    // Rebuild UI khi 1 controller thay đổi giá trị
    return AnimatedBuilder(
      animation: tabController,
      builder: (context, child) {
        final currentIndex = tabController.index;

        return userAsync.when(
          data: (user) {
            if (currentIndex == 0) {
              // General Tab
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 24),
                    InterestsSection(
                      interests: [
                        'Art',
                        'Yoga',
                        'Pet',
                        'Music',
                        'Gaming',
                        'Dancing',
                        'Reading',
                      ],
                    ),
                    const SizedBox(height: 24),
                    const GiftsSection(),
                    const SizedBox(height: 24),
                    const TopSupporterSection(),
                    const SizedBox(height: 24),
                    const RelationshipSection(),
                    const SizedBox(height: 24),
                    const RoomSection(
                      roomImage:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
                    ),
                    const SizedBox(height: 24),
                    const ClanSection(
                      clanName: 'Thang',
                      clanImage:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
                    ),
                    const SizedBox(height: 24),
                  ]),
                ),
              );
            } else {
              // Ports Tab
              return const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Ports Tab Content',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }
          },
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) =>
              SliverToBoxAdapter(child: Center(child: Text('Error: $error'))),
        );
      },
    );
  }
}
