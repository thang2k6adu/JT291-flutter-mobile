import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/components/helper/image_helper.dart';
import 'package:jt291_flutter_mobile/components/helper/video_helper.dart';
import 'package:video_player/video_player.dart';

class CreatePostBottomSheet extends StatefulWidget {
  const CreatePostBottomSheet({super.key});

  @override
  State<CreatePostBottomSheet> createState() => _CreatePostBottomSheetState();
}

class _CreatePostBottomSheetState extends State<CreatePostBottomSheet> {
  final TextEditingController _textController = TextEditingController();
  final ImageHelper _imageHelper = ImageHelper();
  final VideoHelper _videoHelper = VideoHelper();
  bool _isPublic = true;
  List<XFile> _selectedImages = [];
  List<XFile> _selectedVideos = [];
  List<String> _selectedHashtags = [];

  // Controllers for video players
  Map<int, VideoPlayerController> _videoControllers = {};

  @override
  void dispose() {
    _textController.dispose();
    // Dispose all video controllers
    _videoControllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  // Hàm xử lý chọn ảnh
  Future<void> _pickImages() async {
    try {
      final images = await _imageHelper.pickImages(
        source: ImageSource.gallery,
        multiple: true,
        limit: 10,
        imageQuality: 100,
      );

      if (images.isNotEmpty) {
        setState(() {
          _selectedImages.addAll(images);
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  // Hàm xử lý chọn video
  Future<void> _pickVideo() async {
    try {
      final video = await _videoHelper.pickVideo(
        source: ImageSource.gallery,
        maxDurationSeconds: 300, // 5 phút
      );

      if (video != null) {
        setState(() {
          _selectedVideos.add(video);
        });

        // Initialize video controller for preview
        await _initializeVideoController(_selectedVideos.length - 1, video);
      }
    } catch (e) {
      print('Error picking video: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi khi chọn video: $e')));
    }
  }

  // Initialize video controller
  Future<void> _initializeVideoController(int index, XFile video) async {
    final controller = VideoPlayerController.file(File(video.path));
    try {
      await controller.initialize();
      setState(() {
        _videoControllers[index] = controller;
      });
    } catch (e) {
      print('Error initializing video controller: $e');
    }
  }

  // Hàm xóa ảnh
  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  // Hàm xóa video
  void _removeVideo(int index) {
    // Dispose controller trước khi xóa
    _videoControllers[index]?.dispose();
    _videoControllers.remove(index);

    setState(() {
      _selectedVideos.removeAt(index);

      // Update video controllers indices
      Map<int, VideoPlayerController> newControllers = {};
      _videoControllers.forEach((key, value) {
        if (key > index) {
          newControllers[key - 1] = value;
        } else if (key < index) {
          newControllers[key] = value;
        }
      });
      _videoControllers = newControllers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  'Create a post',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Handle post creation
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar và đường kẻ dọc
                  Column(
                    children: [
                      AvatarWidget(
                        image: AssetImage(AppImages.defaultAvatar),
                        size: 40,
                      ),
                      if (_selectedImages.isNotEmpty ||
                          _selectedVideos.isNotEmpty) ...[
                        SizedBox(height: 8),
                        Container(
                          width: 2,
                          height: 300,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(width: 12),

                  // User name và content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User name
                        Text(
                          'Darlene Bears',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),

                        // Hashtags và TextField content
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Hiển thị hashtags đã chọn
                            if (_selectedHashtags.isNotEmpty)
                              Wrap(
                                spacing: 4,
                                children: _selectedHashtags.map((hashtag) {
                                  return Text(
                                    hashtag + ' ',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  );
                                }).toList(),
                              ),

                            // TextField để nhập content
                            Expanded(
                              child: TextField(
                                controller: _textController,
                                maxLines: null,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "What's new?",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _pickImages,
                              child: _buildMediaButton(AppIcons.galleryPng),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: _pickVideo,
                              child: _buildMediaButton(AppIcons.videoPng),
                            ),
                            SizedBox(width: 16),
                            _buildMediaButton(AppIcons.audioPng),
                          ],
                        ),

                        // Hiển thị ảnh đã chọn
                        if (_selectedImages.isNotEmpty) ...[
                          SizedBox(height: 16),
                          _buildImagesGrid(),
                        ],

                        // Hiển thị video đã chọn
                        if (_selectedVideos.isNotEmpty) ...[
                          SizedBox(height: 16),
                          _buildVideosGrid(),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
            child: Column(
              children: [
                // Hot topics
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTopicChip('# Thêm chủ đề', isPrimary: true),
                      SizedBox(width: 8),
                      _buildTopicChip('# Sayhi2025'),
                      SizedBox(width: 8),
                      _buildTopicChip('# Giao lưu am nhạc'),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                // Privacy setting
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anyone can view your post.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // TODO: Show privacy options
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.public,
                              size: 18,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Public',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaButton(String icon) {
    return Image.asset(
      icon,
      width: 22,
      height: 22,
      color: Colors.grey.shade600,
    );
  }

  // Widget hiển thị grid ảnh (2 cột)
  Widget _buildImagesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: _selectedImages.length,
      itemBuilder: (context, index) => _buildImagePreview(index),
    );
  }

  // Widget hiển thị grid video (2 cột)
  Widget _buildVideosGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: _selectedVideos.length,
      itemBuilder: (context, index) => _buildVideoPreview(index),
    );
  }

  // Widget hiển thị preview ảnh với nút xóa
  Widget _buildImagePreview(int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(File(_selectedImages[index].path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => _removeImage(index),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  // Widget hiển thị preview video với nút xóa
  // Widget hiển thị preview video với nút xóa
  // Widget hiển thị preview video với nút xóa
Widget _buildVideoPreview(int index) {
  final controller = _videoControllers[index];

  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: GestureDetector(
      onTap: () {
        if (controller != null && controller.value.isInitialized) {
          setState(() {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          });
        }
      },
      child: Stack(
        children: [
          // Video Container
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: controller != null && controller.value.isInitialized
                ? Center(
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
          ),

          // Play/Pause icon overlay (chỉ hiện khi pause)
          if (controller != null &&
              controller.value.isInitialized &&
              !controller.value.isPlaying)
            Positioned. fill(
              child: Center(
                child: Container(
                  padding: EdgeInsets. all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),

          // Delete button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeVideo(index),
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 18),
              ),
            ),
          ),

          // Video duratio
        ],
      ),
    ),
  );
}

  // Format duration to mm:ss
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Widget _buildTopicChip(
    String label, {
    bool isPrimary = false,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: isPrimary
          ? () async {
              // TODO: Navigate to add hashtag screen and get result
              // Example: final result = await pushScreen(context, RouteConstants.addHastag);
              // if (result != null) {
              //   setState(() {
              //     _selectedHashtags.add(result);
              //   });
              // }
              pushScreen(context, RouteConstants.addHastag);
            }
          : onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isPrimary ? Color(0xFFFFE4E9) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isPrimary ? Color(0xFFE56C8C) : Colors.grey.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isPrimary) ...[
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                size: 8,
                color: AppColors.primary,
                weight: 600,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
