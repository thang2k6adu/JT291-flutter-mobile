import 'package:go_router/go_router.dart';
import '../../features/social_feed/screens/feed_screen.dart';
import '../../features/social_feed/screens/add_hastag.dart';
import '../core/core.dart';

final socialRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.feed,
    builder: (context, state) => const FeedScreen(),
  ),
  GoRoute(
    path: RouteConstants.addHastag,
    builder: (context, state) => const AddHashtagScreen(),
  ),
];
