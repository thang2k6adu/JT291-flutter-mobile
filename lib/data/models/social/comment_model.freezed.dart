// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentModel {

 String get id;@JsonKey(name: 'post_id') String get postId;@JsonKey(name: 'user_id') String get userId; UserModel get user; String get content;@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> get media;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'replies_count') int get repliesCount;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'parent_id') String? get parentId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,postId,userId,user,content,const DeepCollectionEquality().hash(media),likeCount,repliesCount,isLiked,parentId,createdAt,updatedAt);

@override
String toString() {
  return 'CommentModel(id: $id, postId: $postId, userId: $userId, user: $user, content: $content, media: $media, likeCount: $likeCount, repliesCount: $repliesCount, isLiked: $isLiked, parentId: $parentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'post_id') String postId,@JsonKey(name: 'user_id') String userId, UserModel user, String content,@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> media,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'replies_count') int repliesCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'parent_id') String? parentId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$CommentModelCopyWithImpl<$Res>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? postId = null,Object? userId = null,Object? user = null,Object? content = null,Object? media = null,Object? likeCount = null,Object? repliesCount = null,Object? isLiked = null,Object? parentId = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<PostMediaModel>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,repliesCount: null == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommentModel].
extension CommentModelPatterns on CommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'user_id')  String userId,  UserModel user,  String content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson)  List<PostMediaModel> media, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'replies_count')  int repliesCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'parent_id')  String? parentId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.postId,_that.userId,_that.user,_that.content,_that.media,_that.likeCount,_that.repliesCount,_that.isLiked,_that.parentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'user_id')  String userId,  UserModel user,  String content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson)  List<PostMediaModel> media, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'replies_count')  int repliesCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'parent_id')  String? parentId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CommentModel():
return $default(_that.id,_that.postId,_that.userId,_that.user,_that.content,_that.media,_that.likeCount,_that.repliesCount,_that.isLiked,_that.parentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'user_id')  String userId,  UserModel user,  String content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson)  List<PostMediaModel> media, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'replies_count')  int repliesCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'parent_id')  String? parentId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.postId,_that.userId,_that.user,_that.content,_that.media,_that.likeCount,_that.repliesCount,_that.isLiked,_that.parentId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentModel implements CommentModel {
  const _CommentModel({required this.id, @JsonKey(name: 'post_id') required this.postId, @JsonKey(name: 'user_id') required this.userId, required this.user, required this.content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) final  List<PostMediaModel> media = const [], @JsonKey(name: 'like_count') this.likeCount = 0, @JsonKey(name: 'replies_count') this.repliesCount = 0, @JsonKey(name: 'is_liked') this.isLiked = false, @JsonKey(name: 'parent_id') this.parentId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _media = media;
  factory _CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'post_id') final  String postId;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  UserModel user;
@override final  String content;
 final  List<PostMediaModel> _media;
@override@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'replies_count') final  int repliesCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'parent_id') final  String? parentId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentModelCopyWith<_CommentModel> get copyWith => __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,postId,userId,user,content,const DeepCollectionEquality().hash(_media),likeCount,repliesCount,isLiked,parentId,createdAt,updatedAt);

@override
String toString() {
  return 'CommentModel(id: $id, postId: $postId, userId: $userId, user: $user, content: $content, media: $media, likeCount: $likeCount, repliesCount: $repliesCount, isLiked: $isLiked, parentId: $parentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'post_id') String postId,@JsonKey(name: 'user_id') String userId, UserModel user, String content,@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> media,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'replies_count') int repliesCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'parent_id') String? parentId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? postId = null,Object? userId = null,Object? user = null,Object? content = null,Object? media = null,Object? likeCount = null,Object? repliesCount = null,Object? isLiked = null,Object? parentId = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_CommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<PostMediaModel>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,repliesCount: null == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CommentModel
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
