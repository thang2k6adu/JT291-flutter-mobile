import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_stats_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/mock_api_response.dart';

/// Sample user names
const _userNames = [
  'Leo Herwitz',
  'Mina Kuro',
  'Kenji Park',
  'Sarah Chen',
  'Marcus Johnson',
  'Yuki Tanaka',
  'Emma Wilson',
  'Alex Rivera',
  'Sofia Petrova',
  'Ryan O\'Connor',
  'Aisha Hassan',
  'Lucas Silva',
  'Nina Patel',
  'David Kim',
  'Isabella Martinez',
  'James Anderson',
  'Zara Ali',
  'Oliver Brown',
  'Chloe Lee',
  'Mohammed Ahmed',
];

/// Sample bios
const _bios = [
  'Striving for excellence, embracing curiosity...',
  'Dream big. Work hard.',
  'Lifelong learner and coffee enthusiast.',
  'Creating meaningful connections.',
  'Adventure seeker | Photography lover',
  'Tech enthusiast | Book worm',
  'Music is life 🎵',
  'Chasing dreams, one step at a time.',
  'Living my best life ✨',
  'Passionate about art and design',
];

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
    (i) => UserModel(
      id: "following_${i + 1}",
      unionId: "u_following_${i + 1}",
      nickname: _userNames[i % _userNames.length],
      avatar: "https://i.pravatar.cc/150?u=following_${i + 1}",
      bio: _bios[i % _bios.length],
      gender: i.isEven ? "male" : "female",
      isFollowing: true,
      followStatus: i % 3 == 0 ? "mutual" : "following",
      mutualFollowersCount: i * 2 + 1,
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
    (i) => UserModel(
      id: "follower_${i + 1}",
      unionId: "u_follower_${i + 1}",
      nickname: _userNames[(i + 5) % _userNames.length],
      avatar: "https://i.pravatar.cc/150?u=follower_${i + 1}",
      bio: _bios[(i + 3) % _bios.length],
      gender: i.isEven ? "female" : "male",
      isFollowing: i % 2 == 0,
      followStatus: i % 2 == 0 ? "mutual" : "not_following",
      mutualFollowersCount: i % 8,
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
    (i) => UserModel(
      id: "friend_${i + 1}",
      unionId: "u_friend_${i + 1}",
      nickname: _userNames[(i + 10) % _userNames.length],
      avatar: "https://i.pravatar.cc/150?u=friend_${i + 1}",
      bio: _bios[(i + 5) % _bios.length],
      gender: i.isEven ? "female" : "male",
      isFollowing: true,
      followStatus: "mutual",
      mutualFollowersCount: i * 3 + 5,
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
  viewsCount: 100000,
);

/// ===============================
/// 🎯 API RESPONSE WRAPPERS
/// ===============================

/// Mock API Response for Following List (Paginated)
ApiResponse<PaginatedData<UserModel>> mockFollowingApiResponse({
  int page = 1,
  int limit = 10,
}) {
  final allUsers = followingMock.data;
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, allUsers.length);
  final pagedUsers = allUsers.sublist(start, end);

  return mockPaginatedResponse<UserModel>(
    items: pagedUsers,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: allUsers.length,
    message: 'Following list fetched successfully',
  );
}

/// Mock API Response for Follower List (Paginated)
ApiResponse<PaginatedData<UserModel>> mockFollowerApiResponse({
  int page = 1,
  int limit = 10,
}) {
  final allUsers = followerMock.data;
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, allUsers.length);
  final pagedUsers = allUsers.sublist(start, end);

  return mockPaginatedResponse<UserModel>(
    items: pagedUsers,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: allUsers.length,
    message: 'Follower list fetched successfully',
  );
}

/// Mock API Response for Friend List (Paginated)
ApiResponse<PaginatedData<UserModel>> mockFriendApiResponse({
  int page = 1,
  int limit = 10,
}) {
  final allUsers = friendMock.data;
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, allUsers.length);
  final pagedUsers = allUsers.sublist(start, end);

  return mockPaginatedResponse<UserModel>(
    items: pagedUsers,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: allUsers.length,
    message: 'Friend list fetched successfully',
  );
}

/// Mock API Response for User Stats
final mockUserStatsApiResponse = mockSuccessResponse<UserStatsModel>(
  userStatsMock,
  message: 'User stats fetched successfully',
);

/// Mock API Response for Single User Profile
ApiResponse<UserModel> mockUserProfileApiResponse(String userId) {
  // Find user from mock data or create a default one
  final allUsers = [
    ...followingMock.data,
    ...followerMock.data,
    ...friendMock.data,
  ];
  
  final user = allUsers.firstWhere(
    (u) => u.id == userId,
    orElse: () => UserModel(
      id: userId,
      nickname: 'Unknown User',
      avatar: 'https://i.pravatar.cc/150?u=$userId',
      bio: 'This is a mock user profile',
    ),
  );

  return mockSuccessResponse<UserModel>(
    user,
    message: 'User profile fetched successfully',
  );
}
