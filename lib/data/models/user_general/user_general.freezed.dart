// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_general.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserGeneralModel {

 String? get id;@JsonKey(name: 'is_deleted') bool? get isDeleted;@JsonKey(name: 'union_id') String? get unionId;@JsonKey(name: 'is_blocked') bool? get isBlocked; String? get nickname; String? get gender; String? get bio;@JsonKey(name: 'date_of_birth') DateTime? get dateOfBirth;@JsonKey(name: 'profile_urls') List<String>? get profileUrls;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'following_count') int? get followingCount;@JsonKey(name: 'followers_count') int? get followersCount;@JsonKey(name: 'views_count') int? get viewsCount; List<String>? get interests; LevelModel? get level;
/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserGeneralModelCopyWith<UserGeneralModel> get copyWith => _$UserGeneralModelCopyWithImpl<UserGeneralModel>(this as UserGeneralModel, _$identity);

  /// Serializes this UserGeneralModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserGeneralModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.unionId, unionId) || other.unionId == unionId)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&const DeepCollectionEquality().equals(other.profileUrls, profileUrls)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isDeleted,unionId,isBlocked,nickname,gender,bio,dateOfBirth,const DeepCollectionEquality().hash(profileUrls),avatarUrl,followingCount,followersCount,viewsCount,const DeepCollectionEquality().hash(interests),level);

@override
String toString() {
  return 'UserGeneralModel(id: $id, isDeleted: $isDeleted, unionId: $unionId, isBlocked: $isBlocked, nickname: $nickname, gender: $gender, bio: $bio, dateOfBirth: $dateOfBirth, profileUrls: $profileUrls, avatarUrl: $avatarUrl, followingCount: $followingCount, followersCount: $followersCount, viewsCount: $viewsCount, interests: $interests, level: $level)';
}


}

/// @nodoc
abstract mixin class $UserGeneralModelCopyWith<$Res>  {
  factory $UserGeneralModelCopyWith(UserGeneralModel value, $Res Function(UserGeneralModel) _then) = _$UserGeneralModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'is_deleted') bool? isDeleted,@JsonKey(name: 'union_id') String? unionId,@JsonKey(name: 'is_blocked') bool? isBlocked, String? nickname, String? gender, String? bio,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'profile_urls') List<String>? profileUrls,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'views_count') int? viewsCount, List<String>? interests, LevelModel? level
});


$LevelModelCopyWith<$Res>? get level;

}
/// @nodoc
class _$UserGeneralModelCopyWithImpl<$Res>
    implements $UserGeneralModelCopyWith<$Res> {
  _$UserGeneralModelCopyWithImpl(this._self, this._then);

  final UserGeneralModel _self;
  final $Res Function(UserGeneralModel) _then;

/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? isDeleted = freezed,Object? unionId = freezed,Object? isBlocked = freezed,Object? nickname = freezed,Object? gender = freezed,Object? bio = freezed,Object? dateOfBirth = freezed,Object? profileUrls = freezed,Object? avatarUrl = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? viewsCount = freezed,Object? interests = freezed,Object? level = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,unionId: freezed == unionId ? _self.unionId : unionId // ignore: cast_nullable_to_non_nullable
as String?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,profileUrls: freezed == profileUrls ? _self.profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LevelModel?,
  ));
}
/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelModelCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $LevelModelCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserGeneralModel].
extension UserGeneralModelPatterns on UserGeneralModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserGeneralModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserGeneralModel value)  $default,){
final _that = this;
switch (_that) {
case _UserGeneralModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserGeneralModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'is_deleted')  bool? isDeleted, @JsonKey(name: 'union_id')  String? unionId, @JsonKey(name: 'is_blocked')  bool? isBlocked,  String? nickname,  String? gender,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'profile_urls')  List<String>? profileUrls, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount,  List<String>? interests,  LevelModel? level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
return $default(_that.id,_that.isDeleted,_that.unionId,_that.isBlocked,_that.nickname,_that.gender,_that.bio,_that.dateOfBirth,_that.profileUrls,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.viewsCount,_that.interests,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'is_deleted')  bool? isDeleted, @JsonKey(name: 'union_id')  String? unionId, @JsonKey(name: 'is_blocked')  bool? isBlocked,  String? nickname,  String? gender,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'profile_urls')  List<String>? profileUrls, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount,  List<String>? interests,  LevelModel? level)  $default,) {final _that = this;
switch (_that) {
case _UserGeneralModel():
return $default(_that.id,_that.isDeleted,_that.unionId,_that.isBlocked,_that.nickname,_that.gender,_that.bio,_that.dateOfBirth,_that.profileUrls,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.viewsCount,_that.interests,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'is_deleted')  bool? isDeleted, @JsonKey(name: 'union_id')  String? unionId, @JsonKey(name: 'is_blocked')  bool? isBlocked,  String? nickname,  String? gender,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'profile_urls')  List<String>? profileUrls, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'views_count')  int? viewsCount,  List<String>? interests,  LevelModel? level)?  $default,) {final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
return $default(_that.id,_that.isDeleted,_that.unionId,_that.isBlocked,_that.nickname,_that.gender,_that.bio,_that.dateOfBirth,_that.profileUrls,_that.avatarUrl,_that.followingCount,_that.followersCount,_that.viewsCount,_that.interests,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserGeneralModel implements UserGeneralModel {
  const _UserGeneralModel({this.id, @JsonKey(name: 'is_deleted') this.isDeleted, @JsonKey(name: 'union_id') this.unionId, @JsonKey(name: 'is_blocked') this.isBlocked, this.nickname, this.gender, this.bio, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'profile_urls') final  List<String>? profileUrls, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'following_count') this.followingCount, @JsonKey(name: 'followers_count') this.followersCount, @JsonKey(name: 'views_count') this.viewsCount, final  List<String>? interests, this.level}): _profileUrls = profileUrls,_interests = interests;
  factory _UserGeneralModel.fromJson(Map<String, dynamic> json) => _$UserGeneralModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'is_deleted') final  bool? isDeleted;
@override@JsonKey(name: 'union_id') final  String? unionId;
@override@JsonKey(name: 'is_blocked') final  bool? isBlocked;
@override final  String? nickname;
@override final  String? gender;
@override final  String? bio;
@override@JsonKey(name: 'date_of_birth') final  DateTime? dateOfBirth;
 final  List<String>? _profileUrls;
@override@JsonKey(name: 'profile_urls') List<String>? get profileUrls {
  final value = _profileUrls;
  if (value == null) return null;
  if (_profileUrls is EqualUnmodifiableListView) return _profileUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
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

@override final  LevelModel? level;

/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserGeneralModelCopyWith<_UserGeneralModel> get copyWith => __$UserGeneralModelCopyWithImpl<_UserGeneralModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserGeneralModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserGeneralModel&&(identical(other.id, id) || other.id == id)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.unionId, unionId) || other.unionId == unionId)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&const DeepCollectionEquality().equals(other._profileUrls, _profileUrls)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isDeleted,unionId,isBlocked,nickname,gender,bio,dateOfBirth,const DeepCollectionEquality().hash(_profileUrls),avatarUrl,followingCount,followersCount,viewsCount,const DeepCollectionEquality().hash(_interests),level);

@override
String toString() {
  return 'UserGeneralModel(id: $id, isDeleted: $isDeleted, unionId: $unionId, isBlocked: $isBlocked, nickname: $nickname, gender: $gender, bio: $bio, dateOfBirth: $dateOfBirth, profileUrls: $profileUrls, avatarUrl: $avatarUrl, followingCount: $followingCount, followersCount: $followersCount, viewsCount: $viewsCount, interests: $interests, level: $level)';
}


}

/// @nodoc
abstract mixin class _$UserGeneralModelCopyWith<$Res> implements $UserGeneralModelCopyWith<$Res> {
  factory _$UserGeneralModelCopyWith(_UserGeneralModel value, $Res Function(_UserGeneralModel) _then) = __$UserGeneralModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'is_deleted') bool? isDeleted,@JsonKey(name: 'union_id') String? unionId,@JsonKey(name: 'is_blocked') bool? isBlocked, String? nickname, String? gender, String? bio,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'profile_urls') List<String>? profileUrls,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'views_count') int? viewsCount, List<String>? interests, LevelModel? level
});


@override $LevelModelCopyWith<$Res>? get level;

}
/// @nodoc
class __$UserGeneralModelCopyWithImpl<$Res>
    implements _$UserGeneralModelCopyWith<$Res> {
  __$UserGeneralModelCopyWithImpl(this._self, this._then);

  final _UserGeneralModel _self;
  final $Res Function(_UserGeneralModel) _then;

/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? isDeleted = freezed,Object? unionId = freezed,Object? isBlocked = freezed,Object? nickname = freezed,Object? gender = freezed,Object? bio = freezed,Object? dateOfBirth = freezed,Object? profileUrls = freezed,Object? avatarUrl = freezed,Object? followingCount = freezed,Object? followersCount = freezed,Object? viewsCount = freezed,Object? interests = freezed,Object? level = freezed,}) {
  return _then(_UserGeneralModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,unionId: freezed == unionId ? _self.unionId : unionId // ignore: cast_nullable_to_non_nullable
as String?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,profileUrls: freezed == profileUrls ? _self._profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,interests: freezed == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LevelModel?,
  ));
}

/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelModelCopyWith<$Res>? get level {
    if (_self.level == null) {
    return null;
  }

  return $LevelModelCopyWith<$Res>(_self.level!, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}

// dart format on
