import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';

class UserRelationItem {
  final String id;
  final String nickname;
  final String avatarUrl;
  final String bio;
  final bool isFriend;
  final String gender;

  UserRelationItem({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.bio,
    this.isFriend = false,
    required this.gender,
  });

  factory UserRelationItem.fromFollowingModel(UserSummaryModel following) {
    return UserRelationItem(
      id: following.id ?? '',
      nickname: following.username ?? '',
      avatarUrl: following.avatarUrl ?? '',
      bio: following.shortBio ?? '',
      isFriend: false,
      gender: following.gender ?? 'male',
    );
  }

  factory UserRelationItem.fromFollowerModel(UserSummaryModel follower) {
    return UserRelationItem(
      id: follower.id ?? '',
      nickname: follower.username ?? '',
      avatarUrl: follower.avatarUrl ?? '',
      bio: follower.shortBio ?? '',
      isFriend: false,
      gender: follower.gender ?? 'male',
    );
  }

  factory UserRelationItem.fromFriendModel(UserSummaryModel friend) {
    return UserRelationItem(
      id: friend.id ?? '',
      nickname: friend.username ?? '',
      avatarUrl: friend.avatarUrl ?? '',
      bio: friend.shortBio ?? '',
      isFriend: true,
      gender: friend.gender ?? 'male',
    );
  }
}
