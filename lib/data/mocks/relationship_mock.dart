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
  data: [
    const UserSummaryModel(
      id: "user1_id",
      username: "Leo Herwitz",
      avatarUrl: "https://example.com/avatar1.png",
      gender: "female",
      shortBio: "Striving for excellence, embracing life...",
      isFollowing: true,
    ),
    const UserSummaryModel(
      id: "user2_id",
      username: "Marley Schleifer",
      avatarUrl: "https://example.com/avatar2.png",
      gender: "male",
      shortBio: "Lover of technology and coffee",
      isFollowing: true,
    ),
    const UserSummaryModel(
      id: "user3_id",
      username: "Carmen Sandiego",
      avatarUrl: "https://example.com/avatar3.png",
      gender: "female",
      shortBio: "Adventurer and world traveler",
      isFollowing: false,
    ),
  ],
  pagination: const PaginationModel(limit: 20, offset: 0, total: 360),
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
  data: [
    const UserSummaryModel(
      id: "user4_id",
      username: "John Doe",
      avatarUrl: "https://example.com/avatar4.png",
      gender: "male",
      shortBio: "Music enthusiast and coder",
      isFollowing: false, // chưa follow lại
    ),
    const UserSummaryModel(
      id: "user5_id",
      username: "Anna Marie",
      avatarUrl: "https://example.com/avatar5.png",
      gender: "female",
      shortBio: "Traveler and food lover",
      isFollowing: true, // đã follow lại
    ),
    const UserSummaryModel(
      id: "user6_id",
      username: "Michael Scott",
      avatarUrl: "https://example.com/avatar6.png",
      gender: "male",
      shortBio: "Regional manager, Dunder Mifflin",
      isFollowing: false,
    ),
  ],
  pagination: const PaginationModel(limit: 20, offset: 0, total: 160000),
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
  data: [
    const UserSummaryModel(
      id: "friend1_id",
      username: "Olivia Benson",
      avatarUrl: "https://example.com/avatar_friend1.png",
      gender: "female",
      shortBio: "Detective and justice seeker",
      isFollowing: true,
    ),
    const UserSummaryModel(
      id: "friend2_id",
      username: "Harvey Specter",
      avatarUrl: "https://example.com/avatar_friend2.png",
      gender: "male",
      shortBio: "Closer. Winner. Lawyer.",
      isFollowing: true,
    ),
    const UserSummaryModel(
      id: "friend3_id",
      username: "Rachel Zane",
      avatarUrl: "https://example.com/avatar_friend3.png",
      gender: "female",
      shortBio: "Paralegal turned lawyer.",
      isFollowing: true,
    ),
  ],
  pagination: const PaginationModel(limit: 20, offset: 0, total: 20),
);

/// ===============================
/// 4️⃣ STATS MOCK DATA
/// ===============================
final userStatsMock = UserStatsModel(
  followingCount: 360,
  followersCount: 160000,
  friendsCount: 20,
);
