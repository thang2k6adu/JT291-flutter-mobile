import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

part 'follower_model.freezed.dart';
part 'follower_model.g.dart';

@freezed
abstract class FollowerModel with _$FollowerModel {
  const factory FollowerModel({
    @JsonKey(name: 'follower_id') String? followerId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_friend') bool? isFriend,
    UserModel? user,
  }) = _FollowerModel;

  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);
}
