import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_relationship_model.freezed.dart';
part 'user_relationship_model.g.dart';

/// Model chứa thông tin quan hệ giữa current user và user khác
@freezed
abstract class UserRelationshipModel with _$UserRelationshipModel {
  const factory UserRelationshipModel({
    /// User có đang follow người này không
    @Default(false) @JsonKey(name: 'is_following') bool isFollowing,
    
    /// User có đang bị người này follow không
    @Default(false) @JsonKey(name: 'is_follower') bool isFollower,
    
    /// Có phải bạn bè không (cả 2 follow nhau)
    @Default(false) @JsonKey(name: 'is_friend') bool isFriend,
    
    /// Có phải chính mình không
    @Default(false) @JsonKey(name: 'is_me') bool isMe,
    
    /// Có bị block không
    @Default(false) @JsonKey(name: 'is_blocked') bool isBlocked,
  }) = _UserRelationshipModel;

  factory UserRelationshipModel.fromJson(Map<String, Object?> json) =>
      _$UserRelationshipModelFromJson(json);
}

