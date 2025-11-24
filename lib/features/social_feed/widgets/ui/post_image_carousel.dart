import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostImagesCarousel extends StatefulWidget {
  final List<String> images;
  final bool hasAttachment;

  const PostImagesCarousel({
    Key? key,
    required this.images,
    this.hasAttachment = false,
  }) : super(key: key);

  @override
  State<PostImagesCarousel> createState() => _PostImagesCarouselState();
}

class _PostImagesCarouselState extends State<PostImagesCarousel> {
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.images.length,
          options: CarouselOptions(
            height: 300,
            viewportFraction: 0.6,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            enlargeFactor: 0.15,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildImageItem(widget.images[index]);
          },
        ),
      ],
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Color(0xFFFF69B4),
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                );
              },
            ),
            // Attachment button can be added here if needed
          ],
        ),
      ),
    );
  }
}