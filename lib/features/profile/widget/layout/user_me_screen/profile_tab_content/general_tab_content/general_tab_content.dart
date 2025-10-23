import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/user_general/user_general.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/interests_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/gifts_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_tab_content/general_tab_content/supporters_section.dart';

class GeneralTabContent extends StatelessWidget {
  final UserGeneralModel? user;

  const GeneralTabContent({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          InterestsSection(
            interests:
                ['Art', 'Yoga', 'Pet', 'Music', 'Gaming', 'Dancing', 'Reading'],
          ),
          const SizedBox(height: 24),
          const GiftsSection(),
          const SizedBox(height: 24),
          const TopSupporterSection(),
          const SizedBox(height: 24), // Thêm padding bottom
        ],
      ),
    );
  }
}
