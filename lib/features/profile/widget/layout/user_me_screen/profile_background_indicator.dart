import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background.dart';

class ProfileBackgroundIndicator extends ConsumerWidget {
  const ProfileBackgroundIndicator({
    super.key,
    this.thickness = 6,
    this.trackColor,
    this.progressColor,
    this.maxWidth = 340,
  });

  final double thickness;
  final Color? trackColor;
  final Color? progressColor;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color effectiveTrackColor = trackColor ?? Colors.white24;
    final Color effectiveProgressColor = progressColor ?? Colors.white;
    final currentIndex = ref.watch(profileBackgroundIndexProvider);

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
                  value: currentIndex,
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
