// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hot_topic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotTopicModel {

 String get id; String get hashtag;@JsonKey(name: 'post_count') int get postCount;@JsonKey(name: 'thumbnail_url') String? get thumbnailUrl;@JsonKey(name: 'engagement_score') double get engagementScore;
/// Create a copy of HotTopicModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotTopicModelCopyWith<HotTopicModel> get copyWith => _$HotTopicModelCopyWithImpl<HotTopicModel>(this as HotTopicModel, _$identity);

  /// Serializes this HotTopicModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotTopicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.hashtag, hashtag) || other.hashtag == hashtag)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.engagementScore, engagementScore) || other.engagementScore == engagementScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hashtag,postCount,thumbnailUrl,engagementScore);

@override
String toString() {
  return 'HotTopicModel(id: $id, hashtag: $hashtag, postCount: $postCount, thumbnailUrl: $thumbnailUrl, engagementScore: $engagementScore)';
}


}

/// @nodoc
abstract mixin class $HotTopicModelCopyWith<$Res>  {
  factory $HotTopicModelCopyWith(HotTopicModel value, $Res Function(HotTopicModel) _then) = _$HotTopicModelCopyWithImpl;
@useResult
$Res call({
 String id, String hashtag,@JsonKey(name: 'post_count') int postCount,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl,@JsonKey(name: 'engagement_score') double engagementScore
});




}
/// @nodoc
class _$HotTopicModelCopyWithImpl<$Res>
    implements $HotTopicModelCopyWith<$Res> {
  _$HotTopicModelCopyWithImpl(this._self, this._then);

  final HotTopicModel _self;
  final $Res Function(HotTopicModel) _then;

/// Create a copy of HotTopicModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hashtag = null,Object? postCount = null,Object? thumbnailUrl = freezed,Object? engagementScore = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hashtag: null == hashtag ? _self.hashtag : hashtag // ignore: cast_nullable_to_non_nullable
as String,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,engagementScore: null == engagementScore ? _self.engagementScore : engagementScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HotTopicModel].
extension HotTopicModelPatterns on HotTopicModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotTopicModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotTopicModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotTopicModel value)  $default,){
final _that = this;
switch (_that) {
case _HotTopicModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotTopicModel value)?  $default,){
final _that = this;
switch (_that) {
case _HotTopicModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String hashtag, @JsonKey(name: 'post_count')  int postCount, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'engagement_score')  double engagementScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotTopicModel() when $default != null:
return $default(_that.id,_that.hashtag,_that.postCount,_that.thumbnailUrl,_that.engagementScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String hashtag, @JsonKey(name: 'post_count')  int postCount, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'engagement_score')  double engagementScore)  $default,) {final _that = this;
switch (_that) {
case _HotTopicModel():
return $default(_that.id,_that.hashtag,_that.postCount,_that.thumbnailUrl,_that.engagementScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String hashtag, @JsonKey(name: 'post_count')  int postCount, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'engagement_score')  double engagementScore)?  $default,) {final _that = this;
switch (_that) {
case _HotTopicModel() when $default != null:
return $default(_that.id,_that.hashtag,_that.postCount,_that.thumbnailUrl,_that.engagementScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotTopicModel implements HotTopicModel {
  const _HotTopicModel({required this.id, required this.hashtag, @JsonKey(name: 'post_count') this.postCount = 0, @JsonKey(name: 'thumbnail_url') this.thumbnailUrl, @JsonKey(name: 'engagement_score') this.engagementScore = 0.0});
  factory _HotTopicModel.fromJson(Map<String, dynamic> json) => _$HotTopicModelFromJson(json);

@override final  String id;
@override final  String hashtag;
@override@JsonKey(name: 'post_count') final  int postCount;
@override@JsonKey(name: 'thumbnail_url') final  String? thumbnailUrl;
@override@JsonKey(name: 'engagement_score') final  double engagementScore;

/// Create a copy of HotTopicModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotTopicModelCopyWith<_HotTopicModel> get copyWith => __$HotTopicModelCopyWithImpl<_HotTopicModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotTopicModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotTopicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.hashtag, hashtag) || other.hashtag == hashtag)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.engagementScore, engagementScore) || other.engagementScore == engagementScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hashtag,postCount,thumbnailUrl,engagementScore);

@override
String toString() {
  return 'HotTopicModel(id: $id, hashtag: $hashtag, postCount: $postCount, thumbnailUrl: $thumbnailUrl, engagementScore: $engagementScore)';
}


}

/// @nodoc
abstract mixin class _$HotTopicModelCopyWith<$Res> implements $HotTopicModelCopyWith<$Res> {
  factory _$HotTopicModelCopyWith(_HotTopicModel value, $Res Function(_HotTopicModel) _then) = __$HotTopicModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String hashtag,@JsonKey(name: 'post_count') int postCount,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl,@JsonKey(name: 'engagement_score') double engagementScore
});




}
/// @nodoc
class __$HotTopicModelCopyWithImpl<$Res>
    implements _$HotTopicModelCopyWith<$Res> {
  __$HotTopicModelCopyWithImpl(this._self, this._then);

  final _HotTopicModel _self;
  final $Res Function(_HotTopicModel) _then;

/// Create a copy of HotTopicModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hashtag = null,Object? postCount = null,Object? thumbnailUrl = freezed,Object? engagementScore = null,}) {
  return _then(_HotTopicModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hashtag: null == hashtag ? _self.hashtag : hashtag // ignore: cast_nullable_to_non_nullable
as String,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,engagementScore: null == engagementScore ? _self.engagementScore : engagementScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
