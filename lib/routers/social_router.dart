import 'package:go_router/go_router.dart';
import '../../features/social_feed/screens/feed_screen.dart';
import '../../features/social_feed/screens/add_hastag.dart';
import '../../features/social_feed/screens/post_detail_screen.dart';
import '../../features/social_feed/screens/comment_replies_screen.dart';
import '../core/core.dart';
import '../../data/mocks/social_feed_mock.dart' as mock;
import '../../data/models/social/comment_model.dart';

final socialRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.feed,
    builder: (context, state) => const FeedScreen(),
  ),
  GoRoute(
    path: RouteConstants.addHastag,
    builder: (context, state) => const AddHashtagScreen(),
  ),
  GoRoute(
    path: RouteConstants.postDetail,
    builder: (context, state) {
      final postId = state.pathParameters['postId']!;
      return PostDetailScreen(postId: postId);
    },
  ),
  GoRoute(
    path: RouteConstants.commentReplies,
    builder: (context, state) {
      final postId = state.pathParameters['postId']!;
      final commentId = state.pathParameters['commentId']!;
      
      // Get parent comment from extra (passed from PostDetailScreen)
      final parentComment = state.extra as CommentModel?;
      
      if (parentComment != null) {
        return CommentRepliesScreen(
          postId: postId,
          parentComment: parentComment,
        );
      }
      
      // Fallback: create a minimal comment (should not happen in normal flow)
      return CommentRepliesScreen(
        postId: postId,
        parentComment: CommentModel(
          id: commentId,
          postId: postId,
          userId: '',
          user: mock.allMockPosts.first.user,
          content: 'Loading...',
          createdAt: DateTime.now(),
        ),
      );
    },
  ),
];
