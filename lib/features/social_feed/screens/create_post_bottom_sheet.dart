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
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
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
  String? _uploadProgressMessage;

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

  // Upload all media files and convert to PostMediaModel list
  Future<List<PostMediaModel>> _uploadAndConvertMedia() async {
    final List<PostMediaModel> mediaList = [];
    final userService = ref.read(userGeneralServiceProvider);

    try {
      final totalMedia = _selectedImages.length + _selectedVideos.length + _selectedAudios.length;
      int uploadedCount = 0;

      // Upload images
      if (_selectedImages.isNotEmpty) {
        setState(() {
          _uploadProgressMessage = 'Đang tải ảnh... (${uploadedCount + 1}/${totalMedia})';
        });

        final imageFutures = _selectedImages.asMap().entries.map((entry) async {
          final index = entry.key;
          final image = entry.value;
          final imageFile = File(image.path);
          
          if (await imageFile.exists()) {
            try {
              final uploadResult = await userService.uploadImage(imageFile);
              // Chỉ lấy URL từ backend, không fallback về local path
              final imageUrl = uploadResult.url ?? uploadResult.fileUrl;
              
              if (imageUrl == null || imageUrl.isEmpty) {
                throw Exception('Backend không trả về URL cho ảnh ${index + 1}');
              }
              
              setState(() {
                uploadedCount++;
                _uploadProgressMessage = 'Đang tải ảnh... ($uploadedCount/$totalMedia)';
              });
              
              return PostMediaModel(
                id: 'img_${DateTime.now().millisecondsSinceEpoch}_$index',
                type: MediaType.image,
                url: imageUrl,
                thumbnailUrl: imageUrl,
              );
            } catch (e) {
              print('Error uploading image $index: $e');
              throw Exception('Lỗi khi tải ảnh ${index + 1}: ${e.toString()}');
            }
          }
          return null;
        }).toList();

        final imageResults = await Future.wait(imageFutures);
        mediaList.addAll(imageResults.whereType<PostMediaModel>());
      }

      // Upload videos
      if (_selectedVideos.isNotEmpty) {
        setState(() {
          _uploadProgressMessage = 'Đang tải video... (${uploadedCount + 1}/$totalMedia)';
        });

        final videoFutures = _selectedVideos.asMap().entries.map((entry) async {
          final index = entry.key;
          final video = entry.value;
          final videoFile = File(video.path);
          final controller = _videoControllers[index];
          final duration = controller?.value.duration.inSeconds;
          
          if (await videoFile.exists()) {
            try {
              final uploadResult = await userService.uploadVideo(videoFile);
              // Chỉ lấy URL từ backend, không fallback về local path
              final videoUrl = uploadResult.url ?? uploadResult.fileUrl;
              
              if (videoUrl == null || videoUrl.isEmpty) {
                throw Exception('Backend không trả về URL cho video ${index + 1}');
              }
              
              final videoDuration = uploadResult.duration ?? duration;
              
              setState(() {
                uploadedCount++;
                _uploadProgressMessage = 'Đang tải video... ($uploadedCount/$totalMedia)';
              });
              
              return PostMediaModel(
                id: 'vid_${DateTime.now().millisecondsSinceEpoch}_$index',
                type: MediaType.video,
                url: videoUrl,
                thumbnailUrl: videoUrl, // TODO: Should get thumbnail URL from API
                duration: videoDuration,
              );
            } catch (e) {
              print('Error uploading video $index: $e');
              throw Exception('Lỗi khi tải video ${index + 1}: ${e.toString()}');
            }
          }
          return null;
        }).toList();

        final videoResults = await Future.wait(videoFutures);
        mediaList.addAll(videoResults.whereType<PostMediaModel>());
      }

      // Upload audios
      if (_selectedAudios.isNotEmpty) {
        setState(() {
          _uploadProgressMessage = 'Đang tải audio... (${uploadedCount + 1}/$totalMedia)';
        });

        final audioFutures = _selectedAudios.asMap().entries.map((entry) async {
          final index = entry.key;
          final audio = entry.value;
          final filePath = audio['filePath'] as String? ?? '';
          final duration = audio['duration'] as Duration? ?? Duration.zero;
          
          print('Uploading audio $index: filePath=$filePath');
          
          if (filePath.isEmpty) {
            print('Audio $index: filePath is empty');
            return null;
          }
          
          final audioFile = File(filePath);
          
          if (!await audioFile.exists()) {
            print('Audio $index: file does not exist at $filePath');
            throw Exception('File audio ${index + 1} không tồn tại');
          }
          
          try {
            print('Audio $index: starting upload...');
            final uploadResult = await userService.uploadAudio(audioFile);
            print('Audio $index: upload result = $uploadResult');
            
            // Chỉ lấy URL từ backend, không fallback về local path
            final audioUrl = uploadResult.url ?? uploadResult.fileUrl;
            
            if (audioUrl == null || audioUrl.isEmpty) {
              throw Exception('Backend không trả về URL cho audio ${index + 1}');
            }
            
            final audioDuration = uploadResult.duration ?? duration.inSeconds;
            
            setState(() {
              uploadedCount++;
              _uploadProgressMessage = 'Đang tải audio... ($uploadedCount/$totalMedia)';
            });
            
            print('Audio $index: uploaded successfully, URL=$audioUrl');
            
            return PostMediaModel(
              id: 'aud_${DateTime.now().millisecondsSinceEpoch}_$index',
              type: MediaType.audio,
              url: audioUrl,
              duration: audioDuration,
            );
          } catch (e) {
            print('Error uploading audio $index: $e');
            throw Exception('Lỗi khi tải audio ${index + 1}: ${e.toString()}');
          }
        }).toList();

        final audioResults = await Future.wait(audioFutures);
        mediaList.addAll(audioResults.whereType<PostMediaModel>());
      }

      setState(() {
        _uploadProgressMessage = null;
      });

      return mediaList;
    } catch (e) {
      print('Error uploading media: $e');
      setState(() {
        _uploadProgressMessage = null;
      });
      rethrow;
    }
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

      // Upload all media files first, then get URLs
      final media = await _uploadAndConvertMedia();

      // Get controller
      final controller = ref.read(socialFeedControllerProvider.notifier);

      // Create post with uploaded media URLs
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
        final errorMessage = e.toString().contains('Lỗi khi tải')
            ? e.toString()
            : 'Không thể tạo bài viết: ${e.toString()}';
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreatingPost = false;
          _uploadProgressMessage = null;
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
            uploadProgressMessage: _uploadProgressMessage,
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