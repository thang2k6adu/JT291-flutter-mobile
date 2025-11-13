import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

class UserRelationItem {
  final String id;
  final String nickname;
  final String avatarUrl;
  final String bio;
  final bool isFollowing;
  final String gender;
  final bool isPending;

  UserRelationItem({
    required this.id,
    required this.nickname,
    required this.avatarUrl,
    required this.bio,
    this.isFollowing = false,
    required this.gender,
    this.isPending = false,
  });

  factory UserRelationItem.fromFollowingModel(UserModel following) {
    return UserRelationItem(
      id: following.id,
      nickname: following.nickname,
      avatarUrl: following.avatar,
      bio: following.bio ?? '',
      isFollowing: following.isFollowing,
      gender: following.gender ?? 'male',
      isPending: following.isPending,
    );
  }

  factory UserRelationItem.fromFollowerModel(UserModel follower) {
    return UserRelationItem(
      id: follower.id,
      nickname: follower.nickname,
      avatarUrl: follower.avatar,
      bio: follower.bio ?? '',
      isFollowing: follower.isFollowing,
      gender: follower.gender ?? 'male',
      isPending: follower.isPending,
    );
  }

  factory UserRelationItem.fromFriendModel(UserModel friend) {
    return UserRelationItem(
      id: friend.id,
      nickname: friend.nickname,
      avatarUrl: friend.avatar,
      bio: friend.bio ?? '',
      isFollowing: friend.isFollowing,
      gender: friend.gender ?? 'male',
      isPending: friend.isPending,
    );
  }
}
