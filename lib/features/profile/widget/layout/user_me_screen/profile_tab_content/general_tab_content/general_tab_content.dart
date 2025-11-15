import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/interests_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/gifts_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/supporters_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/relationship_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/clan_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/room_section.dart';

class GeneralTabContent extends StatelessWidget {
  final UserModel? user;
  final ScrollController scrollController;
  const GeneralTabContent({
    super.key,
    this.user,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight, // chiếm full height
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            // physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                const RoomSection(),
                const SizedBox(height: 24),
                const ClanSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
