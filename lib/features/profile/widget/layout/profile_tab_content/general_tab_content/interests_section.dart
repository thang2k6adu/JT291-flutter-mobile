import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/pill_tag.dart';

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const InterestsList(),
      ],
    );
  }
}

class InterestsList extends StatelessWidget {
  const InterestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        InterestPillTag(
          label: 'Art',
          icon: Icons.palette,
          gradientColors: [AppColors.purple[4], AppColors.pink[4]],
        ),
        InterestPillTag(
          label: 'Yoga',
          icon: Icons.self_improvement,
          gradientColors: [AppColors.green[4], AppColors.emerald[4]],
        ),
        InterestPillTag(
          label: 'Pet',
          icon: Icons.pets,
          gradientColors: [AppColors.orange[4], AppColors.amber[4]],
        ),
        InterestPillTag(
          label: 'Music',
          icon: Icons.music_note,
          gradientColors: [AppColors.blue[4], AppColors.indigo[4]],
        ),
        InterestPillTag(
          label: 'Gaming',
          icon: Icons.sports_esports,
          gradientColors: [AppColors.purple[4], AppColors.violet[4]],
        ),
        InterestPillTag(
          label: 'Dancing',
          icon: Icons.music_note,
          gradientColors: [AppColors.pink[4], AppColors.rose[4]],
        ),
        InterestPillTag(
          label: 'Painting',
          icon: Icons.brush,
          gradientColors: [AppColors.teal[4], AppColors.cyan[4]],
        ),
      ],
    );
  }
}

class InterestPillTag extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<Color> gradientColors;

  const InterestPillTag({
    super.key,
    required this.label,
    required this.icon,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return PillTag(
      thumbnail: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
      label: label,
      backgroundColor: AppColors.gray[1],
      borderColor: AppColors.gray[3],
      textStyle: TextStyle(color: AppColors.gray[7]),
    );
  }
}