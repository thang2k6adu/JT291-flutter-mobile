import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/media_image_item.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/media_video_item.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/media_audio_item.dart';

class PostMediaCarousel extends StatefulWidget {
  final List<PostMediaModel> mediaList;

  const PostMediaCarousel({
    Key? key,
    required this.mediaList,
  }) : super(key: key);

  @override
  State<PostMediaCarousel> createState() => _PostMediaCarouselState();
}

class _PostMediaCarouselState extends State<PostMediaCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.mediaList.isEmpty) return SizedBox.shrink();

    // Check if all media are audio - display differently
    final hasOnlyAudio = widget.mediaList.every((m) => m.type == MediaType.audio);
    
    if (hasOnlyAudio) {
      // Display audio inline without carousel
      return Column(
        children: widget.mediaList.map((media) => MediaAudioItem(media: media)).toList(),
      );
    }
    
    // Filter out audio from carousel and display separately
    final visualMedia = widget.mediaList.where((m) => m.type != MediaType.audio).toList();
    final audioMedia = widget.mediaList.where((m) => m.type == MediaType.audio).toList();

    return Column(
      children: [
        // Display visual media in carousel
        if (visualMedia.isNotEmpty)
          Stack(
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: visualMedia.length,
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 0.6,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  enlargeFactor: 0.15,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  final media = visualMedia[index];
                  return _buildMediaItem(media);
                },
              ),
              // Indicator dots nếu có nhiều media
              if (visualMedia.length > 1)
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      visualMedia.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        SizedBox(height: 16),
        // Display audio inline below carousel
        if (audioMedia.isNotEmpty)
          Column(
            children: audioMedia.map((media) => MediaAudioItem(media: media)).toList(),
          ),
      ],
    );
  }

  Widget _buildMediaItem(PostMediaModel media) {
    switch (media.type) {
      case MediaType.image:
        return MediaImageItem(media: media);
      case MediaType.video:
        return MediaVideoItem(media: media);
      case MediaType.audio:
        return MediaAudioItem(media: media);
    }
  }
}

