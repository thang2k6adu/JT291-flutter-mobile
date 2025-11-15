import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class RelationshipSection extends StatelessWidget {
  const RelationshipSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Relationship',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.gray[8],
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: Implement follow action
              },
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159), // 180 độ theo trục Y
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.gray[5],
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const SupportersList(),
      ],
    );
  }
}

class SupportersList extends StatelessWidget {
  const SupportersList({super.key});

  @override
  Widget build(BuildContext context) {
    final supporters = [
      {
        'name': 'User 1',
        'score': '1200',
        'color': AppColors.blue[4],
        'level': 1,
        'badge_type': 'badge1',
        'fighter_type': 'fighter_octopus',
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 2',
        'score': '1000',
        'color': AppColors.pink[4],
        'level': 2,
        'badge_type': 'badge2',
        'fighter_type': 'fighter_turtle',
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 3',
        'score': '900',
        'color': AppColors.green[4],
        'level': 3,
        'badge_type': 'badge3',
        'fighter_type': 'fighter_ship',
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 4',
        'score': '840',
        'color': AppColors.orange[4],
        'level': 4,
        'badge_type': 'badge4',
        'fighter_type': 'fighter_octopus',
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
    ];

    return Row(
      children: [
        for (var i = 0; i < supporters.length; i++) ...[
          Flexible(
            child: RelationshipItem(
              name: supporters[i]['name'] as String,
              score: supporters[i]['score'] as String,
              color: supporters[i]['color'] as Color,
              avatarUrl: supporters[i]['avatarUrl'] as String,
              level: supporters[i]['level'] as int,
              badgeType: supporters[i]['badge_type'] as String,
              fighterType: supporters[i]['fighter_type'] as String,
            ),
          ),
          if (i != supporters.length - 1)
            const SizedBox(width: 8), // khoảng cách giữa các item
        ],
      ],
    );
  }
}

class RelationshipItem extends StatelessWidget {
  final String name;
  final String score;
  final Color color;
  final String avatarUrl;
  final int level;
  final String badgeType;
  final String fighterType;

  const RelationshipItem({
    super.key,
    required this.name,
    required this.score,
    required this.color,
    required this.avatarUrl,
    required this.level,
    required this.badgeType,
    required this.fighterType,
  });

  String getBadgeImage(String badgeType) {
    switch (badgeType) {
      case 'badge1':
        return AppIcons.badge1Png;
      case 'badge2':
        return AppIcons.badge2Png;
      case 'badge3':
        return AppIcons.badge3Png;
      case 'badge4':
        return AppIcons.badge4Png;
      default:
        return AppIcons.badge1Png;
    }
  }

  String getFighterImage(String fighterType) {
    switch (fighterType) {
      case 'fighter_ship':
        return AppIcons.fighterShipPng;
      case 'fighter_turtle':
        return AppIcons.fighterTurtlePng;
      default:
        return AppIcons.fighterOctopusPng;
    }
  }

  getLinerGradientAndColor(String badgeType) {
    switch (badgeType) {
      case 'badge1':
        return {
          'linerGradient': [Color(0xFFFFE9B3), Color(0xFFF36C18)],
          'color': Color(0xFFF3904D),
        };
      case 'badge2':
        return {
          'linerGradient': [Color(0xFFF0E3FF), Color(0xFF654DFC)],
          'color': Color(0xFF654DFC),
        };
      case 'badge3':
        return {
          'linerGradient': [Color(0xFFFED794), Color(0xFFF70924)],
          'color': Color(0xFFFA6C5A),
        };
      default:
        return {
          'linerGradient': [Color(0xFF36E68C), Color(0xFF097446)],
          'color': Color(0xFF50A775),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: getLinerGradientAndColor(badgeType)['linerGradient'] as List<Color>,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(AppIcons.relationshipBgPng),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: getLinerGradientAndColor(badgeType)['color'] as Color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(getBadgeImage(badgeType), width: 18, height: 18),
                Text(
                  ' LV$level',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(getFighterImage(fighterType), width: 48, height: 48),
          AvatarWidget(
            image: NetworkImage(avatarUrl),
            size: 34,
            showGlow: false,
            borderWidth: 0,
          ),
        ],
      ),
    );
  }
}
