// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListResponse _$UserListResponseFromJson(Map<String, dynamic> json) =>
    _UserListResponse(
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      followingCount: (json['following_count'] as num?)?.toInt(),
      followersCount: (json['followers_count'] as num?)?.toInt(),
      friendsCount: (json['friends_count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserSummaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UserListResponseToJson(_UserListResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'friends_count': instance.friendsCount,
      'data': instance.data,
      'pagination': instance.pagination,
    };
