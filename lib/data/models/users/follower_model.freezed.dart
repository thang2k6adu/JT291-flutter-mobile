// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowerModel {

@JsonKey(name: 'follower_id') String? get followerId;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'is_friend') bool? get isFriend; UserModel? get user;
/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowerModelCopyWith<FollowerModel> get copyWith => _$FollowerModelCopyWithImpl<FollowerModel>(this as FollowerModel, _$identity);

  /// Serializes this FollowerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowerModel&&(identical(other.followerId, followerId) || other.followerId == followerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFriend, isFriend) || other.isFriend == isFriend)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followerId,createdAt,isFriend,user);

@override
String toString() {
  return 'FollowerModel(followerId: $followerId, createdAt: $createdAt, isFriend: $isFriend, user: $user)';
}


}

/// @nodoc
abstract mixin class $FollowerModelCopyWith<$Res>  {
  factory $FollowerModelCopyWith(FollowerModel value, $Res Function(FollowerModel) _then) = _$FollowerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'follower_id') String? followerId,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'is_friend') bool? isFriend, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$FollowerModelCopyWithImpl<$Res>
    implements $FollowerModelCopyWith<$Res> {
  _$FollowerModelCopyWithImpl(this._self, this._then);

  final FollowerModel _self;
  final $Res Function(FollowerModel) _then;

/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followerId = freezed,Object? createdAt = freezed,Object? isFriend = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
followerId: freezed == followerId ? _self.followerId : followerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFriend: freezed == isFriend ? _self.isFriend : isFriend // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [FollowerModel].
extension FollowerModelPatterns on FollowerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowerModel value)  $default,){
final _that = this;
switch (_that) {
case _FollowerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowerModel value)?  $default,){
final _that = this;
switch (_that) {
case _FollowerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'follower_id')  String? followerId, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_friend')  bool? isFriend,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowerModel() when $default != null:
return $default(_that.followerId,_that.createdAt,_that.isFriend,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'follower_id')  String? followerId, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_friend')  bool? isFriend,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _FollowerModel():
return $default(_that.followerId,_that.createdAt,_that.isFriend,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'follower_id')  String? followerId, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_friend')  bool? isFriend,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _FollowerModel() when $default != null:
return $default(_that.followerId,_that.createdAt,_that.isFriend,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FollowerModel implements FollowerModel {
  const _FollowerModel({@JsonKey(name: 'follower_id') this.followerId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'is_friend') this.isFriend, this.user});
  factory _FollowerModel.fromJson(Map<String, dynamic> json) => _$FollowerModelFromJson(json);

@override@JsonKey(name: 'follower_id') final  String? followerId;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'is_friend') final  bool? isFriend;
@override final  UserModel? user;

/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowerModelCopyWith<_FollowerModel> get copyWith => __$FollowerModelCopyWithImpl<_FollowerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowerModel&&(identical(other.followerId, followerId) || other.followerId == followerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFriend, isFriend) || other.isFriend == isFriend)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followerId,createdAt,isFriend,user);

@override
String toString() {
  return 'FollowerModel(followerId: $followerId, createdAt: $createdAt, isFriend: $isFriend, user: $user)';
}


}

/// @nodoc
abstract mixin class _$FollowerModelCopyWith<$Res> implements $FollowerModelCopyWith<$Res> {
  factory _$FollowerModelCopyWith(_FollowerModel value, $Res Function(_FollowerModel) _then) = __$FollowerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'follower_id') String? followerId,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'is_friend') bool? isFriend, UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$FollowerModelCopyWithImpl<$Res>
    implements _$FollowerModelCopyWith<$Res> {
  __$FollowerModelCopyWithImpl(this._self, this._then);

  final _FollowerModel _self;
  final $Res Function(_FollowerModel) _then;

/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followerId = freezed,Object? createdAt = freezed,Object? isFriend = freezed,Object? user = freezed,}) {
  return _then(_FollowerModel(
followerId: freezed == followerId ? _self.followerId : followerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isFriend: freezed == isFriend ? _self.isFriend : isFriend // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
