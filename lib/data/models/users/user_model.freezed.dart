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

@JsonKey(name: 'is_deleted') bool get isDeleted;@JsonKey(name: 'union_id') String get unionId;@JsonKey(name: 'is_blocked') bool get isBlocked; dynamic get nickname; String? get gender; String? get bio;@JsonKey(name: 'date_of_birth') DateTime? get dateOfBirth;@JsonKey(name: 'profile_urls') List<String> get profileUrls;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'following_count') int? get followingCount;@JsonKey(name: 'followers_count') int? get followersCount;@JsonKey(name: 'views_count') int? get viewsCount; List<String>? get interests; UserLevelModel? get level; bool get isPending;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.unionId, unionId) || other.unionId == unionId)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&const DeepCollectionEquality().equals(other.nickname, nickname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&const DeepCollectionEquality().equals(other.profileUrls, profileUrls)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.level, level) || other.level == level)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDeleted,unionId,isBlocked,const DeepCollectionEquality().hash(nickname),gender,bio,dateOfBirth,const DeepCollectionEquality().hash(profileUrls),avatarUrl,followingCount,followersCount,viewsCount,const DeepCollectionEquality().hash(interests),level,isPending);

@override
String toString() {
  return 'UserModel(isDeleted: $isDeleted, unionId: $unionId, isBlocked: $isBlocked, nickname: $nickname, gender: $gender, bio: $bio, dateOfBirth: $dateOfBirth, profileUrls: $profileUrls, avatarUrl: $avatarUrl, followingCount: $followingCount, followersCount: $followersCount, viewsCount: $viewsCount, interests: $interests, level: $level, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'union_id') String unionId,@JsonKey(name: 'is_blocked') bool isBlocked, dynamic nickname, String? gender, String? bio,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'profile_urls') List<String> profileUrls,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'views_count') int? viewsCount, List<String>? interests, UserLevelModel? level, bool isPending
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
@pragma('vm:prefer-inline') @override $Res call({Object? isDeleted = null,Object? unionId = null,Object? isBlocked = null,Object? nickname = freezed,Object? gender = freezed,Object? bio = freezed,Object? dateOfBirth = freezed,Object? profileUrls = null,Object? avatarUrl = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? viewsCount = freezed,Object? interests = freezed,Object? level = freezed,Object? isPending = null,}) {
  return _then(_self.copyWith(
isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,unionId: null == unionId ? _self.unionId : unionId // ignore: cast_nullable_to_non_nullable
as String,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as dynamic,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,profileUrls: null == profileUrls ? _self.profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as UserLevelModel?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'union_id')  String unionId, @JsonKey(name: 'is_blocked')  bool isBlocked,  dynamic nickname,  String? gender,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'profile_urls')  List<String> profileUrls, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount,  List<String>? interests,  UserLevelModel? level,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.isDeleted,_that.unionId,_that.isBlocked,_that.nickname,_that.gender,_that.bio,_that.dateOfBirth,_that.profileUrls,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.viewsCount,_that.interests,_that.level,_that.isPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'union_id')  String unionId, @JsonKey(name: 'is_blocked')  bool isBlocked,  dynamic nickname,  String? gender,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'profile_urls')  List<String> profileUrls, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount,  List<String>? interests,  UserLevelModel? level,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.isDeleted,_that.unionId,_that.isBlocked,_that.nickname,_that.gender,_that.bio,_that.dateOfBirth,_that.profileUrls,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.viewsCount,_that.interests,_that.level,_that.isPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'union_id')  String unionId, @JsonKey(name: 'is_blocked')  bool isBlocked,  dynamic nickname,  String? gender,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'profile_urls')  List<String> profileUrls, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount,  List<String>? interests,  UserLevelModel? level,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.isDeleted,_that.unionId,_that.isBlocked,_that.nickname,_that.gender,_that.bio,_that.dateOfBirth,_that.profileUrls,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.viewsCount,_that.interests,_that.level,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({@JsonKey(name: 'is_deleted') this.isDeleted = false, @JsonKey(name: 'union_id') required this.unionId, @JsonKey(name: 'is_blocked') this.isBlocked = false, required this.nickname, this.gender, this.bio, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'profile_urls') final  List<String> profileUrls = const [], @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'following_count') this.followingCount, @JsonKey(name: 'followers_count') this.followersCount, @JsonKey(name: 'views_count') this.viewsCount, final  List<String>? interests, this.level, this.isPending = false}): _profileUrls = profileUrls,_interests = interests;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: 'is_deleted') final  bool isDeleted;
@override@JsonKey(name: 'union_id') final  String unionId;
@override@JsonKey(name: 'is_blocked') final  bool isBlocked;
@override final  dynamic nickname;
@override final  String? gender;
@override final  String? bio;
@override@JsonKey(name: 'date_of_birth') final  DateTime? dateOfBirth;
 final  List<String> _profileUrls;
@override@JsonKey(name: 'profile_urls') List<String> get profileUrls {
  if (_profileUrls is EqualUnmodifiableListView) return _profileUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profileUrls);
}

@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'following_count') final  int? followingCount;
@override@JsonKey(name: 'followers_count') final  int? followersCount;
@override@JsonKey(name: 'views_count') final  int? viewsCount;
 final  List<String>? _interests;
@override List<String>? get interests {
  final value = _interests;
  if (value == null) return null;
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  UserLevelModel? level;
@override@JsonKey() final  bool isPending;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.unionId, unionId) || other.unionId == unionId)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&const DeepCollectionEquality().equals(other.nickname, nickname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&const DeepCollectionEquality().equals(other._profileUrls, _profileUrls)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.level, level) || other.level == level)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDeleted,unionId,isBlocked,const DeepCollectionEquality().hash(nickname),gender,bio,dateOfBirth,const DeepCollectionEquality().hash(_profileUrls),avatarUrl,followingCount,followersCount,viewsCount,const DeepCollectionEquality().hash(_interests),level,isPending);

@override
String toString() {
  return 'UserModel(isDeleted: $isDeleted, unionId: $unionId, isBlocked: $isBlocked, nickname: $nickname, gender: $gender, bio: $bio, dateOfBirth: $dateOfBirth, profileUrls: $profileUrls, avatarUrl: $avatarUrl, followingCount: $followingCount, followersCount: $followersCount, viewsCount: $viewsCount, interests: $interests, level: $level, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'union_id') String unionId,@JsonKey(name: 'is_blocked') bool isBlocked, dynamic nickname, String? gender, String? bio,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'profile_urls') List<String> profileUrls,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'views_count') int? viewsCount, List<String>? interests, UserLevelModel? level, bool isPending
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
@override @pragma('vm:prefer-inline') $Res call({Object? isDeleted = null,Object? unionId = null,Object? isBlocked = null,Object? nickname = freezed,Object? gender = freezed,Object? bio = freezed,Object? dateOfBirth = freezed,Object? profileUrls = null,Object? avatarUrl = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? viewsCount = freezed,Object? interests = freezed,Object? level = freezed,Object? isPending = null,}) {
  return _then(_UserModel(
isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,unionId: null == unionId ? _self.unionId : unionId // ignore: cast_nullable_to_non_nullable
as String,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as dynamic,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,profileUrls: null == profileUrls ? _self._profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,interests: freezed == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as UserLevelModel?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
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
