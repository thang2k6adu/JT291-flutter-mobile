import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_stats_model.dart';

/// ===============================
/// 1️⃣ FOLLOWING MOCK DATA
/// ===============================
final followingMock = UserListResponse(
  userId: "darlene_bears_id",
  username: "Darlene Bears",
  avatarUrl: "https://example.com/avatar_darlene.png",
  followingCount: 360,
  followersCount: 160000,
  friendsCount: 20,
  data: List.generate(
    20,
    (i) => UserSummaryModel(
      id: "following_${i + 1}",
      username: "Following User ${i + 1}",
      avatarUrl: "https://example.com/following_${i + 1}.png",
      gender: i.isEven ? "male" : "female",
      shortBio: "Bio of following user ${i + 1}",
      isFollowing: i % 3 != 0,
    ),
  ),
  pagination: const PaginationModel(limit: 10, offset: 0, total: 360),
);

/// ===============================
/// 2️⃣ FOLLOWER MOCK DATA
/// ===============================
final followerMock = UserListResponse(
  userId: "darlene_bears_id",
  username: "Darlene Bears",
  avatarUrl: "https://example.com/avatar_darlene.png",
  followingCount: 360,
  followersCount: 160000,
  friendsCount: 20,
  data: List.generate(
    20,
    (i) => UserSummaryModel(
      id: "follower_${i + 1}",
      username: "Follower User ${i + 1}",
      avatarUrl: "https://example.com/follower_${i + 1}.png",
      gender: i.isEven ? "female" : "male",
      shortBio: "Follower user ${i + 1} loves photography & travel.",
      isFollowing: i % 2 == 0,
    ),
  ),
  pagination: const PaginationModel(limit: 10, offset: 0, total: 160000),
);

/// ===============================
/// 3️⃣ FRIEND MOCK DATA
/// ===============================
final friendMock = UserListResponse(
  userId: "darlene_bears_id",
  username: "Darlene Bears",
  avatarUrl: "https://example.com/avatar_darlene.png",
  followingCount: 360,
  followersCount: 160000,
  friendsCount: 20,
  data: List.generate(
    20,
    (i) => UserSummaryModel(
      id: "friend_${i + 1}",
      username: "Friend User ${i + 1}",
      avatarUrl: "https://example.com/friend_${i + 1}.png",
      gender: i.isEven ? "female" : "male",
      shortBio: "Friend ${i + 1} enjoys hiking, music, and coding.",
      isFollowing: true,
    ),
  ),
  pagination: const PaginationModel(limit: 10, offset: 0, total: 20),
);

/// ===============================
/// 4️⃣ STATS MOCK DATA
/// ===============================
final userStatsMock = UserStatsModel(
  followingCount: 360,
  followersCount: 160000,
  friendsCount: 20,
);
