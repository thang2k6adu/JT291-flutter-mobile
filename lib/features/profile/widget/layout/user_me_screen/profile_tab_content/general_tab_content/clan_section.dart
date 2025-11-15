import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/section_card.dart';

class ClanSection extends StatelessWidget {
  final String clanName;
  final String clanImage;
  final String clanDescription;
  final int clanMembersNumber;

  const ClanSection({
    super.key,
    required this.clanName,
    required this.clanImage,
    this.clanDescription =
        "Clans are a way to connect with like minded individua, build relationships, and create a sense of belonging. A clan typically includes a name, a description of its purpose, and a list of members united by a common bond.",
    this.clanMembersNumber = 42,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Clan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.gray[8],
          ),
        ),
        const SizedBox(height: 8),
        SectionCard(
          avatarUrl: clanImage,
          title: clanName,
          backgroundImage: AppImages.clanBg,
          gradient: LinearGradient(
            begin: Alignment(-0.1, -1), // gần với 84.5 độ
            end: Alignment(1, 0.1),
            colors: [
              Color(0xFFFFB044), // 0.62%
              Color(0xFFEFA9DF), // 35.25%
              Color(0xFFD7AAFF), // 67.44%
              Color(0xFFA19BFE), // 98.18%
            ],
            stops: [0.0062, 0.3525, 0.6744, 0.9818],
          ),
          description: Text(
            clanDescription,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          stats: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '$clanMembersNumber/50',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                height: 1,
                fontWeight: FontWeight.w600,
                color: AppColors.gray[8],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
