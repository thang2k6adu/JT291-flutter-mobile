// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {

 String get id; UserModel get user; String get content;@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> get media; List<String> get hashtags;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'comment_count') int get commentCount;@JsonKey(name: 'share_count') int get shareCount;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'is_bookmarked') bool get isBookmarked;@JsonKey(name: 'created_at') DateTime get createdAt; PostPrivacy get privacy;// Optional fields
 String? get location;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.media, media)&&const DeepCollectionEquality().equals(other.hashtags, hashtags)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.shareCount, shareCount) || other.shareCount == shareCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.location, location) || other.location == location)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,content,const DeepCollectionEquality().hash(media),const DeepCollectionEquality().hash(hashtags),likeCount,commentCount,shareCount,isLiked,isBookmarked,createdAt,privacy,location,updatedAt);

@override
String toString() {
  return 'PostModel(id: $id, user: $user, content: $content, media: $media, hashtags: $hashtags, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount, isLiked: $isLiked, isBookmarked: $isBookmarked, createdAt: $createdAt, privacy: $privacy, location: $location, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
 String id, UserModel user, String content,@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> media, List<String> hashtags,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'share_count') int shareCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'is_bookmarked') bool isBookmarked,@JsonKey(name: 'created_at') DateTime createdAt, PostPrivacy privacy, String? location,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? content = null,Object? media = null,Object? hashtags = null,Object? likeCount = null,Object? commentCount = null,Object? shareCount = null,Object? isLiked = null,Object? isBookmarked = null,Object? createdAt = null,Object? privacy = null,Object? location = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<PostMediaModel>,hashtags: null == hashtags ? _self.hashtags : hashtags // ignore: cast_nullable_to_non_nullable
as List<String>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,shareCount: null == shareCount ? _self.shareCount : shareCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,privacy: null == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as PostPrivacy,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostModel].
extension PostModelPatterns on PostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostModel value)  $default,){
final _that = this;
switch (_that) {
case _PostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserModel user,  String content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson)  List<PostMediaModel> media,  List<String> hashtags, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'share_count')  int shareCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'is_bookmarked')  bool isBookmarked, @JsonKey(name: 'created_at')  DateTime createdAt,  PostPrivacy privacy,  String? location, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.id,_that.user,_that.content,_that.media,_that.hashtags,_that.likeCount,_that.commentCount,_that.shareCount,_that.isLiked,_that.isBookmarked,_that.createdAt,_that.privacy,_that.location,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserModel user,  String content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson)  List<PostMediaModel> media,  List<String> hashtags, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'share_count')  int shareCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'is_bookmarked')  bool isBookmarked, @JsonKey(name: 'created_at')  DateTime createdAt,  PostPrivacy privacy,  String? location, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PostModel():
return $default(_that.id,_that.user,_that.content,_that.media,_that.hashtags,_that.likeCount,_that.commentCount,_that.shareCount,_that.isLiked,_that.isBookmarked,_that.createdAt,_that.privacy,_that.location,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserModel user,  String content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson)  List<PostMediaModel> media,  List<String> hashtags, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'comment_count')  int commentCount, @JsonKey(name: 'share_count')  int shareCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'is_bookmarked')  bool isBookmarked, @JsonKey(name: 'created_at')  DateTime createdAt,  PostPrivacy privacy,  String? location, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.id,_that.user,_that.content,_that.media,_that.hashtags,_that.likeCount,_that.commentCount,_that.shareCount,_that.isLiked,_that.isBookmarked,_that.createdAt,_that.privacy,_that.location,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostModel implements PostModel {
  const _PostModel({required this.id, required this.user, required this.content, @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) final  List<PostMediaModel> media = const [], final  List<String> hashtags = const [], @JsonKey(name: 'like_count') this.likeCount = 0, @JsonKey(name: 'comment_count') this.commentCount = 0, @JsonKey(name: 'share_count') this.shareCount = 0, @JsonKey(name: 'is_liked') this.isLiked = false, @JsonKey(name: 'is_bookmarked') this.isBookmarked = false, @JsonKey(name: 'created_at') required this.createdAt, this.privacy = PostPrivacy.public, this.location, @JsonKey(name: 'updated_at') this.updatedAt}): _media = media,_hashtags = hashtags;
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override final  String id;
@override final  UserModel user;
@override final  String content;
 final  List<PostMediaModel> _media;
@override@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

 final  List<String> _hashtags;
@override@JsonKey() List<String> get hashtags {
  if (_hashtags is EqualUnmodifiableListView) return _hashtags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hashtags);
}

@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'comment_count') final  int commentCount;
@override@JsonKey(name: 'share_count') final  int shareCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'is_bookmarked') final  bool isBookmarked;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey() final  PostPrivacy privacy;
// Optional fields
@override final  String? location;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._media, _media)&&const DeepCollectionEquality().equals(other._hashtags, _hashtags)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.shareCount, shareCount) || other.shareCount == shareCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.location, location) || other.location == location)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,content,const DeepCollectionEquality().hash(_media),const DeepCollectionEquality().hash(_hashtags),likeCount,commentCount,shareCount,isLiked,isBookmarked,createdAt,privacy,location,updatedAt);

@override
String toString() {
  return 'PostModel(id: $id, user: $user, content: $content, media: $media, hashtags: $hashtags, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount, isLiked: $isLiked, isBookmarked: $isBookmarked, createdAt: $createdAt, privacy: $privacy, location: $location, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
 String id, UserModel user, String content,@JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> media, List<String> hashtags,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'comment_count') int commentCount,@JsonKey(name: 'share_count') int shareCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'is_bookmarked') bool isBookmarked,@JsonKey(name: 'created_at') DateTime createdAt, PostPrivacy privacy, String? location,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? content = null,Object? media = null,Object? hashtags = null,Object? likeCount = null,Object? commentCount = null,Object? shareCount = null,Object? isLiked = null,Object? isBookmarked = null,Object? createdAt = null,Object? privacy = null,Object? location = freezed,Object? updatedAt = freezed,}) {
  return _then(_PostModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<PostMediaModel>,hashtags: null == hashtags ? _self._hashtags : hashtags // ignore: cast_nullable_to_non_nullable
as List<String>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,shareCount: null == shareCount ? _self.shareCount : shareCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,privacy: null == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as PostPrivacy,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PostModel
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
