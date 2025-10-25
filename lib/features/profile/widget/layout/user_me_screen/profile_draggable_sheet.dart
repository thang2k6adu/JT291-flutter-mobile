import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/draggable_sheet.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/profile_content.dart';

/// Draggable Sheet component cho Profile Screen
class ProfileDraggableSheet extends ConsumerWidget {
  const ProfileDraggableSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draggableState = ref.watch(draggableSheetControllerProvider);
    final draggableController = ref.read(draggableSheetControllerProvider.notifier);

    return ReusableDraggableSheet(
      controller: draggableState.draggableController,
      initialChildSize: ProfileConstants.initialChildSize,
      minChildSize: ProfileConstants.minChildSize,
      maxChildSize: ProfileConstants.maxChildSize,
      onExtentChanged: (extent) {
        draggableController.updateExtent(extent);
      },
      builder: (context, scrollController) {
        return ProfileContent(
          scrollController: scrollController,
        );
      },
    );
  }
}
