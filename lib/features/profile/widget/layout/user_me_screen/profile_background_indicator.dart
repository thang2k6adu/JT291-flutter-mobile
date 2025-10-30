import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_background.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';

class ProfileBackgroundIndicator extends ConsumerWidget {
  const ProfileBackgroundIndicator({
    super.key,
    this.thickness = 6,
    this.trackColor,
    this.progressColor,
    this.maxWidth = 340,
    this.gap = 8,
  });

  final double thickness;
  final Color? trackColor;
  final Color? progressColor;
  final double maxWidth;
  final double gap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color effectiveTrackColor = trackColor ?? Colors.white24;
    final Color effectiveProgressColor = progressColor ?? Colors.white;
    final currentIndex = ref.watch(profileBackgroundIndexProvider);
    final extent = ref.watch(draggableSheetControllerProvider).currentExtent;

    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    // final double sheetTop = screenHeight * (1 - extent);
    final double bottom = (screenHeight - 60)* extent;
    final double bottomMargin = (bottom + thickness);
    print(bottom);

    return Positioned(
      bottom: bottomMargin,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
      ),
    );
  }
}
