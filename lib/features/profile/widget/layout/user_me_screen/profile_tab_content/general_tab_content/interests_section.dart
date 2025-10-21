import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/pill_tag.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';

class InterestsSection extends StatelessWidget {
  final List<String> interests;

  InterestsSection({super.key, required this.interests}) {
    print(interests);
  }

  @override
  Widget build(BuildContext context) {
    // Làm cho Column có crossAxis chiếm hết chiều rộng của cha
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Interests',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.gray[8],
          ),
        ),
        const SizedBox(height: 12),
        InterestsList(interests: interests),
      ],
    );
  }
}

class InterestsList extends StatelessWidget {
  final List<String> interests;

  const InterestsList({super.key, required this.interests});

  @override
  Widget build(BuildContext context) {
    if (interests.isEmpty) {
      return Text(
        'No interests added yet',
        style: TextStyle(color: AppColors.gray[5], fontStyle: FontStyle.italic),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: interests
          .map(
            (interest) => PillTag(
              label: interest,
              thumbnail: _getIconForInterest(interest),
              backgroundColor: AppColors.gray[1],
            ),
          )
          .toList(),
    );
  }

  Widget _getIconForInterest(String interest) {
    switch (interest.toLowerCase()) {
      case 'art':
        return SvgPicture.asset(AppIcons.art);
      case 'painting':
        return SvgIconSimple.asset(AppIcons.paint);
      case 'yoga':
        return SvgPicture.asset(AppIcons.yoga);
      case 'pet':
        return SvgPicture.asset(AppIcons.pet);
      case 'animals':
        return SvgPicture.asset(AppIcons.pet);
      case 'music':
        return SvgPicture.asset(AppIcons.music);
      case 'gaming':
        return SvgPicture.asset(AppIcons.game);
      case 'dancing':
        return SvgPicture.asset(AppIcons.dance);
      default:
        return SvgPicture.asset(AppIcons.art);
    }
  }
}

class InterestPillTag extends StatelessWidget {
  final String label;
  final IconData icon;

  const InterestPillTag({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return PillTag(
      thumbnail: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
      label: label,
      backgroundColor: AppColors.gray[1],
      borderColor: AppColors.gray[3],
      textStyle: TextStyle(color: AppColors.gray[7]),
    );
  }
}
