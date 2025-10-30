import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileBackgroundIndexProvider = StateProvider<double>((ref) => 0.0);

class ProfileBackground extends ConsumerWidget {
  const ProfileBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = <String>[
      'lib/assets/images/demo1.jpg',
      'lib/assets/images/demo2.jpg',
      'lib/assets/images/demo3.jpg',
    ];

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
            ref.read(profileBackgroundIndexProvider.notifier).state = (index + 1) / images.length;
            print(ref.read(profileBackgroundIndexProvider.notifier).state);
          },
        ),
      ),
    );
  }
}
