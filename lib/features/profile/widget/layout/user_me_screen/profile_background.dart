import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Positioned.fill(
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
        },
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: double.infinity,
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
