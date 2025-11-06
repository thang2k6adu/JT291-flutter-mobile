// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendModel {

@JsonKey(name: 'friend_id') String? get friendId;@JsonKey(name: 'created_at') DateTime? get createdAt; UserModel? get user;
/// Create a copy of FriendModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendModelCopyWith<FriendModel> get copyWith => _$FriendModelCopyWithImpl<FriendModel>(this as FriendModel, _$identity);

  /// Serializes this FriendModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendModel&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,friendId,createdAt,user);

@override
String toString() {
  return 'FriendModel(friendId: $friendId, createdAt: $createdAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $FriendModelCopyWith<$Res>  {
  factory $FriendModelCopyWith(FriendModel value, $Res Function(FriendModel) _then) = _$FriendModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'friend_id') String? friendId,@JsonKey(name: 'created_at') DateTime? createdAt, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$FriendModelCopyWithImpl<$Res>
    implements $FriendModelCopyWith<$Res> {
  _$FriendModelCopyWithImpl(this._self, this._then);

  final FriendModel _self;
  final $Res Function(FriendModel) _then;

/// Create a copy of FriendModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? friendId = freezed,Object? createdAt = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of FriendModel
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


/// Adds pattern-matching-related methods to [FriendModel].
extension FriendModelPatterns on FriendModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendModel value)  $default,){
final _that = this;
switch (_that) {
case _FriendModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendModel value)?  $default,){
final _that = this;
switch (_that) {
case _FriendModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'friend_id')  String? friendId, @JsonKey(name: 'created_at')  DateTime? createdAt,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendModel() when $default != null:
return $default(_that.friendId,_that.createdAt,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'friend_id')  String? friendId, @JsonKey(name: 'created_at')  DateTime? createdAt,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _FriendModel():
return $default(_that.friendId,_that.createdAt,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'friend_id')  String? friendId, @JsonKey(name: 'created_at')  DateTime? createdAt,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _FriendModel() when $default != null:
return $default(_that.friendId,_that.createdAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendModel implements FriendModel {
  const _FriendModel({@JsonKey(name: 'friend_id') this.friendId, @JsonKey(name: 'created_at') this.createdAt, this.user});
  factory _FriendModel.fromJson(Map<String, dynamic> json) => _$FriendModelFromJson(json);

@override@JsonKey(name: 'friend_id') final  String? friendId;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override final  UserModel? user;

/// Create a copy of FriendModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendModelCopyWith<_FriendModel> get copyWith => __$FriendModelCopyWithImpl<_FriendModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendModel&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,friendId,createdAt,user);

@override
String toString() {
  return 'FriendModel(friendId: $friendId, createdAt: $createdAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$FriendModelCopyWith<$Res> implements $FriendModelCopyWith<$Res> {
  factory _$FriendModelCopyWith(_FriendModel value, $Res Function(_FriendModel) _then) = __$FriendModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'friend_id') String? friendId,@JsonKey(name: 'created_at') DateTime? createdAt, UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$FriendModelCopyWithImpl<$Res>
    implements _$FriendModelCopyWith<$Res> {
  __$FriendModelCopyWithImpl(this._self, this._then);

  final _FriendModel _self;
  final $Res Function(_FriendModel) _then;

/// Create a copy of FriendModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? friendId = freezed,Object? createdAt = freezed,Object? user = freezed,}) {
  return _then(_FriendModel(
friendId: freezed == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of FriendModel
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
