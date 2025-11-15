import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/section_card.dart';

class RoomSection extends StatelessWidget {
  final String roomName;
  final String roomImage;
  final String roomType;

  const RoomSection({
    super.key,
    this.roomName = 'Thang',
    required this.roomImage,
    this.roomType = 'Music',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Room',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.gray[8],
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          avatarUrl: roomImage,
          title: roomName,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFA57DF7), Color(0xFFEDA4A4)],
            stops: [0.0, 1.0], // hoặc [0.0, 1.23] nếu muốn chính xác CSS
          ),
          backgroundImage: AppImages.roomBg,
          description: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              roomType,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.gray[8],
              ),
            ),
          ),
          stats: Text(''),
        ),
      ],
    );
  }
}
