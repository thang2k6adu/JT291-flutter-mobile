import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/hot_topic_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/hashtag_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/mock_api_response.dart';

// =================================================================
// MOCK USERS FOR POSTS
// =================================================================

final _mockPostUsers = [
  UserModel(
    id: 'user_001',
    nickname: 'Craig Curtis',
    avatar: 'https://i.pravatar.cc/300?u=craig_curtis',
  ),
  UserModel(
    id: 'user_002',
    nickname: 'Sarah Johnson',
    avatar: 'https://i.pravatar.cc/300?u=sarah_johnson',  
  ),
  UserModel(
    id: 'user_003',
    nickname: 'Michael Chen',
    avatar: 'https://i.pravatar.cc/300?u=michael_chen',
  ),
  UserModel(
    id: 'user_004',
    nickname: 'Emma Rodriguez',
    avatar: 'https://i.pravatar.cc/300?u=emma_rodriguez',
  ),
  UserModel(
    id: 'user_005',
    nickname: 'David Park',
    avatar: 'https://i.pravatar.cc/300?u=david_park',
  ),
  UserModel(
    id: 'user_006',
    nickname: 'Lisa Anderson',
    avatar: 'https://i.pravatar.cc/300?u=lisa_anderson',
  ),
  UserModel(
    id: 'user_007',
    nickname: 'James Wilson',
    avatar: 'https://i.pravatar.cc/300?u=james_wilson',
  ),
  UserModel(
    id: 'user_008',
    nickname: 'Sophie Martin',
    avatar: 'https://i.pravatar.cc/300?u=sophie_martin',
  ),
  UserModel(
    id: 'user_009',
    nickname: 'Alex Thompson',
    avatar: 'https://i.pravatar.cc/300?u=alex_thompson',
  ),
  UserModel(
    id: 'user_010',
    nickname: 'Nina Patel',
    avatar: 'https://i.pravatar.cc/300?u=nina_patel',
  ),
];

// =================================================================
// MOCK POSTS DATA
// =================================================================

final _mockPostsData = [
  // Post 1: Home decor with single image
  PostModel(
    id: 'post_001',
    user: _mockPostUsers[0],
    content: 'When it comes to home decor, the details make all the difference! ✨ Just finished renovating my living room and I couldn\'t be happier with how it turned out. The key is mixing modern pieces with vintage finds. #homedecor #interior',
    media: [
      PostMediaModel(
        id: 'media_001',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1080?random=1',
        thumbnailUrl: 'https://picsum.photos/400/400?random=1',
        width: 1080,
        height: 1080,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_001', name: '#homedecor'), HashtagModel(id: 'hashtag_002', name: '#interior'), HashtagModel(id: 'hashtag_003', name: '#renovation')],
    likeCount: 245,
    commentCount: 13,
    shareCount: 5,
    isLiked: false,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    privacy: PostPrivacy.public,
    location: 'San Francisco, CA',
  ),

  // Post 2: Travel post with multiple images
  PostModel(
    id: 'post_002',
    user: _mockPostUsers[1],
    content: 'Absolutely breathtaking sunset at Santorini! 🌅 This place never fails to amaze me. If you haven\'t been here yet, add it to your bucket list! #travel #santorini #greece #sunset',
    media: [
      PostMediaModel(
        id: 'media_002_1',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1350?random=2',
        thumbnailUrl: 'https://picsum.photos/400/500?random=2',
        width: 1080,
        height: 1350,
      ),
      PostMediaModel(
        id: 'media_002_2',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1080?random=3',
        thumbnailUrl: 'https://picsum.photos/400/400?random=3',
        width: 1080,
        height: 1080,
      ),
      PostMediaModel(
        id: 'media_002_3',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1350?random=4',
        thumbnailUrl: 'https://picsum.photos/400/500?random=4',
        width: 1080,
        height: 1350,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_004', name: '#travel'), HashtagModel(id: 'hashtag_005', name: '#santorini'), HashtagModel(id: 'hashtag_006', name: '#greece'), HashtagModel(id: 'hashtag_007', name: '#sunset'), HashtagModel(id: 'hashtag_008', name: '#bucketlist')],
    likeCount: 1823,
    commentCount: 156,
    shareCount: 89,
    isLiked: true,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    privacy: PostPrivacy.public,
    location: 'Santorini, Greece',
  ),

  // Post 3: Food post with video
  PostModel(
    id: 'post_003',
    user: _mockPostUsers[2],
    content: 'Trying out a new recipe today! 🍝 Homemade pasta with creamy truffle sauce. The secret is fresh ingredients and patience. Recipe link in my bio! #cooking #pasta #foodie #homemade',
    media: [
      PostMediaModel(
        id: 'media_003',
        type: MediaType.video,
        url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        thumbnailUrl: 'https://picsum.photos/1080/1920?random=5',
        width: 1080,
        height: 1920,
        duration: 45,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_009', name: '#cooking'), HashtagModel(id: 'hashtag_010', name: '#pasta'), HashtagModel(id: 'hashtag_011', name: '#foodie'), HashtagModel(id: 'hashtag_012', name: '#homemade'), HashtagModel(id: 'hashtag_013', name: '#recipe')],
    likeCount: 892,
    commentCount: 67,
    shareCount: 34,
    isLiked: true,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    privacy: PostPrivacy.public,
  ),

  // Post 4: Fashion post
  PostModel(
    id: 'post_004',
    user: _mockPostUsers[3],
    content: 'OOTD: Casual Friday vibes! 👗 Loving this new summer collection. Can\'t wait for warmer days! What\'s your go-to casual outfit? #fashion #ootd #style #summervibes',
    media: [
      PostMediaModel(
        id: 'media_004',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1350?random=6',
        thumbnailUrl: 'https://picsum.photos/400/500?random=6',
        width: 1080,
        height: 1350,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_014', name: '#fashion'), HashtagModel(id: 'hashtag_015', name: '#ootd'), HashtagModel(id: 'hashtag_016', name: '#style'), HashtagModel(id: 'hashtag_017', name: '#summervibes')],
    likeCount: 567,
    commentCount: 34,
    shareCount: 12,
    isLiked: false,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 12)),
    privacy: PostPrivacy.public,
    location: 'New York, NY',
  ),

  // Post 5: Tech review
  PostModel(
    id: 'post_005',
    user: _mockPostUsers[4],
    content: 'Just got my hands on the latest flagship phone! 📱 First impressions: the camera is INSANE! Will do a full review soon. What do you want to know about it? #tech #smartphone #review #Sayhi2025',
    media: [
      PostMediaModel(
        id: 'media_005_1',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1080?random=7',
        thumbnailUrl: 'https://picsum.photos/400/400?random=7',
        width: 1080,
        height: 1080,
      ),
      PostMediaModel(
        id: 'media_005_2',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1080?random=8',
        thumbnailUrl: 'https://picsum.photos/400/400?random=8',
        width: 1080,
        height: 1080,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_018', name: '#tech'), HashtagModel(id: 'hashtag_019', name: '#smartphone'), HashtagModel(id: 'hashtag_020', name: '#review'), HashtagModel(id: 'hashtag_021', name: '#Sayhi2025')],
    likeCount: 1234,
    commentCount: 189,
    shareCount: 56,
    isLiked: true,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(hours: 15)),
    privacy: PostPrivacy.public,
  ),

  // Post 6: Fitness post
  PostModel(
    id: 'post_006',
    user: _mockPostUsers[5],
    content: 'Leg day is the best day! 💪 Remember, consistency is key. You don\'t have to be great to start, but you have to start to be great! #fitness #workout #motivation #legday',
    media: [
      PostMediaModel(
        id: 'media_006',
        type: MediaType.video,
        url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        thumbnailUrl: 'https://picsum.photos/1080/1920?random=9',
        width: 1080,
        height: 1920,
        duration: 30,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_022', name: '#fitness'), HashtagModel(id: 'hashtag_023', name: '#workout'), HashtagModel(id: 'hashtag_024', name: '#motivation'), HashtagModel(id: 'hashtag_025', name: '#legday')],
    likeCount: 678,
    commentCount: 45,
    shareCount: 23,
    isLiked: false,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(hours: 18)),
    privacy: PostPrivacy.friends,
  ),

  // Post 7: Photography
  PostModel(
    id: 'post_007',
    user: _mockPostUsers[6],
    content: 'Golden hour magic ✨📸 The best lighting happens in the first and last hour of sunlight. Nature is the best photography studio! #photography #goldenhour #nature #landscape',
    media: [
      PostMediaModel(
        id: 'media_007',
        type: MediaType.image,
        url: 'https://picsum.photos/1350/1080?random=10',
        thumbnailUrl: 'https://picsum.photos/500/400?random=10',
        width: 1350,
        height: 1080,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_026', name: '#photography'), HashtagModel(id: 'hashtag_027', name: '#goldenhour'), HashtagModel(id: 'hashtag_028', name: '#nature'), HashtagModel(id: 'hashtag_029', name: '#landscape')],
    likeCount: 2341,
    commentCount: 234,
    shareCount: 145,
    isLiked: true,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(hours: 24)),
    privacy: PostPrivacy.public,
    location: 'Yosemite National Park',
  ),

  // Post 8: Book review
  PostModel(
    id: 'post_008',
    user: _mockPostUsers[7],
    content: 'Just finished this amazing book! 📚 Couldn\'t put it down. The plot twists were incredible! Currently having my morning coffee and reflecting on the ending. What are you reading? #books #reading #bookstagram #coffee',
    media: [
      PostMediaModel(
        id: 'media_008',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1350?random=11',
        thumbnailUrl: 'https://picsum.photos/400/500?random=11',
        width: 1080,
        height: 1350,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_030', name: '#books'), HashtagModel(id: 'hashtag_031', name: '#reading'), HashtagModel(id: 'hashtag_032', name: '#bookstagram'), HashtagModel(id: 'hashtag_033', name: '#coffee')],
    likeCount: 456,
    commentCount: 78,
    shareCount: 19,
    isLiked: false,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    privacy: PostPrivacy.public,
  ),

  // Post 9: Music festival
  PostModel(
    id: 'post_009',
    user: _mockPostUsers[8],
    content: 'What a night! 🎵🔥 The energy at the festival was absolutely insane! Can\'t wait for the next one. Who else was there? #music #festival #dj #edm #Sayhi2025',
    media: [
      PostMediaModel(
        id: 'media_009_1',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1080?random=12',
        thumbnailUrl: 'https://picsum.photos/400/400?random=12',
        width: 1080,
        height: 1080,
      ),
      PostMediaModel(
        id: 'media_009_2',
        type: MediaType.video,
        url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
        thumbnailUrl: 'https://picsum.photos/1080/1920?random=13',
        width: 1080,
        height: 1920,
        duration: 60,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_034', name: '#music'), HashtagModel(id: 'hashtag_035', name: '#festival'), HashtagModel(id: 'hashtag_036', name: '#dj'), HashtagModel(id: 'hashtag_037', name: '#edm'), HashtagModel(id: 'hashtag_038', name: '#Sayhi2025')],
    likeCount: 3456,
    commentCount: 567,
    shareCount: 234,
    isLiked: true,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 12)),
    privacy: PostPrivacy.public,
    location: 'Coachella Valley',
  ),

  // Post 10: Yoga/wellness
  PostModel(
    id: 'post_010',
    user: _mockPostUsers[9],
    content: 'Start your day with intention 🧘‍♀️ Morning yoga session by the beach. There\'s something magical about practicing with the sound of waves. #yoga #wellness #mindfulness #beachyoga #meditation',
    media: [
      PostMediaModel(
        id: 'media_010',
        type: MediaType.image,
        url: 'https://picsum.photos/1350/1080?random=14',
        thumbnailUrl: 'https://picsum.photos/500/400?random=14',
        width: 1350,
        height: 1080,
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_039', name: '#yoga'), HashtagModel(id: 'hashtag_040', name: '#wellness'), HashtagModel(id: 'hashtag_041', name: '#mindfulness'), HashtagModel(id: 'hashtag_042', name: '#beachyoga'), HashtagModel(id: 'hashtag_043', name: '#meditation')],
    likeCount: 891,
    commentCount: 92,
    shareCount: 45,
    isLiked: false,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    privacy: PostPrivacy.public,
    location: 'Bali, Indonesia',
  ),

  // Post 11: Podcast/Audio post
  PostModel(
    id: 'post_011',
    user: _mockPostUsers[0],
    content: 'New podcast episode is live! 🎙️ In this episode, we discuss the future of AI and how it\'s changing our daily lives. Would love to hear your thoughts! #podcast #AI #tech #Giaoluamnhac',
    media: [
      PostMediaModel(
        id: 'media_011',
        type: MediaType.audio,
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        duration: 180, // 3 minutes
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_044', name: '#podcast'), HashtagModel(id: 'hashtag_045', name: '#AI'), HashtagModel(id: 'hashtag_046', name: '#tech'), HashtagModel(id: 'hashtag_047', name: '#Giaoluamnhac')],
    likeCount: 456,
    commentCount: 89,
    shareCount: 34,
    isLiked: false,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 6)),
    privacy: PostPrivacy.public,
  ),

  // Post 12: Music/Audio post
  PostModel(
    id: 'post_012',
    user: _mockPostUsers[4],
    content: 'Just finished my first music composition! 🎵 This track took me weeks to perfect. Hope you enjoy it as much as I enjoyed making it. #music #composer #originalsong #Podcastdem',
    media: [
      PostMediaModel(
        id: 'media_012',
        type: MediaType.audio,
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
        duration: 245, // 4:05
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_048', name: '#music'), HashtagModel(id: 'hashtag_049', name: '#composer'), HashtagModel(id: 'hashtag_050', name: '#originalsong'), HashtagModel(id: 'hashtag_051', name: '#Podcastdem')],
    likeCount: 892,
    commentCount: 123,
    shareCount: 67,
    isLiked: true,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 18)),
    privacy: PostPrivacy.public,
  ),

  // Post 13: Mixed media (image + audio)
  PostModel(
    id: 'post_013',
    user: _mockPostUsers[7],
    content: 'Recorded this beautiful sound of nature during my morning walk 🌿🎧 The birds were singing so beautifully today! #nature #sounds #peaceful #meditation',
    media: [
      PostMediaModel(
        id: 'media_013_1',
        type: MediaType.image,
        url: 'https://picsum.photos/1080/1350?random=15',
        thumbnailUrl: 'https://picsum.photos/400/500?random=15',
        width: 1080,
        height: 1350,
      ),
      PostMediaModel(
        id: 'media_013_2',
        type: MediaType.audio,
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
        duration: 120, // 2 minutes
      ),
    ],
    hashtags: [HashtagModel(id: 'hashtag_052', name: '#nature'), HashtagModel(id: 'hashtag_053', name: '#sounds'), HashtagModel(id: 'hashtag_054', name: '#peaceful'), HashtagModel(id: 'hashtag_055', name: '#meditation')],
    likeCount: 334,
    commentCount: 45,
    shareCount: 23,
    isLiked: false,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    privacy: PostPrivacy.public,
  ),

  // Additional posts for pagination testing
  ...List.generate(15, (i) {
    final index = i + 11;
    final userIndex = i % _mockPostUsers.length;
    return PostModel(
      id: 'post_${index.toString().padLeft(3, '0')}',
      user: _mockPostUsers[userIndex],
      content: 'This is post number $index! Just sharing some thoughts and moments from my day. Life is beautiful when you take time to appreciate the little things. What made you smile today? #dailypost #life #grateful',
      media: [
        PostMediaModel(
          id: 'media_${index}_1',
          type: MediaType.image,
          url: 'https://picsum.photos/1080/1080?random=${index + 100}',
          thumbnailUrl: 'https://picsum.photos/400/400?random=${index + 100}',
          width: 1080,
          height: 1080,
        ),
      ],
      hashtags: [HashtagModel(id: 'hashtag_056', name: '#dailypost'), HashtagModel(id: 'hashtag_057', name: '#life'), HashtagModel(id: 'hashtag_058', name: '#grateful')],
      likeCount: (index * 23) % 500,
      commentCount: (index * 5) % 50,
      shareCount: (index * 2) % 20,
      isLiked: index % 3 == 0,
      isBookmarked: index % 5 == 0,
      createdAt: DateTime.now().subtract(Duration(days: 2 + (i ~/ 3), hours: i % 24)),
      privacy: PostPrivacy.public,
    );
  }),
];

// =================================================================
// MOCK HOT TOPICS DATA
// =================================================================

final _mockHotTopics = [
  HotTopicModel(
    id: 'topic_001',
    hashtag: '#Sayhi2025',
    postCount: 120000,
    thumbnailUrl: 'https://picsum.photos/600/600?random=501',
    engagementScore: 98.5,
  ),
  HotTopicModel(
    id: 'topic_002',
    hashtag: '#TravelTuesday',
    postCount: 89500,
    thumbnailUrl: 'https://picsum.photos/600/600?random=502',
    engagementScore: 95.2,
  ),
  HotTopicModel(
    id: 'topic_003',
    hashtag: '#FoodieFriday',
    postCount: 76300,
    thumbnailUrl: 'https://picsum.photos/600/600?random=503',
    engagementScore: 92.8,
  ),
  HotTopicModel(
    id: 'topic_004',
    hashtag: '#FitnessMotivation',
    postCount: 65400,
    thumbnailUrl: 'https://picsum.photos/600/600?random=504',
    engagementScore: 89.7,
  ),
  HotTopicModel(
    id: 'topic_005',
    hashtag: '#TechTrends',
    postCount: 54200,
    thumbnailUrl: 'https://picsum.photos/600/600?random=505',
    engagementScore: 87.3,
  ),
  HotTopicModel(
    id: 'topic_006',
    hashtag: '#OOTD',
    postCount: 45900,
    thumbnailUrl: 'https://picsum.photos/600/600?random=506',
    engagementScore: 84.1,
  ),
  HotTopicModel(
    id: 'topic_007',
    hashtag: '#Photography',
    postCount: 39800,
    thumbnailUrl: 'https://picsum.photos/600/600?random=507',
    engagementScore: 81.5,
  ),
  HotTopicModel(
    id: 'topic_008',
    hashtag: '#Wellness',
    postCount: 34600,
    thumbnailUrl: 'https://picsum.photos/600/600?random=508',
    engagementScore: 78.9,
  ),
];

// =================================================================
// HELPER FUNCTIONS TO FILTER POSTS
// =================================================================

/// Get posts from friends (users marked as isFriend = true)
List<PostModel> _getFriendsPosts() {
  return _mockPostsData
      .where((post) => post.user.isFriend || post.user.isFollowing)
      .toList();
}

/// Get all posts for community feed
List<PostModel> _getCommunityPosts() {
  return _mockPostsData;
}

/// Get latest posts (all posts sorted by date)
List<PostModel> _getLatestPosts() {
  final posts = List<PostModel>.from(_mockPostsData);
  posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return posts;
}

// =================================================================
// MOCK API RESPONSES
// =================================================================

/// GET /api/feed/friends
/// Returns paginated feed from friends
ApiResponse<PaginatedData<PostModel>> mockFriendsFeedApiResponse({
  int page = 1,
  int limit = 20,
  DateTime? since,
}) {
  var posts = _getFriendsPosts();

  // Filter by 'since' timestamp if provided (for pull-to-refresh)
  if (since != null) {
    posts = posts.where((post) => post.createdAt.isAfter(since)).toList();
  }

  // Apply pagination
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, posts.length);
  final pagedPosts = start < posts.length ? posts.sublist(start, end) : <PostModel>[];

  return mockPaginatedResponse<PostModel>(
    items: pagedPosts,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: posts.length,
    message: 'Friends feed fetched successfully',
  );
}

/// GET /api/feed/community
/// Returns paginated community feed
ApiResponse<PaginatedData<PostModel>> mockCommunityFeedApiResponse({
  int page = 1,
  int limit = 20,
  DateTime? since,
}) {
  var posts = _getCommunityPosts();

  // Filter by 'since' timestamp if provided (for pull-to-refresh)
  if (since != null) {
    posts = posts.where((post) => post.createdAt.isAfter(since)).toList();
  }

  // Apply pagination
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, posts.length);
  final pagedPosts = start < posts.length ? posts.sublist(start, end) : <PostModel>[];

  return mockPaginatedResponse<PostModel>(
    items: pagedPosts,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: posts.length,
    message: 'Community feed fetched successfully',
  );
}

/// GET /api/feed/hot-topics
/// Returns list of hot/trending topics
ApiResponse<List<HotTopicModel>> mockHotTopicsApiResponse() {
  return ApiResponse<List<HotTopicModel>>(
    error: false,
    code: 200,
    message: 'Hot topics fetched successfully',
    data: _mockHotTopics,
    traceId: 'mock_trace_${DateTime.now().millisecondsSinceEpoch}',
  );
}

/// GET /api/feed/latest
/// Returns paginated latest posts (all posts sorted by date)
ApiResponse<PaginatedData<PostModel>> mockLatestFeedApiResponse({
  int page = 1,
  int limit = 20,
  DateTime? since,
}) {
  var posts = _getLatestPosts();

  // Filter by 'since' timestamp if provided (for pull-to-refresh)
  if (since != null) {
    posts = posts.where((post) => post.createdAt.isAfter(since)).toList();
  }

  // Apply pagination
  final start = (page - 1) * limit;
  final end = (start + limit).clamp(0, posts.length);
  final pagedPosts = start < posts.length ? posts.sublist(start, end) : <PostModel>[];

  return mockPaginatedResponse<PostModel>(
    items: pagedPosts,
    currentPage: page,
    itemsPerPage: limit,
    totalItems: posts.length,
    message: 'Latest feed fetched successfully',
  );
}

// =================================================================
// ERROR RESPONSES
// =================================================================

/// Mock 401 Unauthorized response
final mockFeedUnauthorizedResponse = mockErrorResponse<PaginatedData<PostModel>>(
  message: 'Unauthorized. Please login.',
  code: 401,
);

/// Mock 500 Internal server error response
final mockFeedServerErrorResponse = mockErrorResponse<PaginatedData<PostModel>>(
  message: 'Internal server error. Please try again later.',
  code: 500,
);

// =================================================================
// QUICK ACCESS TO DATA (for testing/debugging)
// =================================================================

/// Get all mock posts
List<PostModel> get allMockPosts => _mockPostsData;

/// Get all mock hot topics
List<HotTopicModel> get allMockHotTopics => _mockHotTopics;

/// Get all mock post users
List<UserModel> get allMockPostUsers => _mockPostUsers;

