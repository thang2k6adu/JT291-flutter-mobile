// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatsModel {

@JsonKey(name: 'following_count') int? get followingCount;@JsonKey(name: 'followers_count') int? get followersCount;@JsonKey(name: 'friends_count') int? get friendsCount;@JsonKey(name: 'views_count') int? get viewsCount; bool get isPending;
/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsModelCopyWith<UserStatsModel> get copyWith => _$UserStatsModelCopyWithImpl<UserStatsModel>(this as UserStatsModel, _$identity);

  /// Serializes this UserStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatsModel&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.friendsCount, friendsCount) || other.friendsCount == friendsCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followingCount,followersCount,friendsCount,viewsCount,isPending);

@override
String toString() {
  return 'UserStatsModel(followingCount: $followingCount, followersCount: $followersCount, friendsCount: $friendsCount, viewsCount: $viewsCount, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class $UserStatsModelCopyWith<$Res>  {
  factory $UserStatsModelCopyWith(UserStatsModel value, $Res Function(UserStatsModel) _then) = _$UserStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'friends_count') int? friendsCount,@JsonKey(name: 'views_count') int? viewsCount, bool isPending
});




}
/// @nodoc
class _$UserStatsModelCopyWithImpl<$Res>
    implements $UserStatsModelCopyWith<$Res> {
  _$UserStatsModelCopyWithImpl(this._self, this._then);

  final UserStatsModel _self;
  final $Res Function(UserStatsModel) _then;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followingCount = freezed,Object? followersCount = freezed,Object? friendsCount = freezed,Object? viewsCount = freezed,Object? isPending = null,}) {
  return _then(_self.copyWith(
followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,friendsCount: freezed == friendsCount ? _self.friendsCount : friendsCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStatsModel].
extension UserStatsModelPatterns on UserStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _UserStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'friends_count')  int? friendsCount, @JsonKey(name: 'views_count')  int? viewsCount,  bool isPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
return $default(_that.followingCount,_that.followersCount,_that.friendsCount,_that.viewsCount,_that.isPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'friends_count')  int? friendsCount, @JsonKey(name: 'views_count')  int? viewsCount,  bool isPending)  $default,) {final _that = this;
switch (_that) {
case _UserStatsModel():
return $default(_that.followingCount,_that.followersCount,_that.friendsCount,_that.viewsCount,_that.isPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'following_count')  int? followingCount, @JsonKey(name: 'followers_count')  int? followersCount, @JsonKey(name: 'friends_count')  int? friendsCount, @JsonKey(name: 'views_count')  int? viewsCount,  bool isPending)?  $default,) {final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
return $default(_that.followingCount,_that.followersCount,_that.friendsCount,_that.viewsCount,_that.isPending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStatsModel implements UserStatsModel {
  const _UserStatsModel({@JsonKey(name: 'following_count') this.followingCount, @JsonKey(name: 'followers_count') this.followersCount, @JsonKey(name: 'friends_count') this.friendsCount, @JsonKey(name: 'views_count') this.viewsCount, this.isPending = false});
  factory _UserStatsModel.fromJson(Map<String, dynamic> json) => _$UserStatsModelFromJson(json);

@override@JsonKey(name: 'following_count') final  int? followingCount;
@override@JsonKey(name: 'followers_count') final  int? followersCount;
@override@JsonKey(name: 'friends_count') final  int? friendsCount;
@override@JsonKey(name: 'views_count') final  int? viewsCount;
@override@JsonKey() final  bool isPending;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsModelCopyWith<_UserStatsModel> get copyWith => __$UserStatsModelCopyWithImpl<_UserStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatsModel&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.friendsCount, friendsCount) || other.friendsCount == friendsCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.isPending, isPending) || other.isPending == isPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,followingCount,followersCount,friendsCount,viewsCount,isPending);

@override
String toString() {
  return 'UserStatsModel(followingCount: $followingCount, followersCount: $followersCount, friendsCount: $friendsCount, viewsCount: $viewsCount, isPending: $isPending)';
}


}

/// @nodoc
abstract mixin class _$UserStatsModelCopyWith<$Res> implements $UserStatsModelCopyWith<$Res> {
  factory _$UserStatsModelCopyWith(_UserStatsModel value, $Res Function(_UserStatsModel) _then) = __$UserStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'following_count') int? followingCount,@JsonKey(name: 'followers_count') int? followersCount,@JsonKey(name: 'friends_count') int? friendsCount,@JsonKey(name: 'views_count') int? viewsCount, bool isPending
});




}
/// @nodoc
class __$UserStatsModelCopyWithImpl<$Res>
    implements _$UserStatsModelCopyWith<$Res> {
  __$UserStatsModelCopyWithImpl(this._self, this._then);

  final _UserStatsModel _self;
  final $Res Function(_UserStatsModel) _then;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followingCount = freezed,Object? followersCount = freezed,Object? friendsCount = freezed,Object? viewsCount = freezed,Object? isPending = null,}) {
  return _then(_UserStatsModel(
followingCount: freezed == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int?,followersCount: freezed == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int?,friendsCount: freezed == friendsCount ? _self.friendsCount : friendsCount // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
