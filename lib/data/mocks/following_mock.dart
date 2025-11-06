import 'package:jt291_flutter_mobile/data/models/users/following_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/user_mock.dart';

final followingMock = [
  FollowingModel(
    followingId: 'usr_12345',
    createdAt: DateTime.parse('2025-11-06T10:00:00Z'),
    isFriend: false,
    user: userMock[0],
  ),
  FollowingModel(
    followingId: 'usr_67890',
    createdAt: DateTime.parse('2025-10-30T08:12:00Z'),
    isFriend: true,
    user: userMock[1],
  ),
  FollowingModel(
    followingId: 'usr_54321',
    createdAt: DateTime.parse('2025-11-01T12:45:00Z'),
    isFriend: true,
    user: userMock[2],
  ),
];
