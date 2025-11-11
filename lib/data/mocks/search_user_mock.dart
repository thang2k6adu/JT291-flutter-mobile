import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/mock_api_response.dart';

/// Sample search users data - 30+ users để test pagination tốt hơn
final _searchUsersMockData = [
  // Group 1: Premium users (verified)
  UserModel(
    id: 's_001',
    uid: 'u_s_001',
    nickname: 'Leo Herwitz',
    username: 'leo_herwitz',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_001',
    bio: 'Striving for excellence, embracing curiosity...',
    gender: 'female',
    isFollowing: true,
    followStatus: 'following',
    verified: true,
    mutualFollowersCount: 12,
  ),
  UserModel(
    id: 's_002',
    uid: 'u_s_002',
    nickname: 'Mina Kuro',
    username: 'mina_kuro',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_002',
    bio: 'Dream big. Work hard.',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: true,
    mutualFollowersCount: 5,
  ),
  UserModel(
    id: 's_003',
    uid: 'u_s_003',
    nickname: 'Kenji Park',
    username: 'kenji_park',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_003',
    bio: 'Lifelong learner and coffee enthusiast.',
    gender: 'male',
    isFollowing: true,
    followStatus: 'mutual',
    verified: true,
    mutualFollowersCount: 10,
  ),
  
  // Group 2: Regular users
  UserModel(
    id: 's_004',
    uid: 'u_s_004',
    nickname: 'Sarah Chen',
    username: 'sarah_chen',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_004',
    bio: 'Creating meaningful connections.',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
    mutualFollowersCount: 0,
  ),
  UserModel(
    id: 's_005',
    uid: 'u_s_005',
    nickname: 'Marcus Johnson',
    username: 'marcus_j',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_005',
    bio: 'Adventure seeker | Photography lover',
    gender: 'male',
    isFollowing: true,
    followStatus: 'following',
    verified: false,
    mutualFollowersCount: 3,
  ),
  UserModel(
    id: 's_006',
    uid: 'u_s_006',
    nickname: 'Yuki Tanaka',
    username: 'yuki_t',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_006',
    bio: 'Tech enthusiast | Book worm',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
    mutualFollowersCount: 1,
  ),
  UserModel(
    id: 's_007',
    uid: 'u_s_007',
    nickname: 'Emma Wilson',
    username: 'emma_wilson',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_007',
    bio: 'Music is life 🎵',
    gender: 'female',
    isFollowing: true,
    followStatus: 'mutual',
    verified: true,
    mutualFollowersCount: 8,
  ),
  UserModel(
    id: 's_008',
    uid: 'u_s_008',
    nickname: 'Alex Rivera',
    username: 'alex_rivera',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_008',
    bio: 'Chasing dreams, one step at a time.',
    gender: 'male',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
    mutualFollowersCount: 0,
  ),
  UserModel(
    id: 's_009',
    uid: 'u_s_009',
    nickname: 'Sofia Petrova',
    username: 'sofia_p',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_009',
    bio: 'Living my best life ✨',
    gender: 'female',
    isFollowing: true,
    followStatus: 'following',
    verified: true,
    mutualFollowersCount: 4,
  ),
  UserModel(
    id: 's_010',
    uid: 'u_s_010',
    nickname: 'Ryan O\'Connor',
    username: 'ryan_oconnor',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_010',
    bio: 'Passionate about art and design',
    gender: 'male',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
    mutualFollowersCount: 2,
  ),
  
  // Group 3: More users for pagination testing
  UserModel(
    id: 's_011',
    uid: 'u_s_011',
    nickname: 'Aisha Hassan',
    username: 'aisha_h',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_011',
    bio: 'Fitness coach | Healthy lifestyle advocate',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
  ),
  UserModel(
    id: 's_012',
    uid: 'u_s_012',
    nickname: 'Lucas Silva',
    username: 'lucas_silva',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_012',
    bio: 'Developer by day, gamer by night',
    gender: 'male',
    isFollowing: true,
    followStatus: 'following',
    verified: true,
    mutualFollowersCount: 6,
  ),
  UserModel(
    id: 's_013',
    uid: 'u_s_013',
    nickname: 'Nina Patel',
    username: 'nina_patel',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_013',
    bio: 'Digital nomad | Travel blogger',
    gender: 'female',
    isFollowing: true,
    followStatus: 'mutual',
    verified: true,
    mutualFollowersCount: 15,
  ),
  UserModel(
    id: 's_014',
    uid: 'u_s_014',
    nickname: 'David Kim',
    username: 'david_kim',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_014',
    bio: 'Photographer | Nature lover',
    gender: 'male',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
  ),
  UserModel(
    id: 's_015',
    uid: 'u_s_015',
    nickname: 'Isabella Martinez',
    username: 'bella_martinez',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_015',
    bio: 'Chef | Food enthusiast',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: true,
  ),
  UserModel(
    id: 's_016',
    uid: 'u_s_016',
    nickname: 'James Anderson',
    username: 'james_a',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_016',
    bio: 'Entrepreneur | Startup founder',
    gender: 'male',
    isFollowing: true,
    followStatus: 'following',
    verified: true,
    mutualFollowersCount: 20,
  ),
  UserModel(
    id: 's_017',
    uid: 'u_s_017',
    nickname: 'Zara Ali',
    username: 'zara_ali',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_017',
    bio: 'Fashion designer | Style icon',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: true,
    mutualFollowersCount: 8,
  ),
  UserModel(
    id: 's_018',
    uid: 'u_s_018',
    nickname: 'Oliver Brown',
    username: 'oliver_b',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_018',
    bio: 'Writer | Storyteller',
    gender: 'male',
    isFollowing: true,
    followStatus: 'mutual',
    verified: false,
  ),
  UserModel(
    id: 's_019',
    uid: 'u_s_019',
    nickname: 'Chloe Lee',
    username: 'chloe_lee',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_019',
    bio: 'Yoga instructor | Mindfulness coach',
    gender: 'female',
    isFollowing: false,
    followStatus: 'not_following',
    verified: false,
  ),
  UserModel(
    id: 's_020',
    uid: 'u_s_020',
    nickname: 'Mohammed Ahmed',
    username: 'mo_ahmed',
    avatarUrl: 'https://i.pravatar.cc/150?u=s_020',
    bio: 'Software engineer | Open source contributor',
    gender: 'male',
    isFollowing: true,
    followStatus: 'following',
    verified: true,
    mutualFollowersCount: 11,
  ),
  
  // Group 4: Additional users (21-30)
  ...List.generate(10, (i) {
    final index = i + 21;
    return UserModel(
      id: 's_0${index.toString().padLeft(2, '0')}',
      uid: 'u_s_0${index.toString().padLeft(2, '0')}',
      nickname: 'User $index',
      username: 'user_$index',
      avatarUrl: 'https://i.pravatar.cc/150?u=s_0$index',
      bio: 'This is user number $index profile',
      gender: index % 2 == 0 ? 'male' : 'female',
      isFollowing: index % 3 == 0,
      followStatus: index % 3 == 0 ? 'following' : 'not_following',
      verified: index % 5 == 0,
      mutualFollowersCount: index % 7,
    );
  }),
];

/// Mock API Response for searching users
/// Supports pagination and query filtering
ApiResponse<PaginatedData<UserModel>> mockSearchUsersApiResponse({
  String query = '',
  int page = 1,
  int limit = 10,
}) {
  // Filter users by query
  var filteredUsers = _searchUsersMockData;
  
  if (query.isNotEmpty) {
    filteredUsers = _searchUsersMockData
        .where((user) =>
            user.nickname.toLowerCase().contains(query.toLowerCase()) ||
            (user.bio?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
            (user.username?.toLowerCase().contains(query.toLowerCase()) ?? false))
        .toList();
  }

  // Apply pagination
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, filteredUsers.length);
  final pagedUsers = filteredUsers.sublist(start, end);

  return mockPaginatedResponse<UserModel>(
    items: pagedUsers,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: filteredUsers.length,
    message: 'Users fetched successfully',
  );
}

/// Mock API Response for empty search results
final mockSearchUsersEmptyApiResponse = ApiResponse<PaginatedData<UserModel>>(
  error: false,
  code: 200,
  message: 'No users found',
  data: PaginatedData<UserModel>(
    items: [],
    meta: const PaginationMeta(
      itemCount: 0,
      totalItems: 0,
      itemsPerPage: 10,
      totalPages: 0,
      currentPage: 1,
    ),
  ),
  traceId: 'MOCK_EMPTY_${DateTime.now().millisecondsSinceEpoch}',
);

/// Mock API Response for search error
final mockSearchUsersErrorApiResponse = mockErrorResponse<PaginatedData<UserModel>>(
  message: 'Failed to search users',
  code: 500,
);

/// Quick access to all search users data (for testing)
List<UserModel> get allSearchUsersMockData => _searchUsersMockData;

