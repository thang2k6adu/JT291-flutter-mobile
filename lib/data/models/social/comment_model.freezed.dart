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

 String get id; UserModel get user; String get content; List<PostMediaModel> get media;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'reply_count') int get replyCount;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'parent_comment_id') String? get parentCommentId;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,content,const DeepCollectionEquality().hash(media),likeCount,replyCount,isLiked,createdAt,parentCommentId);

@override
String toString() {
  return 'CommentModel(id: $id, user: $user, content: $content, media: $media, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, parentCommentId: $parentCommentId)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
 String id, UserModel user, String content, List<PostMediaModel> media,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'reply_count') int replyCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'parent_comment_id') String? parentCommentId
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? content = null,Object? media = null,Object? likeCount = null,Object? replyCount = null,Object? isLiked = null,Object? createdAt = null,Object? parentCommentId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<PostMediaModel>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserModel user,  String content,  List<PostMediaModel> media, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'parent_comment_id')  String? parentCommentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.user,_that.content,_that.media,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.parentCommentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserModel user,  String content,  List<PostMediaModel> media, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'parent_comment_id')  String? parentCommentId)  $default,) {final _that = this;
switch (_that) {
case _CommentModel():
return $default(_that.id,_that.user,_that.content,_that.media,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.parentCommentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserModel user,  String content,  List<PostMediaModel> media, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'parent_comment_id')  String? parentCommentId)?  $default,) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.user,_that.content,_that.media,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.parentCommentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentModel implements CommentModel {
  const _CommentModel({required this.id, required this.user, required this.content, final  List<PostMediaModel> media = const [], @JsonKey(name: 'like_count') this.likeCount = 0, @JsonKey(name: 'reply_count') this.replyCount = 0, @JsonKey(name: 'is_liked') this.isLiked = false, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'parent_comment_id') this.parentCommentId}): _media = media;
  factory _CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

@override final  String id;
@override final  UserModel user;
@override final  String content;
 final  List<PostMediaModel> _media;
@override@JsonKey() List<PostMediaModel> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'reply_count') final  int replyCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'parent_comment_id') final  String? parentCommentId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.parentCommentId, parentCommentId) || other.parentCommentId == parentCommentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,content,const DeepCollectionEquality().hash(_media),likeCount,replyCount,isLiked,createdAt,parentCommentId);

@override
String toString() {
  return 'CommentModel(id: $id, user: $user, content: $content, media: $media, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, parentCommentId: $parentCommentId)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, UserModel user, String content, List<PostMediaModel> media,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'reply_count') int replyCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'parent_comment_id') String? parentCommentId
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? content = null,Object? media = null,Object? likeCount = null,Object? replyCount = null,Object? isLiked = null,Object? createdAt = null,Object? parentCommentId = freezed,}) {
  return _then(_CommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<PostMediaModel>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentCommentId: freezed == parentCommentId ? _self.parentCommentId : parentCommentId // ignore: cast_nullable_to_non_nullable
as String?,
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
