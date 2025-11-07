import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';

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
