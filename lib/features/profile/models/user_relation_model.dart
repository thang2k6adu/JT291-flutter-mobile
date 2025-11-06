import 'package:jt291_flutter_mobile/data/models/users/following_model.dart';

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

  factory UserRelationItem.fromFollowingModel(FollowingModel following) {
    final user = following.user!;
    return UserRelationItem(
      id: user.unionId, // hoặc user.id tuỳ backend
      nickname: user.nickname ?? '',
      avatarUrl: user.avatarUrl ?? '',
      bio: user.bio ?? '',
      isFriend: following.isFriend ?? false,
      gender: user.gender ?? 'male',
    );
  }
}
