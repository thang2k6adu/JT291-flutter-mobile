import 'package:go_router/go_router.dart';
import '../../features/social_feed/screens/feed_screen.dart';
import '../../features/social_feed/screens/add_hastag.dart';
import '../../features/social_feed/screens/post_detail_screen.dart';
import '../core/core.dart';
import '../../data/mocks/social_feed_mock.dart' as mock;

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
      // Find post from mock data - in real app, this would come from provider/service
      final post = mock.allMockPosts.firstWhere(
        (p) => p.id == postId,
        orElse: () => mock.allMockPosts.first,
      );
      return PostDetailScreen(post: post);
    },
  ),
];
