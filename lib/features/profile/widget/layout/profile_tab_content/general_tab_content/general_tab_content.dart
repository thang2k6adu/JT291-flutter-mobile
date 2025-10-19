import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_tab_content/general_tab_content/interests_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_tab_content/general_tab_content/gifts_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/profile_tab_content/general_tab_content/supporters_section.dart';

class GeneralTabContent extends StatelessWidget {
  const GeneralTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 24),
        InterestsSection(),
        SizedBox(height: 24),
        GiftsSection(),
        SizedBox(height: 24),
        TopSupporterSection(),
      ],
    );
  }
}