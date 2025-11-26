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
import 'package:audioplayers/audioplayers.dart';
import 'audio_recorder_bottom_sheet.dart';

class CreatePostBottomSheet extends StatefulWidget {
  const CreatePostBottomSheet({super. key});

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
  List<Map<String, dynamic>> _selectedAudios = [];

  // Controllers for video players
  Map<int, VideoPlayerController> _videoControllers = {};
  
  // Controllers for audio players
  Map<int, AudioPlayer> _audioPlayers = {};

  @override
  void dispose() {
    _textController.dispose();
    // Dispose all video controllers
    _videoControllers.forEach((key, controller) {
      controller.dispose();
    });
    // Dispose all audio players
    _audioPlayers.forEach((key, player) {
      player.dispose();
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
          _selectedImages. addAll(images);
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
        source: ImageSource. gallery,
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi chọn video: $e')),
      );
    }
  }

  // Hàm hiển thị audio recorder
  Future<void> _showAudioRecorder() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AudioRecorderBottomSheet(),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _selectedAudios.add(result);
      });
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

  // Hàm xóa audio
  void _removeAudio(int index) {
    // Dispose audio player trước khi xóa
    _audioPlayers[index]?.dispose();
    _audioPlayers.remove(index);
    
    setState(() {
      _selectedAudios.removeAt(index);
      
      // Update audio players indices
      Map<int, AudioPlayer> newPlayers = {};
      _audioPlayers.forEach((key, value) {
        if (key > index) {
          newPlayers[key - 1] = value;
        } else if (key < index) {
          newPlayers[key] = value;
        }
      });
      _audioPlayers = newPlayers;
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
                        fontWeight: FontWeight. w600,
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
                          _selectedVideos. isNotEmpty ||
                          _selectedAudios.isNotEmpty) ...[
                        SizedBox(height: 8),
                        Container(
                          width: 2,
                          height: 300,
                          color: Colors. grey.shade300,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(width: 12),

                  // User name và content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment. start,
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
                            GestureDetector(
                              onTap: _showAudioRecorder,
                              child: _buildMediaButton(AppIcons.audioPng),
                            ),
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

                        // Hiển thị audio đã ghi
                        if (_selectedAudios.isNotEmpty) ...[
                          SizedBox(height: 16),
                          _buildAudiosList(),
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
                              color: Colors. grey.shade700,
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

  // Widget hiển thị danh sách audio
  Widget _buildAudiosList() {
    return Column(
      children: _selectedAudios.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> audio = entry.value;
        return Container(
          margin: EdgeInsets.only(bottom: 8),
          child: _AudioPlayerPreview(
            audioPath: audio['filePath'] as String? ?? '',
            duration: audio['duration'] as Duration,
            onRemove: () => _removeAudio(index),
            onInitialized: (player) {
              _audioPlayers[index] = player;
            },
          ),
        );
      }).toList(),
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
              fit: BoxFit. cover,
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
                shape: BoxShape. circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }

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
                borderRadius: BorderRadius. circular(12),
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
                ! controller.value.isPlaying)
              Positioned. fill(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(12),
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
                  child: Icon(Icons. close, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
              pushScreen(context, RouteConstants. addHastag);
            }
          : onTap ??  () {},
      child: Container(
        padding: EdgeInsets. symmetric(horizontal: 16, vertical: 8),
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
                Icons. arrow_forward_ios,
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

// Widget audio player preview giống với audio_player_widget.dart
class _AudioPlayerPreview extends StatefulWidget {
  final String audioPath;
  final Duration duration;
  final VoidCallback onRemove;
  final Function(AudioPlayer) onInitialized;

  const _AudioPlayerPreview({
    required this.audioPath,
    required this.duration,
    required this.onRemove,
    required this.onInitialized,
  });

  @override
  State<_AudioPlayerPreview> createState() => _AudioPlayerPreviewState();
}

class _AudioPlayerPreviewState extends State<_AudioPlayerPreview> {
  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _isPlaying = false;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      // Kiểm tra file path có hợp lệ không
      if (widget.audioPath.isEmpty || 
          widget.audioPath == 'path/to/audio/file.m4a' ||
          widget.audioPath.contains('path/to')) {
        // File path là placeholder hoặc không hợp lệ
        setState(() {
          _hasError = true;
        });
        return;
      }

      // Kiểm tra file có tồn tại không (nếu là local file)
      if (!widget.audioPath.startsWith('http://') && 
          !widget.audioPath.startsWith('https://')) {
        final file = File(widget.audioPath);
        if (!await file.exists()) {
          print('Audio file does not exist: ${widget.audioPath}');
          setState(() {
            _hasError = true;
          });
          return;
        }
      }

      _audioPlayer = AudioPlayer();
      
      // Listen to player state
      _audioPlayer.onPlayerStateChanged.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state == PlayerState.playing;
          });
        }
      });

      // Listen to position changes
      _audioPlayer.onPositionChanged.listen((position) {
        if (mounted) {
          setState(() {
            _position = position;
          });
        }
      });

      // Listen to completion
      _audioPlayer.onPlayerComplete.listen((event) {
        if (mounted) {
          setState(() {
            _position = Duration.zero;
            _isPlaying = false;
          });
        }
      });

      // Set the source (file path or URL)
      if (widget.audioPath.startsWith('http://') || widget.audioPath.startsWith('https://')) {
        await _audioPlayer.setSourceUrl(widget.audioPath);
      } else {
        await _audioPlayer.setSourceDeviceFile(widget.audioPath);
      }
      
      widget.onInitialized(_audioPlayer);
      
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Error initializing audio: $e');
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    } catch (e) {
      print('Error toggling play/pause: $e');
    }
  }

  void _seekTo(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      print('Error seeking: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.mic, color: Colors.grey.shade600, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Audio Recording',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _formatDuration(widget.duration),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.onRemove,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.grey.shade700, size: 18),
              ),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Play/Pause button
              GestureDetector(
                onTap: _togglePlayPause,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              
              SizedBox(width: 16),
              
              // Waveform visualization
              Expanded(
                child: GestureDetector(
                  onTapDown: (details) {
                    // Calculate position based on tap
                    final RenderBox? box = context.findRenderObject() as RenderBox?;
                    if (box != null) {
                      final localPosition = details.localPosition;
                      final width = box.size.width - 80; // Subtract button width and padding
                      final ratio = ((localPosition.dx - 80) / width).clamp(0.0, 1.0);
                      final seekPosition = widget.duration * ratio;
                      _seekTo(seekPosition);
                    }
                  },
                  child: _AudioWaveformVisualizer(
                    duration: widget.duration,
                    position: _position,
                    isPlaying: _isPlaying,
                  ),
                ),
              ),
              
              SizedBox(width: 8),
              
              // Remove button
              GestureDetector(
                onTap: widget.onRemove,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.grey.shade700, size: 18),
                ),
              ),
            ],
          ),
          
          // Time display
          Padding(
            padding: EdgeInsets.only(top: 8, left: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_position),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _formatDuration(widget.duration),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Waveform visualizer widget
class _AudioWaveformVisualizer extends StatelessWidget {
  final Duration duration;
  final Duration position;
  final bool isPlaying;
  
  const _AudioWaveformVisualizer({
    required this.duration,
    required this.position,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final progress = duration.inMilliseconds > 0 
        ? position.inMilliseconds / duration.inMilliseconds 
        : 0.0;
    
    return CustomPaint(
      painter: _WaveformPainter(
        progress: progress,
        isPlaying: isPlaying,
      ),
      child: Container(
        height: 48,
      ),
    );
  }
}

// Custom painter for waveform
class _WaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;
  
  _WaveformPainter({
    required this.progress,
    required this.isPlaying,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 50;
    final barWidth = 3.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount - 1);
    
    // Generate random heights for waveform (in real app, this would come from audio data)
    final heights = List.generate(barCount, (index) {
      // Create a wave pattern
      final baseHeight = size.height * 0.3;
      final variation = size.height * 0.4 * 
          ((index % 7 == 0) ? 1.0 : 
           (index % 5 == 0) ? 0.8 : 
           (index % 3 == 0) ? 0.6 : 
           (index % 2 == 0) ? 0.4 : 0.5);
      return baseHeight + variation;
    });
    
    for (int i = 0; i < barCount; i++) {
      final x = i * (barWidth + spacing);
      final barHeight = heights[i];
      final y = (size.height - barHeight) / 2;
      
      // Determine if this bar is in the played portion
      final barProgress = (i + 1) / barCount;
      final isPlayed = barProgress <= progress;
      
      final paint = Paint()
        ..color = isPlayed ? Colors.black : Colors.grey[300]!
        ..strokeWidth = barWidth
        ..strokeCap = StrokeCap.round;
      
      // Draw bar
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isPlaying != isPlaying;
  }
}