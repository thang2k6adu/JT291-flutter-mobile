// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewerModel {

 String get viewerId; String get username; String get avatarUrl; String get gender; String get shortBio; DateTime get viewTime;
/// Create a copy of ViewerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewerModelCopyWith<ViewerModel> get copyWith => _$ViewerModelCopyWithImpl<ViewerModel>(this as ViewerModel, _$identity);

  /// Serializes this ViewerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewerModel&&(identical(other.viewerId, viewerId) || other.viewerId == viewerId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.shortBio, shortBio) || other.shortBio == shortBio)&&(identical(other.viewTime, viewTime) || other.viewTime == viewTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewerId,username,avatarUrl,gender,shortBio,viewTime);

@override
String toString() {
  return 'ViewerModel(viewerId: $viewerId, username: $username, avatarUrl: $avatarUrl, gender: $gender, shortBio: $shortBio, viewTime: $viewTime)';
}


}

/// @nodoc
abstract mixin class $ViewerModelCopyWith<$Res>  {
  factory $ViewerModelCopyWith(ViewerModel value, $Res Function(ViewerModel) _then) = _$ViewerModelCopyWithImpl;
@useResult
$Res call({
 String viewerId, String username, String avatarUrl, String gender, String shortBio, DateTime viewTime
});




}
/// @nodoc
class _$ViewerModelCopyWithImpl<$Res>
    implements $ViewerModelCopyWith<$Res> {
  _$ViewerModelCopyWithImpl(this._self, this._then);

  final ViewerModel _self;
  final $Res Function(ViewerModel) _then;

/// Create a copy of ViewerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewerId = null,Object? username = null,Object? avatarUrl = null,Object? gender = null,Object? shortBio = null,Object? viewTime = null,}) {
  return _then(_self.copyWith(
viewerId: null == viewerId ? _self.viewerId : viewerId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,shortBio: null == shortBio ? _self.shortBio : shortBio // ignore: cast_nullable_to_non_nullable
as String,viewTime: null == viewTime ? _self.viewTime : viewTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewerModel].
extension ViewerModelPatterns on ViewerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewerModel value)  $default,){
final _that = this;
switch (_that) {
case _ViewerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewerModel value)?  $default,){
final _that = this;
switch (_that) {
case _ViewerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String viewerId,  String username,  String avatarUrl,  String gender,  String shortBio,  DateTime viewTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewerModel() when $default != null:
return $default(_that.viewerId,_that.username,_that.avatarUrl,_that.gender,_that.shortBio,_that.viewTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String viewerId,  String username,  String avatarUrl,  String gender,  String shortBio,  DateTime viewTime)  $default,) {final _that = this;
switch (_that) {
case _ViewerModel():
return $default(_that.viewerId,_that.username,_that.avatarUrl,_that.gender,_that.shortBio,_that.viewTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String viewerId,  String username,  String avatarUrl,  String gender,  String shortBio,  DateTime viewTime)?  $default,) {final _that = this;
switch (_that) {
case _ViewerModel() when $default != null:
return $default(_that.viewerId,_that.username,_that.avatarUrl,_that.gender,_that.shortBio,_that.viewTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewerModel implements ViewerModel {
  const _ViewerModel({required this.viewerId, required this.username, required this.avatarUrl, required this.gender, required this.shortBio, required this.viewTime});
  factory _ViewerModel.fromJson(Map<String, dynamic> json) => _$ViewerModelFromJson(json);

@override final  String viewerId;
@override final  String username;
@override final  String avatarUrl;
@override final  String gender;
@override final  String shortBio;
@override final  DateTime viewTime;

/// Create a copy of ViewerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewerModelCopyWith<_ViewerModel> get copyWith => __$ViewerModelCopyWithImpl<_ViewerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewerModel&&(identical(other.viewerId, viewerId) || other.viewerId == viewerId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.shortBio, shortBio) || other.shortBio == shortBio)&&(identical(other.viewTime, viewTime) || other.viewTime == viewTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,viewerId,username,avatarUrl,gender,shortBio,viewTime);

@override
String toString() {
  return 'ViewerModel(viewerId: $viewerId, username: $username, avatarUrl: $avatarUrl, gender: $gender, shortBio: $shortBio, viewTime: $viewTime)';
}


}

/// @nodoc
abstract mixin class _$ViewerModelCopyWith<$Res> implements $ViewerModelCopyWith<$Res> {
  factory _$ViewerModelCopyWith(_ViewerModel value, $Res Function(_ViewerModel) _then) = __$ViewerModelCopyWithImpl;
@override @useResult
$Res call({
 String viewerId, String username, String avatarUrl, String gender, String shortBio, DateTime viewTime
});




}
/// @nodoc
class __$ViewerModelCopyWithImpl<$Res>
    implements _$ViewerModelCopyWith<$Res> {
  __$ViewerModelCopyWithImpl(this._self, this._then);

  final _ViewerModel _self;
  final $Res Function(_ViewerModel) _then;

/// Create a copy of ViewerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewerId = null,Object? username = null,Object? avatarUrl = null,Object? gender = null,Object? shortBio = null,Object? viewTime = null,}) {
  return _then(_ViewerModel(
viewerId: null == viewerId ? _self.viewerId : viewerId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,shortBio: null == shortBio ? _self.shortBio : shortBio // ignore: cast_nullable_to_non_nullable
as String,viewTime: null == viewTime ? _self.viewTime : viewTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
