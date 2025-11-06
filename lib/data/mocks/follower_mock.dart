import 'package:jt291_flutter_mobile/data/models/users/follower_model.dart';
import 'user_mock.dart';

final followerMock = [
  FollowerModel(
    followerId: 'usr_67890',
    createdAt: DateTime.parse('2025-10-30T08:12:00Z'),
    isFriend: true,
    user: userMock[1],
  ),
  FollowerModel(
    followerId: 'usr_54321',
    createdAt: DateTime.parse('2025-11-01T12:45:00Z'),
    isFriend: false,
    user: userMock[2],
  ),
  FollowerModel(
    followerId: 'usr_12345',
    createdAt: DateTime.parse('2025-11-06T10:00:00Z'),
    isFriend: false,
    user: userMock[0],
  ),
];
