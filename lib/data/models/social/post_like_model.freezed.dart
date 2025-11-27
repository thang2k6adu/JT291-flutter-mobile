// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostLikeModel {

 String get id;@JsonKey(name: 'post_id') String get postId;@JsonKey(name: 'user_id') String get userId; String get reaction;@JsonKey(name: 'created_at') DateTime get createdAt; UserModel get user;
/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostLikeModelCopyWith<PostLikeModel> get copyWith => _$PostLikeModelCopyWithImpl<PostLikeModel>(this as PostLikeModel, _$identity);

  /// Serializes this PostLikeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostLikeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.reaction, reaction) || other.reaction == reaction)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,postId,userId,reaction,createdAt,user);

@override
String toString() {
  return 'PostLikeModel(id: $id, postId: $postId, userId: $userId, reaction: $reaction, createdAt: $createdAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $PostLikeModelCopyWith<$Res>  {
  factory $PostLikeModelCopyWith(PostLikeModel value, $Res Function(PostLikeModel) _then) = _$PostLikeModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'post_id') String postId,@JsonKey(name: 'user_id') String userId, String reaction,@JsonKey(name: 'created_at') DateTime createdAt, UserModel user
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$PostLikeModelCopyWithImpl<$Res>
    implements $PostLikeModelCopyWith<$Res> {
  _$PostLikeModelCopyWithImpl(this._self, this._then);

  final PostLikeModel _self;
  final $Res Function(PostLikeModel) _then;

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? postId = null,Object? userId = null,Object? reaction = null,Object? createdAt = null,Object? user = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}
/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostLikeModel].
extension PostLikeModelPatterns on PostLikeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostLikeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostLikeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostLikeModel value)  $default,){
final _that = this;
switch (_that) {
case _PostLikeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostLikeModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostLikeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'user_id')  String userId,  String reaction, @JsonKey(name: 'created_at')  DateTime createdAt,  UserModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostLikeModel() when $default != null:
return $default(_that.id,_that.postId,_that.userId,_that.reaction,_that.createdAt,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'user_id')  String userId,  String reaction, @JsonKey(name: 'created_at')  DateTime createdAt,  UserModel user)  $default,) {final _that = this;
switch (_that) {
case _PostLikeModel():
return $default(_that.id,_that.postId,_that.userId,_that.reaction,_that.createdAt,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'user_id')  String userId,  String reaction, @JsonKey(name: 'created_at')  DateTime createdAt,  UserModel user)?  $default,) {final _that = this;
switch (_that) {
case _PostLikeModel() when $default != null:
return $default(_that.id,_that.postId,_that.userId,_that.reaction,_that.createdAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostLikeModel implements PostLikeModel {
  const _PostLikeModel({required this.id, @JsonKey(name: 'post_id') required this.postId, @JsonKey(name: 'user_id') required this.userId, required this.reaction, @JsonKey(name: 'created_at') required this.createdAt, required this.user});
  factory _PostLikeModel.fromJson(Map<String, dynamic> json) => _$PostLikeModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'post_id') final  String postId;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String reaction;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override final  UserModel user;

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostLikeModelCopyWith<_PostLikeModel> get copyWith => __$PostLikeModelCopyWithImpl<_PostLikeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostLikeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostLikeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.reaction, reaction) || other.reaction == reaction)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,postId,userId,reaction,createdAt,user);

@override
String toString() {
  return 'PostLikeModel(id: $id, postId: $postId, userId: $userId, reaction: $reaction, createdAt: $createdAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$PostLikeModelCopyWith<$Res> implements $PostLikeModelCopyWith<$Res> {
  factory _$PostLikeModelCopyWith(_PostLikeModel value, $Res Function(_PostLikeModel) _then) = __$PostLikeModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'post_id') String postId,@JsonKey(name: 'user_id') String userId, String reaction,@JsonKey(name: 'created_at') DateTime createdAt, UserModel user
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$PostLikeModelCopyWithImpl<$Res>
    implements _$PostLikeModelCopyWith<$Res> {
  __$PostLikeModelCopyWithImpl(this._self, this._then);

  final _PostLikeModel _self;
  final $Res Function(_PostLikeModel) _then;

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? postId = null,Object? userId = null,Object? reaction = null,Object? createdAt = null,Object? user = null,}) {
  return _then(_PostLikeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,reaction: null == reaction ? _self.reaction : reaction // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
