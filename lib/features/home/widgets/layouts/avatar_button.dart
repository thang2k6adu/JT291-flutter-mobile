import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final double size;
  final double borderRadius;
  final double borderWidth;

  const AvatarButton({
    super.key,
    required this.imagePath,
    this.onTap,
    this.size = 44,
    this.borderRadius = 16,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: borderWidth),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
