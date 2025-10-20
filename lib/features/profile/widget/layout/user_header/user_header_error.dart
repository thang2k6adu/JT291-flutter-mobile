import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_section/stats_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/bio_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/user_header_constants.dart';

class UserHeaderError extends StatelessWidget {
  final Object error;
  
  const UserHeaderError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const StatsSection(),
        const SizedBox(height: UserHeaderConstants.sectionSpacing),
        StatsRow(
          crownCount: "0",
          diamondCount: "0",
          contribution: "Error loading data",
          distance: "0 Km",
        ),
        const SizedBox(height: UserHeaderConstants.sectionSpacing),
        BioRow(bio: "Error: ${error.toString()}"),
      ],
    );
  }
}
