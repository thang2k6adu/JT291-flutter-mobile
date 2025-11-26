import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/data/models/social/comment_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_time_formatter.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/inline_audio_player.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/comment_provider.dart';

class CommentRepliesScreen extends ConsumerStatefulWidget {
  final String postId;
  final CommentModel parentComment;

  const CommentRepliesScreen({
    super.key,
    required this.postId,
    required this.parentComment,
  });

  @override
  ConsumerState<CommentRepliesScreen> createState() => _CommentRepliesScreenState();
}

class _CommentRepliesScreenState extends ConsumerState<CommentRepliesScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(
        title: 'Replies',
      ),
      body: Column(
        children: [
          // Parent comment
          _buildParentComment(),
          
          const Divider(height: 1),
          
          // Replies list
          Expanded(
            child: _buildRepliesList(),
          ),
          
          // Reply input
          _buildReplyInput(),
        ],
      ),
    );
  }

  Widget _buildParentComment() {
    final user = widget.parentComment.user;
    final avatarImage = user.avatar != null && user.avatar!.isNotEmpty
        ? NetworkImage(user.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[50],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            image: avatarImage,
            size: 40,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      PostTimeFormatter.format(widget.parentComment.createdAt),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (widget.parentComment.content.isNotEmpty)
                  Text(
                    widget.parentComment.content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                    ),
                  ),
                if (widget.parentComment.media.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  _buildCommentMedia(widget.parentComment.media),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRepliesList() {
    final repliesAsync = ref.watch(
      commentRepliesProvider(
        CommentRepliesParams(
          postId: widget.postId,
          commentId: widget.parentComment.id,
        ),
      ),
    );

    return repliesAsync.when(
      data: (replies) {
        if (replies.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Text(
                'No replies yet',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }

        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: replies.length,
          itemBuilder: (context, index) {
            return _ReplyItem(
              reply: replies[index],
              postId: widget.postId,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Failed to load replies',
              style: TextStyle(color: Colors.red[300]),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => ref.refresh(
                commentRepliesProvider(
                  CommentRepliesParams(
                    postId: widget.postId,
                    commentId: widget.parentComment.id,
                  ),
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyInput() {
    final parentUser = widget.parentComment.user;
    final avatarImage = parentUser.avatar != null && parentUser.avatar!.isNotEmpty
        ? NetworkImage(parentUser.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          AvatarWidget(
            image: avatarImage,
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Trả lời ${parentUser.nickname}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentMedia(List<PostMediaModel> media) {
    final images = media.where((m) => m.type == MediaType.image).toList();
    final audio = media.where((m) => m.type == MediaType.audio).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (images.isNotEmpty)
          Row(
            children: images.take(2).map((media) {
              final isLast = images.indexOf(media) == images.length - 1 || 
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
        
        if (audio.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: images.isNotEmpty ? 8 : 0),
            child: InlineAudioPlayer(audioUrl: audio.first.url),
          ),
      ],
    );
  }
}

class _ReplyItem extends StatelessWidget {
  final CommentModel reply;
  final String postId;

  const _ReplyItem({
    required this.reply,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final user = reply.user;
    final avatarImage = user.avatar != null && user.avatar!.isNotEmpty
        ? NetworkImage(user.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            image: avatarImage,
            size: 40,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            PostTimeFormatter.format(reply.createdAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (reply.content.isNotEmpty)
                  Text(
                    reply.content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                    ),
                  ),
                if (reply.media.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  _buildReplyMedia(),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 18, color: Colors.grey[600]),
                    const SizedBox(width: 12),
                    SvgIconSimple.asset(
                      AppIcons.messageSvg,
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                    SvgIconSimple.asset(
                      AppIcons.sendMessageLineSvg,
                      size: 18,
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

  Widget _buildReplyMedia() {
    final images = reply.media.where((m) => m.type == MediaType.image).toList();
    final audio = reply.media.where((m) => m.type == MediaType.audio).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (images.isNotEmpty)
          Row(
            children: images.take(2).map((media) {
              final isLast = images.indexOf(media) == images.length - 1 || 
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
        
        if (audio.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: images.isNotEmpty ? 8 : 0),
            child: InlineAudioPlayer(audioUrl: audio.first.url),
          ),
      ],
    );
  }
}

