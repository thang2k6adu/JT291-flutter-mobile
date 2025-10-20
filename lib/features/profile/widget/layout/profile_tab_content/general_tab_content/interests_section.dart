import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/pill_tag.dart';

class InterestsSection extends StatelessWidget {
  final List<String> interests;
  
  const InterestsSection({super.key, required this.interests});

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
        style: TextStyle(
          color: AppColors.gray[5],
          fontStyle: FontStyle.italic,
        ),
      );
    }
    
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: interests.map((interest) => InterestPillTag(
        label: interest,
        icon: _getIconForInterest(interest),
      )).toList(),
    );
  }
  
  IconData _getIconForInterest(String interest) {
    switch (interest.toLowerCase()) {
      case 'art':
      case 'painting':
        return Icons.palette;
      case 'yoga':
      case 'fitness':
        return Icons.self_improvement;
      case 'pet':
      case 'animals':
        return Icons.pets;
      case 'music':
        return Icons.music_note;
      case 'gaming':
        return Icons.sports_esports;
      case 'dancing':
        return Icons.music_note;
      case 'reading':
        return Icons.book;
      case 'cooking':
        return Icons.restaurant;
      case 'travel':
        return Icons.travel_explore;
      case 'photography':
        return Icons.camera_alt;
      default:
        return Icons.favorite;
    }
  }
  
}

class InterestPillTag extends StatelessWidget {
  final String label;
  final IconData icon;

  const InterestPillTag({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return PillTag(
      thumbnail: Container(
        decoration: BoxDecoration(
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