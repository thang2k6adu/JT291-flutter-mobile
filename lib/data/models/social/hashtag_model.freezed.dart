// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hashtag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HashtagModel {

 String get id; String get name;
/// Create a copy of HashtagModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HashtagModelCopyWith<HashtagModel> get copyWith => _$HashtagModelCopyWithImpl<HashtagModel>(this as HashtagModel, _$identity);

  /// Serializes this HashtagModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HashtagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'HashtagModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $HashtagModelCopyWith<$Res>  {
  factory $HashtagModelCopyWith(HashtagModel value, $Res Function(HashtagModel) _then) = _$HashtagModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$HashtagModelCopyWithImpl<$Res>
    implements $HashtagModelCopyWith<$Res> {
  _$HashtagModelCopyWithImpl(this._self, this._then);

  final HashtagModel _self;
  final $Res Function(HashtagModel) _then;

/// Create a copy of HashtagModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HashtagModel].
extension HashtagModelPatterns on HashtagModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HashtagModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HashtagModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HashtagModel value)  $default,){
final _that = this;
switch (_that) {
case _HashtagModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HashtagModel value)?  $default,){
final _that = this;
switch (_that) {
case _HashtagModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HashtagModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _HashtagModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _HashtagModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HashtagModel implements HashtagModel {
  const _HashtagModel({required this.id, required this.name});
  factory _HashtagModel.fromJson(Map<String, dynamic> json) => _$HashtagModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of HashtagModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HashtagModelCopyWith<_HashtagModel> get copyWith => __$HashtagModelCopyWithImpl<_HashtagModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HashtagModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HashtagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'HashtagModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$HashtagModelCopyWith<$Res> implements $HashtagModelCopyWith<$Res> {
  factory _$HashtagModelCopyWith(_HashtagModel value, $Res Function(_HashtagModel) _then) = __$HashtagModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$HashtagModelCopyWithImpl<$Res>
    implements _$HashtagModelCopyWith<$Res> {
  __$HashtagModelCopyWithImpl(this._self, this._then);

  final _HashtagModel _self;
  final $Res Function(_HashtagModel) _then;

/// Create a copy of HashtagModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_HashtagModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HashtagSearchResponseModel {

 String get query; List<HashtagModel> get result;@JsonKey(name: 'can_create') bool get canCreate;
/// Create a copy of HashtagSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HashtagSearchResponseModelCopyWith<HashtagSearchResponseModel> get copyWith => _$HashtagSearchResponseModelCopyWithImpl<HashtagSearchResponseModel>(this as HashtagSearchResponseModel, _$identity);

  /// Serializes this HashtagSearchResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HashtagSearchResponseModel&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.result, result)&&(identical(other.canCreate, canCreate) || other.canCreate == canCreate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(result),canCreate);

@override
String toString() {
  return 'HashtagSearchResponseModel(query: $query, result: $result, canCreate: $canCreate)';
}


}

/// @nodoc
abstract mixin class $HashtagSearchResponseModelCopyWith<$Res>  {
  factory $HashtagSearchResponseModelCopyWith(HashtagSearchResponseModel value, $Res Function(HashtagSearchResponseModel) _then) = _$HashtagSearchResponseModelCopyWithImpl;
@useResult
$Res call({
 String query, List<HashtagModel> result,@JsonKey(name: 'can_create') bool canCreate
});




}
/// @nodoc
class _$HashtagSearchResponseModelCopyWithImpl<$Res>
    implements $HashtagSearchResponseModelCopyWith<$Res> {
  _$HashtagSearchResponseModelCopyWithImpl(this._self, this._then);

  final HashtagSearchResponseModel _self;
  final $Res Function(HashtagSearchResponseModel) _then;

/// Create a copy of HashtagSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? result = null,Object? canCreate = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<HashtagModel>,canCreate: null == canCreate ? _self.canCreate : canCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HashtagSearchResponseModel].
extension HashtagSearchResponseModelPatterns on HashtagSearchResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HashtagSearchResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HashtagSearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HashtagSearchResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _HashtagSearchResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HashtagSearchResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _HashtagSearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  List<HashtagModel> result, @JsonKey(name: 'can_create')  bool canCreate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HashtagSearchResponseModel() when $default != null:
return $default(_that.query,_that.result,_that.canCreate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  List<HashtagModel> result, @JsonKey(name: 'can_create')  bool canCreate)  $default,) {final _that = this;
switch (_that) {
case _HashtagSearchResponseModel():
return $default(_that.query,_that.result,_that.canCreate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  List<HashtagModel> result, @JsonKey(name: 'can_create')  bool canCreate)?  $default,) {final _that = this;
switch (_that) {
case _HashtagSearchResponseModel() when $default != null:
return $default(_that.query,_that.result,_that.canCreate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HashtagSearchResponseModel implements HashtagSearchResponseModel {
  const _HashtagSearchResponseModel({required this.query, required final  List<HashtagModel> result, @JsonKey(name: 'can_create') this.canCreate = false}): _result = result;
  factory _HashtagSearchResponseModel.fromJson(Map<String, dynamic> json) => _$HashtagSearchResponseModelFromJson(json);

@override final  String query;
 final  List<HashtagModel> _result;
@override List<HashtagModel> get result {
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_result);
}

@override@JsonKey(name: 'can_create') final  bool canCreate;

/// Create a copy of HashtagSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HashtagSearchResponseModelCopyWith<_HashtagSearchResponseModel> get copyWith => __$HashtagSearchResponseModelCopyWithImpl<_HashtagSearchResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HashtagSearchResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HashtagSearchResponseModel&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._result, _result)&&(identical(other.canCreate, canCreate) || other.canCreate == canCreate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,const DeepCollectionEquality().hash(_result),canCreate);

@override
String toString() {
  return 'HashtagSearchResponseModel(query: $query, result: $result, canCreate: $canCreate)';
}


}

/// @nodoc
abstract mixin class _$HashtagSearchResponseModelCopyWith<$Res> implements $HashtagSearchResponseModelCopyWith<$Res> {
  factory _$HashtagSearchResponseModelCopyWith(_HashtagSearchResponseModel value, $Res Function(_HashtagSearchResponseModel) _then) = __$HashtagSearchResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String query, List<HashtagModel> result,@JsonKey(name: 'can_create') bool canCreate
});




}
/// @nodoc
class __$HashtagSearchResponseModelCopyWithImpl<$Res>
    implements _$HashtagSearchResponseModelCopyWith<$Res> {
  __$HashtagSearchResponseModelCopyWithImpl(this._self, this._then);

  final _HashtagSearchResponseModel _self;
  final $Res Function(_HashtagSearchResponseModel) _then;

/// Create a copy of HashtagSearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? result = null,Object? canCreate = null,}) {
  return _then(_HashtagSearchResponseModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<HashtagModel>,canCreate: null == canCreate ? _self.canCreate : canCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$HashtagDetailModel {

 String get id; String get name; String? get thumbnail;@JsonKey(name: 'post_count') int get postCount;@JsonKey(name: 'view_count') int get viewCount;@JsonKey(name: 'is_following') bool get isFollowing;
/// Create a copy of HashtagDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HashtagDetailModelCopyWith<HashtagDetailModel> get copyWith => _$HashtagDetailModelCopyWithImpl<HashtagDetailModel>(this as HashtagDetailModel, _$identity);

  /// Serializes this HashtagDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HashtagDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnail,postCount,viewCount,isFollowing);

@override
String toString() {
  return 'HashtagDetailModel(id: $id, name: $name, thumbnail: $thumbnail, postCount: $postCount, viewCount: $viewCount, isFollowing: $isFollowing)';
}


}

/// @nodoc
abstract mixin class $HashtagDetailModelCopyWith<$Res>  {
  factory $HashtagDetailModelCopyWith(HashtagDetailModel value, $Res Function(HashtagDetailModel) _then) = _$HashtagDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? thumbnail,@JsonKey(name: 'post_count') int postCount,@JsonKey(name: 'view_count') int viewCount,@JsonKey(name: 'is_following') bool isFollowing
});




}
/// @nodoc
class _$HashtagDetailModelCopyWithImpl<$Res>
    implements $HashtagDetailModelCopyWith<$Res> {
  _$HashtagDetailModelCopyWithImpl(this._self, this._then);

  final HashtagDetailModel _self;
  final $Res Function(HashtagDetailModel) _then;

/// Create a copy of HashtagDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? thumbnail = freezed,Object? postCount = null,Object? viewCount = null,Object? isFollowing = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HashtagDetailModel].
extension HashtagDetailModelPatterns on HashtagDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HashtagDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HashtagDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HashtagDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _HashtagDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HashtagDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _HashtagDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? thumbnail, @JsonKey(name: 'post_count')  int postCount, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'is_following')  bool isFollowing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HashtagDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.thumbnail,_that.postCount,_that.viewCount,_that.isFollowing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? thumbnail, @JsonKey(name: 'post_count')  int postCount, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'is_following')  bool isFollowing)  $default,) {final _that = this;
switch (_that) {
case _HashtagDetailModel():
return $default(_that.id,_that.name,_that.thumbnail,_that.postCount,_that.viewCount,_that.isFollowing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? thumbnail, @JsonKey(name: 'post_count')  int postCount, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'is_following')  bool isFollowing)?  $default,) {final _that = this;
switch (_that) {
case _HashtagDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.thumbnail,_that.postCount,_that.viewCount,_that.isFollowing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HashtagDetailModel implements HashtagDetailModel {
  const _HashtagDetailModel({required this.id, required this.name, this.thumbnail, @JsonKey(name: 'post_count') this.postCount = 0, @JsonKey(name: 'view_count') this.viewCount = 0, @JsonKey(name: 'is_following') this.isFollowing = false});
  factory _HashtagDetailModel.fromJson(Map<String, dynamic> json) => _$HashtagDetailModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? thumbnail;
@override@JsonKey(name: 'post_count') final  int postCount;
@override@JsonKey(name: 'view_count') final  int viewCount;
@override@JsonKey(name: 'is_following') final  bool isFollowing;

/// Create a copy of HashtagDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HashtagDetailModelCopyWith<_HashtagDetailModel> get copyWith => __$HashtagDetailModelCopyWithImpl<_HashtagDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HashtagDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HashtagDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnail,postCount,viewCount,isFollowing);

@override
String toString() {
  return 'HashtagDetailModel(id: $id, name: $name, thumbnail: $thumbnail, postCount: $postCount, viewCount: $viewCount, isFollowing: $isFollowing)';
}


}

/// @nodoc
abstract mixin class _$HashtagDetailModelCopyWith<$Res> implements $HashtagDetailModelCopyWith<$Res> {
  factory _$HashtagDetailModelCopyWith(_HashtagDetailModel value, $Res Function(_HashtagDetailModel) _then) = __$HashtagDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? thumbnail,@JsonKey(name: 'post_count') int postCount,@JsonKey(name: 'view_count') int viewCount,@JsonKey(name: 'is_following') bool isFollowing
});




}
/// @nodoc
class __$HashtagDetailModelCopyWithImpl<$Res>
    implements _$HashtagDetailModelCopyWith<$Res> {
  __$HashtagDetailModelCopyWithImpl(this._self, this._then);

  final _HashtagDetailModel _self;
  final $Res Function(_HashtagDetailModel) _then;

/// Create a copy of HashtagDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thumbnail = freezed,Object? postCount = null,Object? viewCount = null,Object? isFollowing = null,}) {
  return _then(_HashtagDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
