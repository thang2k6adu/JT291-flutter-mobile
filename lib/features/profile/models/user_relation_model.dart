import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';

class UserRelationItem {
  final String id;
  final String nickname;
  final String avatarUrl;
  final String bio;
  final bool isFollowing;
  final String gender;

  UserRelationItem({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.bio,
    this.isFollowing = false,
    required this.gender,
  });

  factory UserRelationItem.fromFollowingModel(UserSummaryModel following) {
    return UserRelationItem(
      id: following.id ?? '',
      nickname: following.username ?? '',
      avatarUrl: following.avatarUrl ?? '',
      bio: following.shortBio ?? '',
      isFollowing: following.isFollowing ?? false,
      gender: following.gender ?? 'male',
    );
  }

  factory UserRelationItem.fromFollowerModel(UserSummaryModel follower) {
    return UserRelationItem(
      id: follower.id ?? '',
      nickname: follower.username ?? '',
      avatarUrl: follower.avatarUrl ?? '',
      bio: follower.shortBio ?? '',
      isFollowing: follower.isFollowing ?? false,
      gender: follower.gender ?? 'male',
    );
  }

  factory UserRelationItem.fromFriendModel(UserSummaryModel friend) {
    return UserRelationItem(
      id: friend.id ?? '',
      nickname: friend.username ?? '',
      avatarUrl: friend.avatarUrl ?? '',
      bio: friend.shortBio ?? '',
      isFollowing: friend.isFollowing ?? false,
      gender: friend.gender ?? 'male',
    );
  }
}
