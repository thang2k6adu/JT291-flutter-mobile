import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'create_post_audio_player.dart';

class CreatePostMediaPreviews extends StatelessWidget {
  final List<XFile> selectedImages;
  final List<XFile> selectedVideos;
  final List<Map<String, dynamic>> selectedAudios;
  final Map<int, VideoPlayerController> videoControllers;
  final Map<int, AudioPlayer> audioPlayers;
  final Function(int) onRemoveImage;
  final Function(int) onRemoveVideo;
  final Function(int) onRemoveAudio;
  final Function(int, AudioPlayer) onAudioInitialized;
  final VoidCallback? onVideoStateChanged;

  const CreatePostMediaPreviews({
    super.key,
    required this.selectedImages,
    required this.selectedVideos,
    required this.selectedAudios,
    required this.videoControllers,
    required this.audioPlayers,
    required this.onRemoveImage,
    required this.onRemoveVideo,
    required this.onRemoveAudio,
    required this.onAudioInitialized,
    this.onVideoStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hasMedia = selectedImages.isNotEmpty ||
        selectedVideos.isNotEmpty ||
        selectedAudios.isNotEmpty;

    if (!hasMedia) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        // Images grid
        if (selectedImages.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildImagesGrid(),
        ],

        // Videos grid
        if (selectedVideos.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildVideosGrid(),
        ],

        // Audios list
        if (selectedAudios.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildAudiosList(),
        ],
      ],
    );
  }

  Widget _buildImagesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) => _buildImagePreview(index),
    );
  }

  Widget _buildVideosGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: selectedVideos.length,
      itemBuilder: (context, index) => _buildVideoPreview(index),
    );
  }

  Widget _buildAudiosList() {
    return Column(
      children: selectedAudios.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> audio = entry.value;
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: CreatePostAudioPlayer(
            audioPath: audio['filePath'] as String? ?? '',
            duration: audio['duration'] as Duration,
            onRemove: () => onRemoveAudio(index),
            onInitialized: (player) => onAudioInitialized(index, player),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildImagePreview(int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(File(selectedImages[index].path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => onRemoveImage(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoPreview(int index) {
    final controller = videoControllers[index];

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: () {
          if (controller != null && controller.value.isInitialized) {
            // Toggle play/pause
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
            // Notify parent to update state
            onVideoStateChanged?.call();
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
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
            ),

            // Play/Pause icon overlay
            if (controller != null &&
                controller.value.isInitialized &&
                !controller.value.isPlaying)
              Positioned.fill(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
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
                onTap: () => onRemoveVideo(index),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

