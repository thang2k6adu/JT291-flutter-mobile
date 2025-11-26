import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/comment_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_card/post_time_formatter.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/post_media_carousel.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/post_options_bottom_sheet.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/inline_audio_player.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';

class PostDetailScreen extends StatefulWidget {
  final PostModel post;

  const PostDetailScreen({
    super.key,
    required this.post,
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _replyController = TextEditingController();
  List<CommentModel> _comments = [];

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  void _loadComments() {
    // Mock data - will be replaced with service later
    setState(() {
      _comments = _getMockComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPostHeader(),
                  if (widget.post.content.isNotEmpty) _buildPostContent(),
                  if (widget.post.media.isNotEmpty) _buildPostMedia(),
                  _buildPostActions(),
                  _buildCommentsHeader(),
                  _buildCommentsList(),
                ],
              ),
            ),
          ),
          _buildReplyInput(),
        ],
      ),
    );
  }

  Widget _buildPostHeader() {
    final user = widget.post.user;
    final avatarImage = user.avatar != null && user.avatar!.isNotEmpty
        ? NetworkImage(user.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            image: avatarImage,
            size: 44,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      PostTimeFormatter.format(widget.post.createdAt),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showPostOptions(context),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        widget.post.content,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF1A1A1A),
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildPostMedia() {
    final images = widget.post.media.where((m) => m.type == MediaType.image).toList();
    final otherMedia = widget.post.media.where((m) => m.type != MediaType.image).toList();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          if (images.isNotEmpty)
            Row(
              children: images.take(2).map((media) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: images.indexOf(media) < images.length - 1 ? 4 : 0,
                    ),
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
          if (otherMedia.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: PostMediaCarousel(mediaList: otherMedia),
            ),
        ],
      ),
    );
  }

  Widget _buildPostActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const SizedBox(width: 16),
          _LikeButton(
            isLiked: widget.post.isLiked,
            likeCount: widget.post.likeCount,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          _CommentButton(
            commentCount: widget.post.commentCount,
            onTap: () {},
          ),
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
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'View activity >',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _comments.length,
      itemBuilder: (context, index) {
        return _CommentItem(comment: _comments[index]);
      },
    );
  }

  Widget _buildReplyInput() {
    final currentUser = widget.post.user; // In real app, get from auth
    final avatarImage = currentUser.avatar != null && currentUser.avatar!.isNotEmpty
        ? NetworkImage(currentUser.avatar!)
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
                'Trả lời ${widget.post.user.nickname}',
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

  void _showPostOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => PostOptionsBottomSheet(
        postId: widget.post.id,
        authorId: widget.post.user.id,
        authorName: widget.post.user.nickname,
        authorAvatar: widget.post.user.avatar,
      ),
    );
  }

  List<CommentModel> _getMockComments() {
    // Mock users for comments
    final hayliePress = UserModel(
      id: 'user_comment_001',
      nickname: 'Haylie Press',
      avatar: 'https://i.pravatar.cc/300?u=haylie_press',
    );

    final commentUser2 = UserModel(
      id: 'user_comment_002',
      nickname: 'Haylie Press',
      avatar: 'https://i.pravatar.cc/300?u=comment_user_2',
    );

    return [
      // Comment 1: Text with 2 replies
      CommentModel(
        id: 'comment_001',
        user: hayliePress,
        content: 'Use light-colored or sheer curtains to let in more sunlight, making your space feel brighter and more open.',
        media: [],
        likeCount: 0,
        replyCount: 2,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
      // Comment 2: Text only
      CommentModel(
        id: 'comment_002',
        user: hayliePress,
        content: 'Use light-colored or sheer curtains to let in',
        media: [],
        likeCount: 0,
        replyCount: 0,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      // Comment 3: With image
      CommentModel(
        id: 'comment_003',
        user: commentUser2,
        content: 'Use light-colored or sheer curtains to let in',
        media: [
          PostMediaModel(
            id: 'comment_media_001',
            type: MediaType.image,
            url: 'https://picsum.photos/400/400?random=201',
            width: 400,
            height: 400,
          ),
        ],
        likeCount: 0,
        replyCount: 0,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      // Comment 4: With audio
      CommentModel(
        id: 'comment_004',
        user: commentUser2,
        content: 'Use light-colored or sheer curtains to let in',
        media: [
          PostMediaModel(
            id: 'comment_media_002',
            type: MediaType.audio,
            url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
            duration: 30,
          ),
        ],
        likeCount: 0,
        replyCount: 0,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      // Comment 5: With 2 images
      CommentModel(
        id: 'comment_005',
        user: hayliePress,
        content: 'Use light-colored or sheer curtains to let in',
        media: [
          PostMediaModel(
            id: 'comment_media_003',
            type: MediaType.image,
            url: 'https://picsum.photos/400/400?random=202',
            width: 400,
            height: 400,
          ),
          PostMediaModel(
            id: 'comment_media_004',
            type: MediaType.image,
            url: 'https://picsum.photos/400/400?random=203',
            width: 400,
            height: 400,
          ),
        ],
        likeCount: 0,
        replyCount: 0,
        isLiked: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ];
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

  const _CommentButton({
    required this.commentCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIconSimple.asset(
          AppIcons.messageSvg,
          size: 24,
        ),
        if (commentCount > 0) ...[
          const SizedBox(width: 4),
          Text(
            '$commentCount',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
    return SvgIconSimple.asset(
      AppIcons.sendMessageLineSvg,
      size: 24,
    );
  }
}

class _CommentItem extends StatelessWidget {
  final CommentModel comment;

  const _CommentItem({required this.comment});

  @override
  Widget build(BuildContext context) {
    final user = comment.user;
    final avatarImage = user.avatar != null && user.avatar!.isNotEmpty
        ? NetworkImage(user.avatar!)
        : AssetImage(AppImages.defaultAvatar) as ImageProvider;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          AvatarWidget(
            image: avatarImage,
            size: 40,
          ),
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
                            user. nickname,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            PostTimeFormatter. format(comment.createdAt),
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
    );
  }

  Widget _buildCommentActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Like, Comment, Share icons
        Row(
          children: [
            Icon(Icons.favorite_border, size: 18, color: Colors. grey[600]),
            const SizedBox(width: 12),
            SvgIconSimple.asset(
              AppIcons.messageSvg,
              size: 18,
            ),
            if (comment.replyCount > 0) ...[
              const SizedBox(width: 4),
              Text(
                '${comment.replyCount}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
            const SizedBox(width: 12),
            SvgIconSimple.asset(
              AppIcons.sendMessageLineSvg,
              size: 18,
            ),
          ],
        ),
        
        // Reply info
        if (comment.replyCount > 0) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${comment.replyCount} replies • Show feedback',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
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
    final images = comment.media.where((m) => m.type == MediaType.image).toList();
    final audio = comment.media.where((m) => m.type == MediaType.audio).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Images
        if (images.isNotEmpty)
          Row(
            children: images.take(2). map((media) {
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
                shape: BoxShape. circle,
                border: Border. all(color: Colors.white, width: 1),
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
                shape: BoxShape. circle,
                border: Border. all(color: Colors.white, width: 1),
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

