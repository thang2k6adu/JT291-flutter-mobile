// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListResponse {

@JsonKey(name: 'user_id') String? get userId; String? get username;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'following_count') int? get followingCount;@JsonKey(name: 'followers_count') int? get followersCount;@JsonKey(name: 'friends_count') int? get friendsCount; List<UserModel> get data; PaginationModel? get pagination; bool get isPending;
/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListResponseCopyWith<UserListResponse> get copyWith => _$UserListResponseCopyWithImpl<UserListResponse>(this as UserListResponse, _$identity);

  /// Serializes this UserListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.friendsCount, friendsCount) || other.friendsCount == friendsCount)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,username,avatarUrl,followingCount,followersCount,friendsCount,const DeepCollectionEquality().hash(data),pagination,isPending);

@override
String toString() {
  return 'UserListResponse(userId: $userId, username: $username, avatarUrl: $avatarUrl, followingCount: $followingCount, followersCount: $followersCount, friendsCount: $friendsCount, data: $data, pagination: $pagination, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $UserListResponseCopyWith<$Res>  {
  factory $UserListResponseCopyWith(UserListResponse value, $Res Function(UserListResponse) _then) = _$UserListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String? userId, String? username,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'friends_count') int? friendsCount, List<UserModel> data, PaginationModel? pagination, bool isPending
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$UserListResponseCopyWithImpl<$Res>
    implements $UserListResponseCopyWith<$Res> {
  _$UserListResponseCopyWithImpl(this._self, this._then);

  final UserListResponse _self;
  final $Res Function(UserListResponse) _then;

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? username = freezed,Object? avatarUrl = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? friendsCount = freezed,Object? data = null,Object? pagination = freezed,Object? isPending = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,friendsCount: freezed == friendsCount ? _self.friendsCount : friendsCount // ignore: cast_nullable_to_non_nullable
as int?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<UserModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserListResponse].
extension UserListResponsePatterns on UserListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId,  String? username, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'friends_count')  int? friendsCount,  List<UserModel> data,  PaginationModel? pagination,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListResponse() when $default != null:
return $default(_that.userId,_that.username,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.friendsCount,_that.data,_that.pagination,_that.isPending);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId,  String? username, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'friends_count')  int? friendsCount,  List<UserModel> data,  PaginationModel? pagination,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _UserListResponse():
return $default(_that.userId,_that.username,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.friendsCount,_that.data,_that.pagination,_that.isPending);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String? userId,  String? username, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'friends_count')  int? friendsCount,  List<UserModel> data,  PaginationModel? pagination,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _UserListResponse() when $default != null:
return $default(_that.userId,_that.username,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.friendsCount,_that.data,_that.pagination,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserListResponse implements UserListResponse {
  const _UserListResponse({@JsonKey(name: 'user_id') this.userId, this.username, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'following_count') this.followingCount, @JsonKey(name: 'followers_count') this.followersCount, @JsonKey(name: 'friends_count') this.friendsCount, final  List<UserModel> data = const [], this.pagination, this.isPending = false}): _data = data;
  factory _UserListResponse.fromJson(Map<String, dynamic> json) => _$UserListResponseFromJson(json);

@override@JsonKey(name: 'user_id') final  String? userId;
@override final  String? username;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'following_count') final  int? followingCount;
@override@JsonKey(name: 'followers_count') final  int? followersCount;
@override@JsonKey(name: 'friends_count') final  int? friendsCount;
 final  List<UserModel> _data;
@override@JsonKey() List<UserModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel? pagination;
@override@JsonKey() final  bool isPending;

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListResponseCopyWith<_UserListResponse> get copyWith => __$UserListResponseCopyWithImpl<_UserListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.friendsCount, friendsCount) || other.friendsCount == friendsCount)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,username,avatarUrl,followingCount,followersCount,friendsCount,const DeepCollectionEquality().hash(_data),pagination,isPending);

@override
String toString() {
  return 'UserListResponse(userId: $userId, username: $username, avatarUrl: $avatarUrl, followingCount: $followingCount, followersCount: $followersCount, friendsCount: $friendsCount, data: $data, pagination: $pagination, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$UserListResponseCopyWith<$Res> implements $UserListResponseCopyWith<$Res> {
  factory _$UserListResponseCopyWith(_UserListResponse value, $Res Function(_UserListResponse) _then) = __$UserListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String? userId, String? username,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'friends_count') int? friendsCount, List<UserModel> data, PaginationModel? pagination, bool isPending
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$UserListResponseCopyWithImpl<$Res>
    implements _$UserListResponseCopyWith<$Res> {
  __$UserListResponseCopyWithImpl(this._self, this._then);

  final _UserListResponse _self;
  final $Res Function(_UserListResponse) _then;

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? username = freezed,Object? avatarUrl = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? friendsCount = freezed,Object? data = null,Object? pagination = freezed,Object? isPending = null,}) {
  return _then(_UserListResponse(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,friendsCount: freezed == friendsCount ? _self.friendsCount : friendsCount // ignore: cast_nullable_to_non_nullable
as int?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<UserModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UserListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
