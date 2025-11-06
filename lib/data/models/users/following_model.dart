import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

part 'following_model.freezed.dart';
part 'following_model.g.dart';

@freezed
abstract class FollowingModel with _$FollowingModel {
  const factory FollowingModel({
    @JsonKey(name: 'following_id') String? followingId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_mutual') bool? isMutual,
    @JsonKey(name: 'is_friend') bool? isFriend,
    @JsonKey(name: 'is_blocked') bool? isBlocked,
    UserModel? user,
  }) = _FollowingModel;

  factory FollowingModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingModelFromJson(json);
}
