import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';

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
  ],
  pagination: const PaginationModel(limit: 20, offset: 0, total: 20),
);
