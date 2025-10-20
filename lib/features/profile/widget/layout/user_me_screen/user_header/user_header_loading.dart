import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_section/stats_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/stats_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/bio_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_constants.dart';

class UserHeaderLoading extends StatelessWidget {
  const UserHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const StatsSection(),
        const SizedBox(height: UserHeaderConstants.sectionSpacing),
        StatsRow(
          crownCount: "---",
          diamondCount: "---", 
          contribution: "Loading...",
          distance: "---",
        ),
        const SizedBox(height: UserHeaderConstants.sectionSpacing),
        const BioRow(bio: "Loading bio..."),
      ],
    );
  }
}
