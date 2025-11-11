// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSummaryModel {

 String? get id; String? get uid; String? get username; String? get nickname;@JsonKey(name: 'avatar_url') String get avatarUrl; String? get bio; String? get gender;@JsonKey(name: 'short_bio') String get shortBio;@JsonKey(name: 'is_following') bool get isFollowing;@JsonKey(name: 'follow_status') String get followStatus; bool get verified;@JsonKey(name: 'mutual_followers_count') int get mutualFollowersCount; bool get isPending;
/// Create a copy of UserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSummaryModelCopyWith<UserSummaryModel> get copyWith => _$UserSummaryModelCopyWithImpl<UserSummaryModel>(this as UserSummaryModel, _$identity);

  /// Serializes this UserSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.shortBio, shortBio) || other.shortBio == shortBio)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.followStatus, followStatus) || other.followStatus == followStatus)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.mutualFollowersCount, mutualFollowersCount) || other.mutualFollowersCount == mutualFollowersCount)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,username,nickname,avatarUrl,bio,gender,shortBio,isFollowing,followStatus,verified,mutualFollowersCount,isPending);

@override
String toString() {
  return 'UserSummaryModel(id: $id, uid: $uid, username: $username, nickname: $nickname, avatarUrl: $avatarUrl, bio: $bio, gender: $gender, shortBio: $shortBio, isFollowing: $isFollowing, followStatus: $followStatus, verified: $verified, mutualFollowersCount: $mutualFollowersCount, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $UserSummaryModelCopyWith<$Res>  {
  factory $UserSummaryModelCopyWith(UserSummaryModel value, $Res Function(UserSummaryModel) _then) = _$UserSummaryModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? uid, String? username, String? nickname,@JsonKey(name: 'avatar_url') String avatarUrl, String? bio, String? gender,@JsonKey(name: 'short_bio') String shortBio,@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'follow_status') String followStatus, bool verified,@JsonKey(name: 'mutual_followers_count') int mutualFollowersCount, bool isPending
});




}
/// @nodoc
class _$UserSummaryModelCopyWithImpl<$Res>
    implements $UserSummaryModelCopyWith<$Res> {
  _$UserSummaryModelCopyWithImpl(this._self, this._then);

  final UserSummaryModel _self;
  final $Res Function(UserSummaryModel) _then;

/// Create a copy of UserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? username = freezed,Object? nickname = freezed,Object? avatarUrl = null,Object? bio = freezed,Object? gender = freezed,Object? shortBio = null,Object? isFollowing = null,Object? followStatus = null,Object? verified = null,Object? mutualFollowersCount = null,Object? isPending = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,shortBio: null == shortBio ? _self.shortBio : shortBio // ignore: cast_nullable_to_non_nullable
as String,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,followStatus: null == followStatus ? _self.followStatus : followStatus // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,mutualFollowersCount: null == mutualFollowersCount ? _self.mutualFollowersCount : mutualFollowersCount // ignore: cast_nullable_to_non_nullable
as int,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSummaryModel].
extension UserSummaryModelPatterns on UserSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _UserSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? uid,  String? username,  String? nickname, @JsonKey(name: 'avatar_url')  String avatarUrl,  String? bio,  String? gender, @JsonKey(name: 'short_bio')  String shortBio, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'follow_status')  String followStatus,  bool verified, @JsonKey(name: 'mutual_followers_count')  int mutualFollowersCount,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSummaryModel() when $default != null:
return $default(_that.id,_that.uid,_that.username,_that.nickname,_that.avatarUrl,_that.bio,_that.gender,_that.shortBio,_that.isFollowing,_that.followStatus,_that.verified,_that.mutualFollowersCount,_that.isPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? uid,  String? username,  String? nickname, @JsonKey(name: 'avatar_url')  String avatarUrl,  String? bio,  String? gender, @JsonKey(name: 'short_bio')  String shortBio, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'follow_status')  String followStatus,  bool verified, @JsonKey(name: 'mutual_followers_count')  int mutualFollowersCount,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _UserSummaryModel():
return $default(_that.id,_that.uid,_that.username,_that.nickname,_that.avatarUrl,_that.bio,_that.gender,_that.shortBio,_that.isFollowing,_that.followStatus,_that.verified,_that.mutualFollowersCount,_that.isPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? uid,  String? username,  String? nickname, @JsonKey(name: 'avatar_url')  String avatarUrl,  String? bio,  String? gender, @JsonKey(name: 'short_bio')  String shortBio, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'follow_status')  String followStatus,  bool verified, @JsonKey(name: 'mutual_followers_count')  int mutualFollowersCount,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _UserSummaryModel() when $default != null:
return $default(_that.id,_that.uid,_that.username,_that.nickname,_that.avatarUrl,_that.bio,_that.gender,_that.shortBio,_that.isFollowing,_that.followStatus,_that.verified,_that.mutualFollowersCount,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSummaryModel implements UserSummaryModel {
  const _UserSummaryModel({this.id, this.uid, this.username, this.nickname, @JsonKey(name: 'avatar_url') this.avatarUrl = '', this.bio, this.gender, @JsonKey(name: 'short_bio') this.shortBio = '', @JsonKey(name: 'is_following') this.isFollowing = false, @JsonKey(name: 'follow_status') this.followStatus = 'not_following', this.verified = false, @JsonKey(name: 'mutual_followers_count') this.mutualFollowersCount = 0, this.isPending = false});
  factory _UserSummaryModel.fromJson(Map<String, dynamic> json) => _$UserSummaryModelFromJson(json);

@override final  String? id;
@override final  String? uid;
@override final  String? username;
@override final  String? nickname;
@override@JsonKey(name: 'avatar_url') final  String avatarUrl;
@override final  String? bio;
@override final  String? gender;
@override@JsonKey(name: 'short_bio') final  String shortBio;
@override@JsonKey(name: 'is_following') final  bool isFollowing;
@override@JsonKey(name: 'follow_status') final  String followStatus;
@override@JsonKey() final  bool verified;
@override@JsonKey(name: 'mutual_followers_count') final  int mutualFollowersCount;
@override@JsonKey() final  bool isPending;

/// Create a copy of UserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSummaryModelCopyWith<_UserSummaryModel> get copyWith => __$UserSummaryModelCopyWithImpl<_UserSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.shortBio, shortBio) || other.shortBio == shortBio)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.followStatus, followStatus) || other.followStatus == followStatus)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.mutualFollowersCount, mutualFollowersCount) || other.mutualFollowersCount == mutualFollowersCount)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,username,nickname,avatarUrl,bio,gender,shortBio,isFollowing,followStatus,verified,mutualFollowersCount,isPending);

@override
String toString() {
  return 'UserSummaryModel(id: $id, uid: $uid, username: $username, nickname: $nickname, avatarUrl: $avatarUrl, bio: $bio, gender: $gender, shortBio: $shortBio, isFollowing: $isFollowing, followStatus: $followStatus, verified: $verified, mutualFollowersCount: $mutualFollowersCount, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$UserSummaryModelCopyWith<$Res> implements $UserSummaryModelCopyWith<$Res> {
  factory _$UserSummaryModelCopyWith(_UserSummaryModel value, $Res Function(_UserSummaryModel) _then) = __$UserSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? uid, String? username, String? nickname,@JsonKey(name: 'avatar_url') String avatarUrl, String? bio, String? gender,@JsonKey(name: 'short_bio') String shortBio,@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'follow_status') String followStatus, bool verified,@JsonKey(name: 'mutual_followers_count') int mutualFollowersCount, bool isPending
});




}
/// @nodoc
class __$UserSummaryModelCopyWithImpl<$Res>
    implements _$UserSummaryModelCopyWith<$Res> {
  __$UserSummaryModelCopyWithImpl(this._self, this._then);

  final _UserSummaryModel _self;
  final $Res Function(_UserSummaryModel) _then;

/// Create a copy of UserSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? username = freezed,Object? nickname = freezed,Object? avatarUrl = null,Object? bio = freezed,Object? gender = freezed,Object? shortBio = null,Object? isFollowing = null,Object? followStatus = null,Object? verified = null,Object? mutualFollowersCount = null,Object? isPending = null,}) {
  return _then(_UserSummaryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,shortBio: null == shortBio ? _self.shortBio : shortBio // ignore: cast_nullable_to_non_nullable
as String,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,followStatus: null == followStatus ? _self.followStatus : followStatus // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,mutualFollowersCount: null == mutualFollowersCount ? _self.mutualFollowersCount : mutualFollowersCount // ignore: cast_nullable_to_non_nullable
as int,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
