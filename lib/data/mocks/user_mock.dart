import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_level_model.dart';

final userMock = [
  UserModel(
    unionId: 'usr_12345',
    nickname: 'Minh Tran',
    gender: 'male',
    bio: 'Coffee ☕ + Flutter 💙',
    avatarUrl: 'https://cdn.example.com/avatar/usr_12345.png',
    followingCount: 180,
    followersCount: 302,
    viewsCount: 1200,
    interests: ['Flutter', 'Coffee', 'Coding'],
    level: UserLevelModel(currentLevel: 12, currentExp: 100, totalExp: 1000, nextLevelExp: 1000),
  ),
  UserModel(
    unionId: 'usr_67890',
    nickname: 'Linh Dev',
    gender: 'female',
    bio: 'Building mobile apps 🚀',
    avatarUrl: 'https://cdn.example.com/avatar/usr_67890.png',
    followingCount: 210,
    followersCount: 142,
    viewsCount: 800,
    interests: ['Mobile', 'Dart', 'Design'],
    level: UserLevelModel(currentLevel: 8, currentExp: 100, totalExp: 1000, nextLevelExp: 1000),
  ),
  UserModel(
    unionId: 'usr_54321',
    nickname: 'Hieu Nguyen',
    gender: 'male',
    bio: 'Loves gaming and tech 🎮💻',
    avatarUrl: 'https://cdn.example.com/avatar/usr_54321.png',
    followingCount: 90,
    followersCount: 200,
    viewsCount: 400,
    interests: ['Gaming', 'Flutter'],
    level: UserLevelModel(currentLevel: 5, currentExp: 100, totalExp: 1000, nextLevelExp: 1000),
  ),
];
