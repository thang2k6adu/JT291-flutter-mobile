// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_relationship_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRelationshipModel {

/// User có đang follow người này không
@JsonKey(name: 'is_following') bool get isFollowing;/// User có đang bị người này follow không
@JsonKey(name: 'is_follower') bool get isFollower;/// Có phải bạn bè không (cả 2 follow nhau)
@JsonKey(name: 'is_friend') bool get isFriend;/// Có phải chính mình không
@JsonKey(name: 'is_me') bool get isMe;/// Có bị block không
@JsonKey(name: 'is_blocked') bool get isBlocked;
/// Create a copy of UserRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRelationshipModelCopyWith<UserRelationshipModel> get copyWith => _$UserRelationshipModelCopyWithImpl<UserRelationshipModel>(this as UserRelationshipModel, _$identity);

  /// Serializes this UserRelationshipModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRelationshipModel&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isFollower, isFollower) || other.isFollower == isFollower)&&(identical(other.isFriend, isFriend) || other.isFriend == isFriend)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFollowing,isFollower,isFriend,isMe,isBlocked);

@override
String toString() {
  return 'UserRelationshipModel(isFollowing: $isFollowing, isFollower: $isFollower, isFriend: $isFriend, isMe: $isMe, isBlocked: $isBlocked)';
}


}

/// @nodoc
abstract mixin class $UserRelationshipModelCopyWith<$Res>  {
  factory $UserRelationshipModelCopyWith(UserRelationshipModel value, $Res Function(UserRelationshipModel) _then) = _$UserRelationshipModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'is_follower') bool isFollower,@JsonKey(name: 'is_friend') bool isFriend,@JsonKey(name: 'is_me') bool isMe,@JsonKey(name: 'is_blocked') bool isBlocked
});




}
/// @nodoc
class _$UserRelationshipModelCopyWithImpl<$Res>
    implements $UserRelationshipModelCopyWith<$Res> {
  _$UserRelationshipModelCopyWithImpl(this._self, this._then);

  final UserRelationshipModel _self;
  final $Res Function(UserRelationshipModel) _then;

/// Create a copy of UserRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFollowing = null,Object? isFollower = null,Object? isFriend = null,Object? isMe = null,Object? isBlocked = null,}) {
  return _then(_self.copyWith(
isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isFollower: null == isFollower ? _self.isFollower : isFollower // ignore: cast_nullable_to_non_nullable
as bool,isFriend: null == isFriend ? _self.isFriend : isFriend // ignore: cast_nullable_to_non_nullable
as bool,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRelationshipModel].
extension UserRelationshipModelPatterns on UserRelationshipModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRelationshipModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRelationshipModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRelationshipModel value)  $default,){
final _that = this;
switch (_that) {
case _UserRelationshipModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRelationshipModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserRelationshipModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_follower')  bool isFollower, @JsonKey(name: 'is_friend')  bool isFriend, @JsonKey(name: 'is_me')  bool isMe, @JsonKey(name: 'is_blocked')  bool isBlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRelationshipModel() when $default != null:
return $default(_that.isFollowing,_that.isFollower,_that.isFriend,_that.isMe,_that.isBlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_follower')  bool isFollower, @JsonKey(name: 'is_friend')  bool isFriend, @JsonKey(name: 'is_me')  bool isMe, @JsonKey(name: 'is_blocked')  bool isBlocked)  $default,) {final _that = this;
switch (_that) {
case _UserRelationshipModel():
return $default(_that.isFollowing,_that.isFollower,_that.isFriend,_that.isMe,_that.isBlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_follower')  bool isFollower, @JsonKey(name: 'is_friend')  bool isFriend, @JsonKey(name: 'is_me')  bool isMe, @JsonKey(name: 'is_blocked')  bool isBlocked)?  $default,) {final _that = this;
switch (_that) {
case _UserRelationshipModel() when $default != null:
return $default(_that.isFollowing,_that.isFollower,_that.isFriend,_that.isMe,_that.isBlocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRelationshipModel implements UserRelationshipModel {
  const _UserRelationshipModel({@JsonKey(name: 'is_following') this.isFollowing = false, @JsonKey(name: 'is_follower') this.isFollower = false, @JsonKey(name: 'is_friend') this.isFriend = false, @JsonKey(name: 'is_me') this.isMe = false, @JsonKey(name: 'is_blocked') this.isBlocked = false});
  factory _UserRelationshipModel.fromJson(Map<String, dynamic> json) => _$UserRelationshipModelFromJson(json);

/// User có đang follow người này không
@override@JsonKey(name: 'is_following') final  bool isFollowing;
/// User có đang bị người này follow không
@override@JsonKey(name: 'is_follower') final  bool isFollower;
/// Có phải bạn bè không (cả 2 follow nhau)
@override@JsonKey(name: 'is_friend') final  bool isFriend;
/// Có phải chính mình không
@override@JsonKey(name: 'is_me') final  bool isMe;
/// Có bị block không
@override@JsonKey(name: 'is_blocked') final  bool isBlocked;

/// Create a copy of UserRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRelationshipModelCopyWith<_UserRelationshipModel> get copyWith => __$UserRelationshipModelCopyWithImpl<_UserRelationshipModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRelationshipModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRelationshipModel&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isFollower, isFollower) || other.isFollower == isFollower)&&(identical(other.isFriend, isFriend) || other.isFriend == isFriend)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isFollowing,isFollower,isFriend,isMe,isBlocked);

@override
String toString() {
  return 'UserRelationshipModel(isFollowing: $isFollowing, isFollower: $isFollower, isFriend: $isFriend, isMe: $isMe, isBlocked: $isBlocked)';
}


}

/// @nodoc
abstract mixin class _$UserRelationshipModelCopyWith<$Res> implements $UserRelationshipModelCopyWith<$Res> {
  factory _$UserRelationshipModelCopyWith(_UserRelationshipModel value, $Res Function(_UserRelationshipModel) _then) = __$UserRelationshipModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'is_follower') bool isFollower,@JsonKey(name: 'is_friend') bool isFriend,@JsonKey(name: 'is_me') bool isMe,@JsonKey(name: 'is_blocked') bool isBlocked
});




}
/// @nodoc
class __$UserRelationshipModelCopyWithImpl<$Res>
    implements _$UserRelationshipModelCopyWith<$Res> {
  __$UserRelationshipModelCopyWithImpl(this._self, this._then);

  final _UserRelationshipModel _self;
  final $Res Function(_UserRelationshipModel) _then;

/// Create a copy of UserRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFollowing = null,Object? isFollower = null,Object? isFriend = null,Object? isMe = null,Object? isBlocked = null,}) {
  return _then(_UserRelationshipModel(
isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isFollower: null == isFollower ? _self.isFollower : isFollower // ignore: cast_nullable_to_non_nullable
as bool,isFriend: null == isFriend ? _self.isFriend : isFriend // ignore: cast_nullable_to_non_nullable
as bool,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
