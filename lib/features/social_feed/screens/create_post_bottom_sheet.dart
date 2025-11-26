import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:jt291_flutter_mobile/components/helper/image_helper.dart';
import 'package:jt291_flutter_mobile/components/helper/video_helper.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jt291_flutter_mobile/features/social_feed/controllers/social_feed_controller.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import '../widgets/layout/feed_screen/audio_recorder_bottom_sheet.dart';
import '../widgets/layout/create_post/create_post.dart';

class CreatePostBottomSheet extends ConsumerStatefulWidget {
  const CreatePostBottomSheet({super. key});

  @override
  ConsumerState<CreatePostBottomSheet> createState() => _CreatePostBottomSheetState();
}

class _CreatePostBottomSheetState extends ConsumerState<CreatePostBottomSheet> {
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

  // Loading state
  bool _isCreatingPost = false;

  // Handle backspace to delete last hashtag
  // Only delete when TextField is empty and cursor is at start
  void _handleBackspaceAtStart() {
    // Only delete hashtag if TextField is empty
    if (_textController.text.isEmpty && _selectedHashtags.isNotEmpty) {
      setState(() {
        _selectedHashtags.removeLast();
      });
    }
  }

  @override
  void dispose() {
    _textController. dispose();
    // Dispose all video controllers
    _videoControllers.forEach((key, controller) {
      controller.dispose();
    });
    // Dispose all audio players
    _audioPlayers.forEach((key, player) {
      player.dispose();
    });
    super. dispose();
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
        await _initializeVideoController(_selectedVideos. length - 1, video);
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
    _videoControllers. remove(index);

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

  // Convert media files to PostMediaModel list
  List<PostMediaModel> _convertMediaToPostMedia() {
    final List<PostMediaModel> mediaList = [];

    // Convert images
    for (int i = 0; i < _selectedImages.length; i++) {
      final image = _selectedImages[i];
      // For now, use file path as mock URL. In production, upload first and get real URL
      mediaList.add(
        PostMediaModel(
          id: 'img_${DateTime.now().millisecondsSinceEpoch}_$i',
          type: MediaType.image,
          url: image.path, // Mock: will be replaced with uploaded URL
          thumbnailUrl: image.path,
        ),
      );
    }

    // Convert videos
    for (int i = 0; i < _selectedVideos.length; i++) {
      final video = _selectedVideos[i];
      final controller = _videoControllers[i];
      final duration = controller?.value.duration.inSeconds;
      
      mediaList.add(
        PostMediaModel(
          id: 'vid_${DateTime.now().millisecondsSinceEpoch}_$i',
          type: MediaType.video,
          url: video.path, // Mock: will be replaced with uploaded URL
          thumbnailUrl: video.path, // Mock: should generate thumbnail
          duration: duration,
        ),
      );
    }

    // Convert audios
    for (int i = 0; i < _selectedAudios.length; i++) {
      final audio = _selectedAudios[i];
      final filePath = audio['filePath'] as String? ?? '';
      final duration = audio['duration'] as Duration? ?? Duration.zero;
      
      mediaList.add(
        PostMediaModel(
          id: 'aud_${DateTime.now().millisecondsSinceEpoch}_$i',
          type: MediaType.audio,
          url: filePath, // Mock: will be replaced with uploaded URL
          duration: duration.inSeconds,
        ),
      );
    }

    return mediaList;
  }

  // Handle post creation
  Future<void> _handleCreatePost() async {
    // Validate: must have content or media
    final content = _textController.text.trim();
    if (content.isEmpty && 
        _selectedImages.isEmpty && 
        _selectedVideos.isEmpty && 
        _selectedAudios.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vui lòng nhập nội dung hoặc chọn media'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isCreatingPost = true;
    });

    try {
      // Convert privacy boolean to PostPrivacy enum
      final privacy = _isPublic ? PostPrivacy.public : PostPrivacy.private;

      // Convert media files to PostMediaModel
      final media = _convertMediaToPostMedia();

      // Get controller
      final controller = ref.read(socialFeedControllerProvider.notifier);

      // Create post
      final createdPost = await controller.createPost(
        content: content,
        privacy: privacy,
        hashtags: _selectedHashtags,
        media: media,
        context: context,
      );

      if (createdPost != null && mounted) {
        // Reset state
        controller.resetCreatePost();
        
        // Close bottom sheet
        Navigator.pop(context, createdPost);
      }
    } catch (e) {
      print('Error creating post: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Không thể tạo bài viết: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreatingPost = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          CreatePostHeader(
            isCreatingPost: _isCreatingPost,
            onCancel: () => Navigator.pop(context),
            onCreatePost: _handleCreatePost,
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreatePostContent(
                    textController: _textController,
                    selectedHashtags: _selectedHashtags,
                    hasMedia: _selectedImages.isNotEmpty ||
                        _selectedVideos.isNotEmpty ||
                        _selectedAudios.isNotEmpty,
                    onBackspaceAtStart: _handleBackspaceAtStart,
                    onPickImages: _pickImages,
                    onPickVideo: _pickVideo,
                    onShowAudioRecorder: _showAudioRecorder,
                    selectedImages: _selectedImages,
                    selectedVideos: _selectedVideos,
                    selectedAudios: _selectedAudios,
                    videoControllers: _videoControllers,
                    audioPlayers: _audioPlayers,
                    onRemoveImage: _removeImage,
                    onRemoveVideo: _removeVideo,
                    onRemoveAudio: _removeAudio,
                    onAudioInitialized: (index, player) {
                      _audioPlayers[index] = player;
                    },
                    onVideoStateChanged: () {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bottom section
          CreatePostBottomSection(
            isPublic: _isPublic,
            onPrivacyChanged: (value) {
              setState(() {
                _isPublic = value;
              });
            },
            onHashtagAdded: (hashtag) {
              if (!_selectedHashtags.contains(hashtag)) {
                setState(() {
                  _selectedHashtags.add(hashtag);
                });
              }
            },
          ),
        ],
      ),
    );
  }

}