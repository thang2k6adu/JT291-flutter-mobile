import 'package:jt291_flutter_mobile/data/models/users/friend_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/user_mock.dart';

final friendMock = [
  FriendModel(
    friendId: 'usr_67890',
    createdAt: DateTime.parse('2025-10-30T08:12:00Z'),
    user: userMock[1],
  ),
  FriendModel(
    friendId: 'usr_54321',
    createdAt: DateTime.parse('2025-11-01T12:45:00Z'),
    user: userMock[2],
  ),
];
