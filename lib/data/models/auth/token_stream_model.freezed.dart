// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_stream_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenStreamModel {

 String get chatToken; String get feedToken; String get apiKey; String get appId;
/// Create a copy of TokenStreamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenStreamModelCopyWith<TokenStreamModel> get copyWith => _$TokenStreamModelCopyWithImpl<TokenStreamModel>(this as TokenStreamModel, _$identity);

  /// Serializes this TokenStreamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenStreamModel&&(identical(other.chatToken, chatToken) || other.chatToken == chatToken)&&(identical(other.feedToken, feedToken) || other.feedToken == feedToken)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.appId, appId) || other.appId == appId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatToken,feedToken,apiKey,appId);

@override
String toString() {
  return 'TokenStreamModel(chatToken: $chatToken, feedToken: $feedToken, apiKey: $apiKey, appId: $appId)';
}


}

/// @nodoc
abstract mixin class $TokenStreamModelCopyWith<$Res>  {
  factory $TokenStreamModelCopyWith(TokenStreamModel value, $Res Function(TokenStreamModel) _then) = _$TokenStreamModelCopyWithImpl;
@useResult
$Res call({
 String chatToken, String feedToken, String apiKey, String appId
});




}
/// @nodoc
class _$TokenStreamModelCopyWithImpl<$Res>
    implements $TokenStreamModelCopyWith<$Res> {
  _$TokenStreamModelCopyWithImpl(this._self, this._then);

  final TokenStreamModel _self;
  final $Res Function(TokenStreamModel) _then;

/// Create a copy of TokenStreamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatToken = null,Object? feedToken = null,Object? apiKey = null,Object? appId = null,}) {
  return _then(_self.copyWith(
chatToken: null == chatToken ? _self.chatToken : chatToken // ignore: cast_nullable_to_non_nullable
as String,feedToken: null == feedToken ? _self.feedToken : feedToken // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenStreamModel].
extension TokenStreamModelPatterns on TokenStreamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenStreamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenStreamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenStreamModel value)  $default,){
final _that = this;
switch (_that) {
case _TokenStreamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenStreamModel value)?  $default,){
final _that = this;
switch (_that) {
case _TokenStreamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatToken,  String feedToken,  String apiKey,  String appId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenStreamModel() when $default != null:
return $default(_that.chatToken,_that.feedToken,_that.apiKey,_that.appId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatToken,  String feedToken,  String apiKey,  String appId)  $default,) {final _that = this;
switch (_that) {
case _TokenStreamModel():
return $default(_that.chatToken,_that.feedToken,_that.apiKey,_that.appId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatToken,  String feedToken,  String apiKey,  String appId)?  $default,) {final _that = this;
switch (_that) {
case _TokenStreamModel() when $default != null:
return $default(_that.chatToken,_that.feedToken,_that.apiKey,_that.appId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenStreamModel implements TokenStreamModel {
  const _TokenStreamModel({required this.chatToken, this.feedToken = '', this.apiKey = '', this.appId = ''});
  factory _TokenStreamModel.fromJson(Map<String, dynamic> json) => _$TokenStreamModelFromJson(json);

@override final  String chatToken;
@override@JsonKey() final  String feedToken;
@override@JsonKey() final  String apiKey;
@override@JsonKey() final  String appId;

/// Create a copy of TokenStreamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenStreamModelCopyWith<_TokenStreamModel> get copyWith => __$TokenStreamModelCopyWithImpl<_TokenStreamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenStreamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenStreamModel&&(identical(other.chatToken, chatToken) || other.chatToken == chatToken)&&(identical(other.feedToken, feedToken) || other.feedToken == feedToken)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.appId, appId) || other.appId == appId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatToken,feedToken,apiKey,appId);

@override
String toString() {
  return 'TokenStreamModel(chatToken: $chatToken, feedToken: $feedToken, apiKey: $apiKey, appId: $appId)';
}


}

/// @nodoc
abstract mixin class _$TokenStreamModelCopyWith<$Res> implements $TokenStreamModelCopyWith<$Res> {
  factory _$TokenStreamModelCopyWith(_TokenStreamModel value, $Res Function(_TokenStreamModel) _then) = __$TokenStreamModelCopyWithImpl;
@override @useResult
$Res call({
 String chatToken, String feedToken, String apiKey, String appId
});




}
/// @nodoc
class __$TokenStreamModelCopyWithImpl<$Res>
    implements _$TokenStreamModelCopyWith<$Res> {
  __$TokenStreamModelCopyWithImpl(this._self, this._then);

  final _TokenStreamModel _self;
  final $Res Function(_TokenStreamModel) _then;

/// Create a copy of TokenStreamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatToken = null,Object? feedToken = null,Object? apiKey = null,Object? appId = null,}) {
  return _then(_TokenStreamModel(
chatToken: null == chatToken ? _self.chatToken : chatToken // ignore: cast_nullable_to_non_nullable
as String,feedToken: null == feedToken ? _self.feedToken : feedToken // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
