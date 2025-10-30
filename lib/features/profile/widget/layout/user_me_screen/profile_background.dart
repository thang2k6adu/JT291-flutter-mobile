import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// Background component cho Profile Screen
class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final images = <String>[
      'lib/assets/images/demo1.jpg',
      'lib/assets/images/demo2.jpg',
      'lib/assets/images/demo3.jpg',
    ];

    return Positioned.fill(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: double.infinity,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOut,
        ),
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
        },
      ),
    );
  }
}
