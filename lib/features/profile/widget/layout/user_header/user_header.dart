import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/user_general/user_general.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_section/stats_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/bio_row.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/user_header_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_stats_model.dart';

class UserHeader extends StatelessWidget {
  final String crownCount;
  final String diamondCount;
  final String contribution;
  final String distance;
  final String bio;
  final UserGeneralModel? user;

  const UserHeader({
    super.key,
    this.crownCount = "56",
    this.diamondCount = "56", 
    this.contribution = "Contriburion: 1k",
    this.distance = "2.5 Km",
    this.bio = "I am an enthusiastic and curious individual with a passion for technology and creativity.",
    this.user,
  });

  /// Constructor từ UserGeneralModel
  UserHeader.fromUserGeneral({
    super.key,
    required UserGeneralModel? user,
  }) : crownCount = user?.level?.currentLevel?.toString() ?? "0",
       diamondCount = user?.level?.currentExp?.toString() ?? "0",
       contribution = "Contributor: ${user?.level?.currentLevel?.toString() ?? "0"}",
       distance = "2.5 Km",
       bio = user?.bio ?? "No bio available",
       user = user;

  /// Constructor với UserStatsModel (giữ lại để backward compatibility)
  UserHeader.fromModel({
    super.key,
    required UserStatsModel stats,
  }) : crownCount = stats.crownCount,
       diamondCount = stats.diamondCount,
       contribution = stats.contribution,
       distance = stats.distance,
       bio = stats.bio,
       user = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StatsSection(user: user),
        const SizedBox(height: UserHeaderConstants.sectionSpacing),
        StatsRow(
          crownCount: crownCount,
          diamondCount: diamondCount,
          contribution: contribution,
          distance: distance,
        ),
        const SizedBox(height: UserHeaderConstants.sectionSpacing),
        BioRow(bio: bio),
      ],
    );
  }
}
