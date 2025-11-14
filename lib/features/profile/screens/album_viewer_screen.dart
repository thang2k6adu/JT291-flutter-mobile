import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';

class AlbumViewerScreen extends StatefulWidget {
  const AlbumViewerScreen({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  final List<String> images;
  final int initialIndex;

  @override
  State<AlbumViewerScreen> createState() => _AlbumViewerScreenState();
}

class _AlbumViewerScreenState extends State<AlbumViewerScreen> {
  late int currentIndex;
  final CarouselSliderController carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWithBack(title: 'My Album', backgroundColor: Colors.black, textColor: Colors.white),
      body: Column(
        children: [
          // Main image carousel
          Expanded(
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: widget.images.length,
              itemBuilder: (context, index, realIndex) {
                return InteractiveViewer(
                  minScale: 1.0,
                  maxScale: 4.0,
                  child: Center(
                    child: Image.network(
                      widget.images[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: double.infinity,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                initialPage: widget.initialIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),

          // Thumbnail list at bottom
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                final isSelected = index == currentIndex;
                return GestureDetector(
                  onTap: () {
                    carouselController.animateToPage(index);
                  },
                  child: Container(
                    width: isSelected ? 80 : 80,
                    height: isSelected ? 80 : 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.cover,
                        width: isSelected ? 80 : 80,
                        height: isSelected ? 80 : 80,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Safe area padding for bottom
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
