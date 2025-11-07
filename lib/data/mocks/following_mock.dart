import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';

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
