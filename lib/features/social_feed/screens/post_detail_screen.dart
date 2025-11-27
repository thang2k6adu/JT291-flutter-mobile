import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/comment_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_time_formatter.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_media_carousel.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/post_options_bottom_sheet.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/inline_audio_player.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/comment_provider.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/post_detail_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';
import 'package:jt291_flutter_mobile/data/services/comment_service.dart';
import 'package:jt291_flutter_mobile/components/helper/image_helper.dart';
import 'package:jt291_flutter_mobile/components/helper/video_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/audio_recorder_bottom_sheet.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'dart:io';

class PostDetailScreen extends ConsumerStatefulWidget {
  final String postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  ConsumerState<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _commentController = TextEditingController();
  final ImageHelper _imageHelper = ImageHelper();
  final VideoHelper _videoHelper = VideoHelper();
  
  List<XFile> _selectedImages = [];
  List<XFile> _selectedVideos = [];
  List<Map<String, dynamic>> _selectedAudios = [];
  bool _isPostingComment = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postAsync = ref.watch(postDetailProvider(widget.postId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(title: ''),
      body: postAsync.when(
        data: (post) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    _buildPostHeader(post),
                    if (post.content.isNotEmpty) _buildPostContent(post),
                    if (post.media.isNotEmpty) _buildPostMedia(post),
                    _buildPostActions(post),
                  _buildCommentsHeader(),
                    _buildCommentsList(post.id),
                ],
              ),
            ),
          ),
            _buildReplyInput(post),
        ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Failed to load post',
                style: TextStyle(color: Colors.red[300]),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.refresh(postDetailProvider(widget.postId)),
                child: const Text('Retry'),
              ),
        ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostHeader(PostModel post) {
    final user = post.user;
    final avatarImage = user.avatar != null && user.avatar!.isNotEmpty
        ? NetworkImage(user.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(image: avatarImage, size: 44),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      user.nickname,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      PostTimeFormatter.format(post.createdAt),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showPostOptions(context, post),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(Icons.more_horiz, color: Colors.grey[600], size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostContent(PostModel post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hashtags ở đầu
          if (post.hashtags.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: post.hashtags.map((hashtag) {
                final hashtagName = hashtag.name.startsWith('#') ? hashtag.name : '#${hashtag.name}';
                return Text(
                  hashtagName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1DA1F2), // Màu xanh cho hashtag
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 4),
          ],
          // Content text
          Text(
            post.content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostMedia(PostModel post) {
    if (post.media.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: PostMediaCarousel(mediaList: post.media),
    );
  }

  Widget _buildPostActions(PostModel post) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 16, bottom: 12),
      child: Row(
        children: [
          const SizedBox(width: 16),
          _LikeButton(
            isLiked: post.isLiked,
            likeCount: post.likeCount,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          _CommentButton(commentCount: post.commentCount, onTap: () {}),
          const SizedBox(width: 12),
          _ShareButton(onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildCommentsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Comments',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () {
              context.push('/post/${widget.postId}/likes');
            },
            child: Text(
            'View activity >',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList(String postId) {
    final commentsAsync = ref.watch(postCommentsProvider(postId));

    return commentsAsync.when(
      data: (comments) {
        if (comments.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Text(
                'No comments yet',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return _CommentItem(
              comment: comments[index],
              postId: postId,
              onTap: () => _navigateToReplies(comments[index], postId),
            );
          },
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text(
                'Failed to load comments',
                style: TextStyle(color: Colors.red[300]),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () =>
                    ref.refresh(postCommentsProvider(postId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToReplies(CommentModel comment, String postId) {
    if (comment.repliesCount > 0) {
      context.push(
        '/post/$postId/comment/${comment.id}/replies',
        extra: comment,
      );
    }
  }

  Widget _buildReplyInput(PostModel post) {
    final currentUserAsync = ref.watch(userAuthProvider);
    final currentUser = currentUserAsync.value;
    
    final avatarImage = currentUser?.avatar != null && currentUser!.avatar!.isNotEmpty
        ? NetworkImage(currentUser.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    final hasMedia = _selectedImages.isNotEmpty || 
                     _selectedVideos.isNotEmpty || 
                     _selectedAudios.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Media previews
          if (hasMedia) ...[
            _buildMediaPreviews(),
            const SizedBox(height: 8),
          ],
          // Input row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarWidget(image: avatarImage, size: 32),
          const SizedBox(width: 12),
          Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Focus vào TextField khi tap vào placeholder
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Trả lời ${post.user.nickname}',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                      maxLines: null,
                      minLines: 1,
                      textInputAction: TextInputAction.newline,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Action menu button
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.grey),
                onPressed: () => _showMediaActionMenu(context),
                tooltip: 'Thêm media',
              ),
              // Post button
              IconButton(
                icon: _isPostingComment
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send, color: Colors.blue),
                onPressed: _isPostingComment ? null : () => _postComment(post.id),
                tooltip: 'Đăng',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMediaActionMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image, color: Colors.grey),
              title: const Text('Chọn ảnh'),
              onTap: () {
                Navigator.pop(context);
                _pickImages();
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam, color: Colors.grey),
              title: const Text('Chọn video'),
              onTap: () {
                Navigator.pop(context);
                _pickVideo();
              },
            ),
            ListTile(
              leading: const Icon(Icons.mic, color: Colors.grey),
              title: const Text('Ghi âm'),
              onTap: () {
                Navigator.pop(context);
                _showAudioRecorder();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaPreviews() {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Image previews
          ..._selectedImages.asMap().entries.map((entry) {
            final index = entry.key;
            final image = entry.value;
            return _buildImagePreview(image, index);
          }),
          // Video previews
          ..._selectedVideos.asMap().entries.map((entry) {
            final index = entry.key;
            final video = entry.value;
            return _buildVideoPreview(video, index);
          }),
          // Audio previews
          ..._selectedAudios.asMap().entries.map((entry) {
            final index = entry.key;
            final audio = entry.value;
            return _buildAudioPreview(audio, index);
          }),
        ],
      ),
    );
  }

  Widget _buildImagePreview(XFile image, int index) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(image.path),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedImages.removeAt(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPreview(XFile video, int index) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.black,
              child: const Icon(Icons.videocam, color: Colors.white, size: 30),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedVideos.removeAt(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioPreview(Map<String, dynamic> audio, int index) {
    final duration = audio['duration'] as int? ?? 0;
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.audiotrack, color: Colors.grey, size: 30),
                  Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedAudios.removeAt(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi chọn ảnh: $e')),
        );
      }
    }
  }

  Future<void> _pickVideo() async {
    try {
      final video = await _videoHelper.pickVideo(
        source: ImageSource.gallery,
        maxDurationSeconds: 300,
      );
      if (video != null) {
        setState(() {
          _selectedVideos.add(video);
        });
      }
    } catch (e) {
      print('Error picking video: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi chọn video: $e')),
        );
      }
    }
  }

  Future<void> _showAudioRecorder() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AudioRecorderBottomSheet(),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _selectedAudios.add(result);
      });
    }
  }

  Future<void> _postComment(String postId) async {
    if (_commentController.text.trim().isEmpty && 
        _selectedImages.isEmpty && 
        _selectedVideos.isEmpty && 
        _selectedAudios.isEmpty) {
      return;
    }

    setState(() {
      _isPostingComment = true;
    });

    try {
      final commentService = ref.read(commentServiceProvider);
      final userService = ref.read(userGeneralServiceProvider);
      
      // Upload media if any
      List<PostMediaModel> mediaList = [];
      
      // Upload images
      for (var image in _selectedImages) {
        try {
          final uploadResult = await userService.uploadImage(File(image.path));
          final imageUrl = uploadResult.url ?? uploadResult.fileUrl;
          if (imageUrl != null && imageUrl.isNotEmpty) {
            mediaList.add(PostMediaModel(
              id: 'img_${DateTime.now().millisecondsSinceEpoch}_${_selectedImages.indexOf(image)}',
              type: MediaType.image,
              url: imageUrl,
              thumbnailUrl: imageUrl,
            ));
          }
        } catch (e) {
          print('Error uploading image: $e');
        }
      }
      
      // Upload videos
      for (var video in _selectedVideos) {
        try {
          final uploadResult = await userService.uploadVideo(File(video.path));
          final videoUrl = uploadResult.url ?? uploadResult.fileUrl;
          if (videoUrl != null && videoUrl.isNotEmpty) {
            mediaList.add(PostMediaModel(
              id: 'vid_${DateTime.now().millisecondsSinceEpoch}_${_selectedVideos.indexOf(video)}',
              type: MediaType.video,
              url: videoUrl,
              thumbnailUrl: uploadResult.fileUrl,
            ));
          }
        } catch (e) {
          print('Error uploading video: $e');
        }
      }
      
      // Upload audios
      for (var audio in _selectedAudios) {
        try {
          final filePath = audio['filePath'] as String?;
          if (filePath != null) {
            final uploadResult = await userService.uploadAudio(File(filePath));
            final audioUrl = uploadResult.url ?? uploadResult.fileUrl;
            if (audioUrl != null && audioUrl.isNotEmpty) {
              mediaList.add(PostMediaModel(
                id: 'aud_${DateTime.now().millisecondsSinceEpoch}_${_selectedAudios.indexOf(audio)}',
                type: MediaType.audio,
                url: audioUrl,
              ));
            }
          }
        } catch (e) {
          print('Error uploading audio: $e');
        }
      }

      // Create comment
      // Note: API có thể cần media được gửi riêng, cần kiểm tra API spec
      final response = await commentService.createComment(
        postId: postId,
        content: _commentController.text.trim(),
      );
      
      if (response.error || response.data == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // Clear inputs
        _commentController.clear();
        setState(() {
          _selectedImages.clear();
          _selectedVideos.clear();
          _selectedAudios.clear();
        });
        
        // Refresh comments list
        ref.invalidate(postCommentsProvider(postId));
        // Refresh post to update comment count
        ref.invalidate(postDetailProvider(postId));
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã đăng bình luận'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isPostingComment = false;
        });
      }
    }
  }


  void _showPostOptions(BuildContext context, PostModel post) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => PostOptionsBottomSheet(
        postId: post.id,
        authorId: post.user.id,
        authorName: post.user.nickname,
        authorAvatar: post.user.avatar,
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  final bool isLiked;
  final int likeCount;
  final VoidCallback onTap;

  const _LikeButton({
    required this.isLiked,
    required this.likeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            size: 24,
            color: isLiked ? Colors.red : Colors.black,
          ),
          if (likeCount > 0) ...[
            const SizedBox(width: 4),
            Text(
              '$likeCount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isLiked ? Colors.red : Colors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CommentButton extends StatelessWidget {
  final int commentCount;
  final VoidCallback? onTap;

  const _CommentButton({required this.commentCount, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIconSimple.asset(AppIcons.messageSvg, size: 24),
        if (commentCount > 0) ...[
          const SizedBox(width: 4),
          Text(
            '$commentCount',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ],
    );
  }
}

class _ShareButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _ShareButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SvgIconSimple.asset(AppIcons.sendMessageLineSvg, size: 24);
  }
}

class _CommentItem extends StatelessWidget {
  final CommentModel comment;
  final String postId;
  final VoidCallback? onTap;

  const _CommentItem({required this.comment, required this.postId, this.onTap});

  @override
  Widget build(BuildContext context) {
    final user = comment.user;
    final avatarImage = user.avatar != null && user.avatar!.isNotEmpty
        ? NetworkImage(user.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return GestureDetector(
      onTap: comment.repliesCount > 0 ? onTap : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            AvatarWidget(image: avatarImage, size: 40),
            const SizedBox(width: 8),

            // Content (Flexible để tránh overflow)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User info row
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              user.nickname,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              PostTimeFormatter.format(comment.createdAt),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.more_horiz, size: 18, color: Colors.grey[600]),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Content text
                  if (comment.content.isNotEmpty)
                    Text(
                      comment.content,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1A1A1A),
                        height: 1.4,
                      ),
                    ),

                  // Media
                  if (comment.media.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildCommentMedia(),
                  ],

                  const SizedBox(height: 8),

                  // Actions
                  _buildCommentActions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Like, Comment, Share icons
        Row(
          children: [
            Icon(Icons.favorite_border, size: 18, color: Colors.grey[600]),
            const SizedBox(width: 12),
            SvgIconSimple.asset(AppIcons.messageSvg, size: 18),
            if (comment.repliesCount > 0) ...[
              const SizedBox(width: 4),
              Text(
                '${comment.repliesCount}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
            const SizedBox(width: 12),
            SvgIconSimple.asset(AppIcons.sendMessageLineSvg, size: 18),
          ],
        ),

        // Reply info
        if (comment.repliesCount > 0) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${comment.repliesCount} replies • Show feedback',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              _buildReplyAvatars(),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildCommentMedia() {
    final images = comment.media
        .where((m) => m.type == MediaType.image)
        .toList();
    final audio = comment.media
        .where((m) => m.type == MediaType.audio)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Images
        if (images.isNotEmpty)
          Row(
            children: images.take(2).map((media) {
              final isLast =
                  images.indexOf(media) == images.length - 1 ||
                  images.indexOf(media) == 1;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: isLast ? 0 : 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        media.url,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.broken_image, size: 30),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

        // Audio
        if (audio.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: images.isNotEmpty ? 8 : 0),
            child: InlineAudioPlayer(audioUrl: audio.first.url),
          ),
      ],
    );
  }

  Widget _buildReplyAvatars() {
    return SizedBox(
      width: 32, // Fixed width để tránh overflow
      height: 20,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
                color: Colors.grey[300],
              ),
            ),
          ),
          Positioned(
            left: 12,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
