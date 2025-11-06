import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
abstract class FriendModel with _$FriendModel {
  const factory FriendModel({
    @JsonKey(name: 'friend_id') String? friendId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    UserModel? user,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);
}
