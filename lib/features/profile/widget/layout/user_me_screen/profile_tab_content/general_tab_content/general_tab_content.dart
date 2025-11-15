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
  const GeneralTabContent({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
