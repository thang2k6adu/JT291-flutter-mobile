import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';

class TopSupporterSection extends StatelessWidget {
  const TopSupporterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Supporter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.gray[8],
          ),
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
      {'name': 'User 1', 'score': '1200', 'color': AppColors.blue[4]!},
      {'name': 'User 2', 'score': '1000', 'color': AppColors.pink[4]!},
      {'name': 'User 3', 'score': '900', 'color': AppColors.green[4]!},
      {'name': 'User 4', 'score': '840', 'color': AppColors.orange[4]!},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: supporters.length,
        itemBuilder: (context, index) {
          return SupporterItem(
            name: supporters[index]['name'] as String,
            score: supporters[index]['score'] as String,
            color: supporters[index]['color'] as Color,
          );
        },
      ),
    );
  }
}

class SupporterItem extends StatelessWidget {
  final String name;
  final String score;
  final Color color;

  const SupporterItem({
    Key? key,
    required this.name,
    required this.score,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
              ),
            ),
            child: Center(
              child: Text(
                name.split(' ').last,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.monetization_on, color: AppColors.amber[6], size: 12),
              const SizedBox(width: 2),
              Text(
                score,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
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