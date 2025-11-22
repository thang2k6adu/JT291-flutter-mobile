// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

// ========================================
// Basic Info (always present)
// ========================================
 String get id;@JsonKey(name: 'union_id') String? get unionId; String get nickname;// ========================================
// Profile Info
// ========================================
@JsonKey(name: 'avatar', fromJson: _stringFromJson) String? get avatar;@JsonKey(fromJson: _nullableString) String? get bio;@JsonKey(fromJson: _nullableString) String? get gender;@JsonKey(name: 'birthday') DateTime? get birthday;// ========================================
// Additional Profile Data
// ========================================
@JsonKey(name: 'profile_urls', fromJson: _listStringFromJson) List<String> get profileUrls;@JsonKey(fromJson: _listStringFromJsonNullable) List<String>? get interests;// ========================================
// Stats
// ========================================
@JsonKey(name: 'following_count') int? get followingCount;@JsonKey(name: 'followers_count') int? get followersCount;@JsonKey(name: 'views_count') int? get viewsCount;// ========================================
// Relationship Status
// ========================================
@JsonKey(name: 'is_following') bool get isFollowing;@JsonKey(name: 'is_follower') bool get isFollower;@JsonKey(name: 'is_friend') bool get isFriend;@JsonKey(name: 'follow_status') String get followStatus;@JsonKey(name: 'mutual_followers_count') int get mutualFollowersCount;// ========================================
// Flags
// ========================================
@JsonKey(name: 'role') String get role;@JsonKey(name: 'is_deleted') bool get isDeleted;@JsonKey(name: 'is_blocked') bool get isBlocked; bool get isPending;// ========================================
// Level
// ========================================
 UserLevelModel? get level;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.unionId, unionId) || other.unionId == unionId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&const DeepCollectionEquality().equals(other.profileUrls, profileUrls)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isFollower, isFollower) || other.isFollower == isFollower)&&(identical(other.isFriend, isFriend) || other.isFriend == isFriend)&&(identical(other.followStatus, followStatus) || other.followStatus == followStatus)&&(identical(other.mutualFollowersCount, mutualFollowersCount) || other.mutualFollowersCount == mutualFollowersCount)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,unionId,nickname,avatar,bio,gender,birthday,const DeepCollectionEquality().hash(profileUrls),const DeepCollectionEquality().hash(interests),followingCount,followersCount,viewsCount,isFollowing,isFollower,isFriend,followStatus,mutualFollowersCount,role,isDeleted,isBlocked,isPending,level]);

@override
String toString() {
  return 'UserModel(id: $id, unionId: $unionId, nickname: $nickname, avatar: $avatar, bio: $bio, gender: $gender, birthday: $birthday, profileUrls: $profileUrls, interests: $interests, followingCount: $followingCount, followersCount: $followersCount, viewsCount: $viewsCount, isFollowing: $isFollowing, isFollower: $isFollower, isFriend: $isFriend, followStatus: $followStatus, mutualFollowersCount: $mutualFollowersCount, role: $role, isDeleted: $isDeleted, isBlocked: $isBlocked, isPending: $isPending, level: $level)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'union_id') String? unionId, String nickname,@JsonKey(name: 'avatar', fromJson: _stringFromJson) String? avatar,@JsonKey(fromJson: _nullableString) String? bio,@JsonKey(fromJson: _nullableString) String? gender,@JsonKey(name: 'birthday') DateTime? birthday,@JsonKey(name: 'profile_urls', fromJson: _listStringFromJson) List<String> profileUrls,@JsonKey(fromJson: _listStringFromJsonNullable) List<String>? interests,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'views_count') int? viewsCount,@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'is_follower') bool isFollower,@JsonKey(name: 'is_friend') bool isFriend,@JsonKey(name: 'follow_status') String followStatus,@JsonKey(name: 'mutual_followers_count') int mutualFollowersCount,@JsonKey(name: 'role') String role,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'is_blocked') bool isBlocked, bool isPending, UserLevelModel? level
});


$UserLevelModelCopyWith<$Res>? get level;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? unionId = freezed,Object? nickname = null,Object? avatar = freezed,Object? bio = freezed,Object? gender = freezed,Object? birthday = freezed,Object? profileUrls = null,Object? interests = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? viewsCount = freezed,Object? isFollowing = null,Object? isFollower = null,Object? isFriend = null,Object? followStatus = null,Object? mutualFollowersCount = null,Object? role = null,Object? isDeleted = null,Object? isBlocked = null,Object? isPending = null,Object? level = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,unionId: freezed == unionId ? _self.unionId : unionId // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,profileUrls: null == profileUrls ? _self.profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isFollower: null == isFollower ? _self.isFollower : isFollower // ignore: cast_nullable_to_non_nullable
as bool,isFriend: null == isFriend ? _self.isFriend : isFriend // ignore: cast_nullable_to_non_nullable
as bool,followStatus: null == followStatus ? _self.followStatus : followStatus // ignore: cast_nullable_to_non_nullable
as String,mutualFollowersCount: null == mutualFollowersCount ? _self.mutualFollowersCount : mutualFollowersCount // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as UserLevelModel?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLevelModelCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $UserLevelModelCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'union_id')  String? unionId,  String nickname, @JsonKey(name: 'avatar', fromJson: _stringFromJson)  String? avatar, @JsonKey(fromJson: _nullableString)  String? bio, @JsonKey(fromJson: _nullableString)  String? gender, @JsonKey(name: 'birthday')  DateTime? birthday, @JsonKey(name: 'profile_urls', fromJson: _listStringFromJson)  List<String> profileUrls, @JsonKey(fromJson: _listStringFromJsonNullable)  List<String>? interests, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_follower')  bool isFollower, @JsonKey(name: 'is_friend')  bool isFriend, @JsonKey(name: 'follow_status')  String followStatus, @JsonKey(name: 'mutual_followers_count')  int mutualFollowersCount, @JsonKey(name: 'role')  String role, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_blocked')  bool isBlocked,  bool isPending,  UserLevelModel? level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.unionId,_that.nickname,_that.avatar,_that.bio,_that.gender,_that.birthday,_that.profileUrls,_that.interests,_that.followingCount,_that.followersCount,_that.viewsCount,_that.isFollowing,_that.isFollower,_that.isFriend,_that.followStatus,_that.mutualFollowersCount,_that.role,_that.isDeleted,_that.isBlocked,_that.isPending,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'union_id')  String? unionId,  String nickname, @JsonKey(name: 'avatar', fromJson: _stringFromJson)  String? avatar, @JsonKey(fromJson: _nullableString)  String? bio, @JsonKey(fromJson: _nullableString)  String? gender, @JsonKey(name: 'birthday')  DateTime? birthday, @JsonKey(name: 'profile_urls', fromJson: _listStringFromJson)  List<String> profileUrls, @JsonKey(fromJson: _listStringFromJsonNullable)  List<String>? interests, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_follower')  bool isFollower, @JsonKey(name: 'is_friend')  bool isFriend, @JsonKey(name: 'follow_status')  String followStatus, @JsonKey(name: 'mutual_followers_count')  int mutualFollowersCount, @JsonKey(name: 'role')  String role, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_blocked')  bool isBlocked,  bool isPending,  UserLevelModel? level)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.unionId,_that.nickname,_that.avatar,_that.bio,_that.gender,_that.birthday,_that.profileUrls,_that.interests,_that.followingCount,_that.followersCount,_that.viewsCount,_that.isFollowing,_that.isFollower,_that.isFriend,_that.followStatus,_that.mutualFollowersCount,_that.role,_that.isDeleted,_that.isBlocked,_that.isPending,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'union_id')  String? unionId,  String nickname, @JsonKey(name: 'avatar', fromJson: _stringFromJson)  String? avatar, @JsonKey(fromJson: _nullableString)  String? bio, @JsonKey(fromJson: _nullableString)  String? gender, @JsonKey(name: 'birthday')  DateTime? birthday, @JsonKey(name: 'profile_urls', fromJson: _listStringFromJson)  List<String> profileUrls, @JsonKey(fromJson: _listStringFromJsonNullable)  List<String>? interests, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_follower')  bool isFollower, @JsonKey(name: 'is_friend')  bool isFriend, @JsonKey(name: 'follow_status')  String followStatus, @JsonKey(name: 'mutual_followers_count')  int mutualFollowersCount, @JsonKey(name: 'role')  String role, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_blocked')  bool isBlocked,  bool isPending,  UserLevelModel? level)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.unionId,_that.nickname,_that.avatar,_that.bio,_that.gender,_that.birthday,_that.profileUrls,_that.interests,_that.followingCount,_that.followersCount,_that.viewsCount,_that.isFollowing,_that.isFollower,_that.isFriend,_that.followStatus,_that.mutualFollowersCount,_that.role,_that.isDeleted,_that.isBlocked,_that.isPending,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, @JsonKey(name: 'union_id') this.unionId, required this.nickname, @JsonKey(name: 'avatar', fromJson: _stringFromJson) this.avatar = '', @JsonKey(fromJson: _nullableString) this.bio, @JsonKey(fromJson: _nullableString) this.gender, @JsonKey(name: 'birthday') this.birthday, @JsonKey(name: 'profile_urls', fromJson: _listStringFromJson) final  List<String> profileUrls = const [], @JsonKey(fromJson: _listStringFromJsonNullable) final  List<String>? interests = const [], @JsonKey(name: 'following_count') this.followingCount, @JsonKey(name: 'followers_count') this.followersCount, @JsonKey(name: 'views_count') this.viewsCount, @JsonKey(name: 'is_following') this.isFollowing = false, @JsonKey(name: 'is_follower') this.isFollower = false, @JsonKey(name: 'is_friend') this.isFriend = false, @JsonKey(name: 'follow_status') this.followStatus = 'not_following', @JsonKey(name: 'mutual_followers_count') this.mutualFollowersCount = 0, @JsonKey(name: 'role') this.role = 'user', @JsonKey(name: 'is_deleted') this.isDeleted = false, @JsonKey(name: 'is_blocked') this.isBlocked = false, this.isPending = false, this.level}): _profileUrls = profileUrls,_interests = interests;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

// ========================================
// Basic Info (always present)
// ========================================
@override final  String id;
@override@JsonKey(name: 'union_id') final  String? unionId;
@override final  String nickname;
// ========================================
// Profile Info
// ========================================
@override@JsonKey(name: 'avatar', fromJson: _stringFromJson) final  String? avatar;
@override@JsonKey(fromJson: _nullableString) final  String? bio;
@override@JsonKey(fromJson: _nullableString) final  String? gender;
@override@JsonKey(name: 'birthday') final  DateTime? birthday;
// ========================================
// Additional Profile Data
// ========================================
 final  List<String> _profileUrls;
// ========================================
// Additional Profile Data
// ========================================
@override@JsonKey(name: 'profile_urls', fromJson: _listStringFromJson) List<String> get profileUrls {
  if (_profileUrls is EqualUnmodifiableListView) return _profileUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profileUrls);
}

 final  List<String>? _interests;
@override@JsonKey(fromJson: _listStringFromJsonNullable) List<String>? get interests {
  final value = _interests;
  if (value == null) return null;
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// ========================================
// Stats
// ========================================
@override@JsonKey(name: 'following_count') final  int? followingCount;
@override@JsonKey(name: 'followers_count') final  int? followersCount;
@override@JsonKey(name: 'views_count') final  int? viewsCount;
// ========================================
// Relationship Status
// ========================================
@override@JsonKey(name: 'is_following') final  bool isFollowing;
@override@JsonKey(name: 'is_follower') final  bool isFollower;
@override@JsonKey(name: 'is_friend') final  bool isFriend;
@override@JsonKey(name: 'follow_status') final  String followStatus;
@override@JsonKey(name: 'mutual_followers_count') final  int mutualFollowersCount;
// ========================================
// Flags
// ========================================
@override@JsonKey(name: 'role') final  String role;
@override@JsonKey(name: 'is_deleted') final  bool isDeleted;
@override@JsonKey(name: 'is_blocked') final  bool isBlocked;
@override@JsonKey() final  bool isPending;
// ========================================
// Level
// ========================================
@override final  UserLevelModel? level;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.unionId, unionId) || other.unionId == unionId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&const DeepCollectionEquality().equals(other._profileUrls, _profileUrls)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isFollower, isFollower) || other.isFollower == isFollower)&&(identical(other.isFriend, isFriend) || other.isFriend == isFriend)&&(identical(other.followStatus, followStatus) || other.followStatus == followStatus)&&(identical(other.mutualFollowersCount, mutualFollowersCount) || other.mutualFollowersCount == mutualFollowersCount)&&(identical(other.role, role) || other.role == role)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,unionId,nickname,avatar,bio,gender,birthday,const DeepCollectionEquality().hash(_profileUrls),const DeepCollectionEquality().hash(_interests),followingCount,followersCount,viewsCount,isFollowing,isFollower,isFriend,followStatus,mutualFollowersCount,role,isDeleted,isBlocked,isPending,level]);

@override
String toString() {
  return 'UserModel(id: $id, unionId: $unionId, nickname: $nickname, avatar: $avatar, bio: $bio, gender: $gender, birthday: $birthday, profileUrls: $profileUrls, interests: $interests, followingCount: $followingCount, followersCount: $followersCount, viewsCount: $viewsCount, isFollowing: $isFollowing, isFollower: $isFollower, isFriend: $isFriend, followStatus: $followStatus, mutualFollowersCount: $mutualFollowersCount, role: $role, isDeleted: $isDeleted, isBlocked: $isBlocked, isPending: $isPending, level: $level)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'union_id') String? unionId, String nickname,@JsonKey(name: 'avatar', fromJson: _stringFromJson) String? avatar,@JsonKey(fromJson: _nullableString) String? bio,@JsonKey(fromJson: _nullableString) String? gender,@JsonKey(name: 'birthday') DateTime? birthday,@JsonKey(name: 'profile_urls', fromJson: _listStringFromJson) List<String> profileUrls,@JsonKey(fromJson: _listStringFromJsonNullable) List<String>? interests,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'views_count') int? viewsCount,@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'is_follower') bool isFollower,@JsonKey(name: 'is_friend') bool isFriend,@JsonKey(name: 'follow_status') String followStatus,@JsonKey(name: 'mutual_followers_count') int mutualFollowersCount,@JsonKey(name: 'role') String role,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'is_blocked') bool isBlocked, bool isPending, UserLevelModel? level
});


@override $UserLevelModelCopyWith<$Res>? get level;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? unionId = freezed,Object? nickname = null,Object? avatar = freezed,Object? bio = freezed,Object? gender = freezed,Object? birthday = freezed,Object? profileUrls = null,Object? interests = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? viewsCount = freezed,Object? isFollowing = null,Object? isFollower = null,Object? isFriend = null,Object? followStatus = null,Object? mutualFollowersCount = null,Object? role = null,Object? isDeleted = null,Object? isBlocked = null,Object? isPending = null,Object? level = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,unionId: freezed == unionId ? _self.unionId : unionId // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,profileUrls: null == profileUrls ? _self._profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>,interests: freezed == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isFollower: null == isFollower ? _self.isFollower : isFollower // ignore: cast_nullable_to_non_nullable
as bool,isFriend: null == isFriend ? _self.isFriend : isFriend // ignore: cast_nullable_to_non_nullable
as bool,followStatus: null == followStatus ? _self.followStatus : followStatus // ignore: cast_nullable_to_non_nullable
as String,mutualFollowersCount: null == mutualFollowersCount ? _self.mutualFollowersCount : mutualFollowersCount // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as UserLevelModel?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLevelModelCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $UserLevelModelCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}

// dart format on
