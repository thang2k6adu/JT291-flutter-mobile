import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Reusable album widget for displaying images in a horizontal row with an optional "add" tile.
///
/// Features:
/// - Displays a list of images with thumbnails.
/// - Shows an "add" button if the number of images is less than [maxCount].
/// - Customizable item size, border radius, padding, and title style.
/// - Handles image tap callbacks and "add" action callbacks.
/// - Supports web/desktop pointer cursor.
///
/// Parameters:
/// - [images]: List of image URLs to display in the album.
/// - [maxCount]: Maximum number of images allowed (default 6).
/// - [onAdd]: Callback when the "add" tile is tapped.
/// - [onImageTap]: Callback when an image thumbnail is tapped, receives the index of the image.
/// - [visibleCount]: Number of image thumbnails to show before the "add" tile (default 3).
/// - [itemSize]: Size of each image/add tile (default 72.0).
/// - [borderRadius]: Border radius of each tile (default 8.0).
/// - [padding]: Padding around the album (default `EdgeInsets.symmetric(vertical: 16, horizontal: 12)`).
/// - [titleStyle]: Custom text style for the album title.
///
/// Example usage:
/// ```dart
/// AlbumWidget(
///   images: [
///     "https://example.com/image1.jpg",
///     "https://example.com/image2.jpg",
///   ],
///   maxCount: 6,
///   visibleCount: 4,
///   itemSize: 80,
///   borderRadius: 12,
///   onAdd: () {
///     print("Add image tapped");
///   },
///   onImageTap: (index) {
///     print("Tapped image $index");
///   },
/// )
/// ```
class AlbumWidget extends StatelessWidget {
  final List<String> images;
  final int maxCount;
  final VoidCallback? onAdd;
  final void Function(int index)? onImageTap;
  final int visibleCount;
  final double itemSize;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? titleStyle;

  const AlbumWidget({
    Key? key,
    required this.images,
    this.maxCount = 6,
    this.onAdd,
    this.onImageTap,
    this.visibleCount = 3,
    this.itemSize = 72.0,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shownImages = images.take(visibleCount).toList();
    final remainingSlots = maxCount - images.length;
    final showAdd = remainingSlots > 0;

    return 
    // Thêm container cho album
    Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My album (${images.length}/$maxCount)',
            style: titleStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 19,
            runSpacing: 19,
            children: [
              for (var i = 0; i < shownImages.length; i++) ...[
                _buildImageTile(context, shownImages[i], i),
              ],
              if (showAdd) _buildAddTile(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageTile(BuildContext context, String url, int index) {
    final tile = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: itemSize,
        height: itemSize,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _placeholder(),
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;
            return Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          (progress.expectedTotalBytes ?? 1)
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );

    final clickable = InkWell(
      onTap: () => onImageTap?.call(index),
      borderRadius: BorderRadius.circular(borderRadius),
      child: tile,
    );

    return kIsWeb
        ? MouseRegion(cursor: SystemMouseCursors.click, child: clickable)
        : clickable;
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(Icons.image, color: Colors.white70, size: 28),
      ),
    );
  }

  Widget _buildAddTile(BuildContext context) {
    final addContent = Container(
      width: itemSize,
      height: itemSize,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.add,
          size: 32,
          color: Colors.black54,
        ),
      ),
    );

    final clickable = InkWell(
      onTap: onAdd,
      borderRadius: BorderRadius.circular(borderRadius),
      child: addContent,
    );

    return kIsWeb
        ? MouseRegion(cursor: SystemMouseCursors.click, child: clickable)
        : clickable;
  }
}
