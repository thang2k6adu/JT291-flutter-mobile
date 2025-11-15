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
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 2',
        'score': '1000',
        'color': AppColors.pink[4],
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 3',
        'score': '900',
        'color': AppColors.green[4],
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 4',
        'score': '840',
        'color': AppColors.orange[4],
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 4',
        'score': '840',
        'color': AppColors.orange[4],
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
      {
        'name': 'User 4',
        'score': '840',
        'color': AppColors.orange[4],
        'avatarUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8JqnYLE6v_KgmejXbu0xk89bpHimSq7WyUQ&s',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < supporters.length; i++) ...[
            RelationshipItem(
              name: supporters[i]['name'] as String,
              score: supporters[i]['score'] as String,
              color: supporters[i]['color'] as Color,
              avatarUrl: supporters[i]['avatarUrl'] as String,
            ),
            if (i != supporters.length - 1)
              const SizedBox(width: 8), // khoảng cách giữa các item
          ],
        ],
      ),
    );
  }
}

class RelationshipItem extends StatelessWidget {
  final String name;
  final String score;
  final Color color;
  final String avatarUrl;

  const RelationshipItem({
    super.key,
    required this.name,
    required this.score,
    required this.color,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          AvatarWidget(
            image: NetworkImage(avatarUrl),
            size: 48,
            showGlow: false,
            borderWidth: 0,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppIcons.diamondPng, width: 15, height: 15),
              const SizedBox(width: 2),
              Text(
                score,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray[7],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
