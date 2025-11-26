import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'create_post_utils.dart';
import 'create_post_media_previews.dart';

class CreatePostContent extends StatelessWidget {
  final TextEditingController textController;
  final List<String> selectedHashtags;
  final bool hasMedia;
  final Function() onBackspaceAtStart;
  final VoidCallback onPickImages;
  final VoidCallback onPickVideo;
  final VoidCallback onShowAudioRecorder;
  
  // Media previews props
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

  const CreatePostContent({
    super.key,
    required this.textController,
    required this.selectedHashtags,
    required this.hasMedia,
    required this.onBackspaceAtStart,
    required this.onPickImages,
    required this.onPickVideo,
    required this.onShowAudioRecorder,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar và đường kẻ dọc
        Column(
          children: [
            AvatarWidget(
              image: AssetImage(AppImages.defaultAvatar),
              size: 40,
            ),
            if (hasMedia) ...[
              const SizedBox(height: 8),
              Container(
                width: 2,
                height: 300,
                color: Colors.grey.shade300,
              ),
            ],
          ],
        ),
        const SizedBox(width: 12),

        // User name và content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User name
              const Text(
                'Darlene Bears',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Hashtags và TextField content - hiển thị inline như Facebook
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hiển thị hashtags như text thường với màu khác
                  if (selectedHashtags.isNotEmpty)
                    RichText(
                      text: TextSpan(
                        children: selectedHashtags.map((hashtag) {
                          return TextSpan(
                            text: '$hashtag ',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                  // TextField để nhập content
                  Expanded(
                    child: TextField(
                      controller: textController,
                      maxLines: null,
                      inputFormatters: [
                        HashtagBackspaceFormatter(onBackspaceAtStart),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: selectedHashtags.isEmpty ? "What's new?" : null,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  MediaButton(
                    icon: AppIcons.galleryPng,
                    onTap: onPickImages,
                  ),
                  const SizedBox(width: 16),
                  MediaButton(
                    icon: AppIcons.videoPng,
                    onTap: onPickVideo,
                  ),
                  const SizedBox(width: 16),
                  MediaButton(
                    icon: AppIcons.audioPng,
                    onTap: onShowAudioRecorder,
                  ),
                ],
              ),

              // Media previews ngay dưới media buttons
              CreatePostMediaPreviews(
                selectedImages: selectedImages,
                selectedVideos: selectedVideos,
                selectedAudios: selectedAudios,
                videoControllers: videoControllers,
                audioPlayers: audioPlayers,
                onRemoveImage: onRemoveImage,
                onRemoveVideo: onRemoveVideo,
                onRemoveAudio: onRemoveAudio,
                onAudioInitialized: onAudioInitialized,
                onVideoStateChanged: onVideoStateChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

