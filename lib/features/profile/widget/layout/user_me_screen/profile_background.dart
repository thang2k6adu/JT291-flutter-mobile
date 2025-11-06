import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';

final profileBackgroundIndexProvider = StateProvider<double>((ref) => 0.0);

class ProfileBackground extends ConsumerWidget {
  const ProfileBackground({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the progress indicator when the widget is built
    // Add post frame callback (Hàm nhận vào tham số là thời gian app bắt đầu chạy)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initProgress = (initialIndex + 1) / images.length;
      if (ref.read(profileBackgroundIndexProvider) != initProgress) {
        ref.read(profileBackgroundIndexProvider.notifier).state = initProgress;
      }
    });

    final extent = ref.watch(draggableSheetControllerProvider).currentExtent;
    final screenHeight = MediaQuery.of(context).size.height;
    final double sheetTop = screenHeight * (1 - extent);
    final double backgroundHeight = sheetTop.clamp(0.0, screenHeight);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: backgroundHeight*1.2,
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: backgroundHeight,
          );
        },
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: backgroundHeight,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOut,
          onPageChanged: (index, reason) {
            ref.read(profileBackgroundIndexProvider.notifier).state =
                (index + 1) / images.length;
          },
          initialPage: initialIndex,
        ),
      ),
    );
  }
}
