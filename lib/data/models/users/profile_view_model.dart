import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/viewer_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';

part 'profile_view_model.freezed.dart';
part 'profile_view_model.g.dart';

@freezed
abstract class ProfileViewModel with _$ProfileViewModel {
  const factory ProfileViewModel({
    required String userId,
    required bool canViewFull,
    required int total,
    required List<ViewerModel> views,
    required PaginationModel pagination,
  }) = _ProfileViewModel;

  factory ProfileViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewModelFromJson(json);
}