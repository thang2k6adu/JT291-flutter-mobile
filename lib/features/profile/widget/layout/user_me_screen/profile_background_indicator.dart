import 'package:flutter/material.dart';

class ProfileBackgroundIndicator extends StatelessWidget {
  const ProfileBackgroundIndicator({
    super.key,
    this.value,
    this.thickness = 6,
    this.trackColor,
    this.progressColor,
    this.maxWidth = 340,
  });

  final double? value; // 0..1 for determinate; null for indeterminate
  final double thickness;
  final Color? trackColor;
  final Color? progressColor;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final Color effectiveTrackColor = trackColor ?? Colors.white24;
    final Color effectiveProgressColor = progressColor ?? Colors.white;

    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: SizedBox(
              height: thickness,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: thickness,
                  backgroundColor: effectiveTrackColor,
                  color: effectiveProgressColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


