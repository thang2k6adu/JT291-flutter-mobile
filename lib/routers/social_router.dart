import 'package:go_router/go_router.dart';
import '../../features/social_feed/screens/feed_screen.dart';
import '../core/core.dart';

final socialRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.feed,
    builder: (context, state) => const FeedScreen(),
  ),
];
