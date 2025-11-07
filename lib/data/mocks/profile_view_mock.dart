import 'package:jt291_flutter_mobile/data/models/users/profile_view_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/viewer_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';

final profileViewMock = ProfileViewModel(
  userId: 'user123',
  canViewFull: true,
  total: 20,
  views: List.generate(20, (i) => ViewerModel(
    viewerId: 'viewer${i + 1}',
    username: 'Viewer ${i + 1}',
    avatarUrl: 'https://example.com/avatar/viewer${i + 1}.png',
    gender: i.isEven ? 'Male' : 'Female',
    shortBio: 'Bio of viewer ${i + 1}',
    viewTime: DateTime.now().subtract(Duration(hours: i)),
  )),
  pagination: PaginationModel(
    limit: 10,
    offset: 0,
    total: 20,
  ),
);
