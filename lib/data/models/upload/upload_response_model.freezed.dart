// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadResponseModel {

@JsonKey(name: 'file_url') String? get fileUrl; String? get url; int? get duration;// in seconds
 String? get filename; int? get size; String? get mimetype;@JsonKey(name: 'media_type') String? get mediaType;
/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResponseModelCopyWith<UploadResponseModel> get copyWith => _$UploadResponseModelCopyWithImpl<UploadResponseModel>(this as UploadResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResponseModel&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}


@override
int get hashCode => Object.hash(runtimeType,fileUrl,url,duration,filename,size,mimetype,mediaType);

@override
String toString() {
  return 'UploadResponseModel(fileUrl: $fileUrl, url: $url, duration: $duration, filename: $filename, size: $size, mimetype: $mimetype, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class $UploadResponseModelCopyWith<$Res>  {
  factory $UploadResponseModelCopyWith(UploadResponseModel value, $Res Function(UploadResponseModel) _then) = _$UploadResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'file_url') String? fileUrl, String? url, int? duration, String? filename, int? size, String? mimetype,@JsonKey(name: 'media_type') String? mediaType
});




}
/// @nodoc
class _$UploadResponseModelCopyWithImpl<$Res>
    implements $UploadResponseModelCopyWith<$Res> {
  _$UploadResponseModelCopyWithImpl(this._self, this._then);

  final UploadResponseModel _self;
  final $Res Function(UploadResponseModel) _then;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileUrl = freezed,Object? url = freezed,Object? duration = freezed,Object? filename = freezed,Object? size = freezed,Object? mimetype = freezed,Object? mediaType = freezed,}) {
  return _then(_self.copyWith(
fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadResponseModel].
extension UploadResponseModelPatterns on UploadResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UploadResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'file_url')  String? fileUrl,  String? url,  int? duration,  String? filename,  int? size,  String? mimetype, @JsonKey(name: 'media_type')  String? mediaType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
return $default(_that.fileUrl,_that.url,_that.duration,_that.filename,_that.size,_that.mimetype,_that.mediaType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'file_url')  String? fileUrl,  String? url,  int? duration,  String? filename,  int? size,  String? mimetype, @JsonKey(name: 'media_type')  String? mediaType)  $default,) {final _that = this;
switch (_that) {
case _UploadResponseModel():
return $default(_that.fileUrl,_that.url,_that.duration,_that.filename,_that.size,_that.mimetype,_that.mediaType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'file_url')  String? fileUrl,  String? url,  int? duration,  String? filename,  int? size,  String? mimetype, @JsonKey(name: 'media_type')  String? mediaType)?  $default,) {final _that = this;
switch (_that) {
case _UploadResponseModel() when $default != null:
return $default(_that.fileUrl,_that.url,_that.duration,_that.filename,_that.size,_that.mimetype,_that.mediaType);case _:
  return null;

}
}

}

/// @nodoc


class _UploadResponseModel implements UploadResponseModel {
  const _UploadResponseModel({@JsonKey(name: 'file_url') this.fileUrl, this.url, this.duration, this.filename, this.size, this.mimetype, @JsonKey(name: 'media_type') this.mediaType});
  

@override@JsonKey(name: 'file_url') final  String? fileUrl;
@override final  String? url;
@override final  int? duration;
// in seconds
@override final  String? filename;
@override final  int? size;
@override final  String? mimetype;
@override@JsonKey(name: 'media_type') final  String? mediaType;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseModelCopyWith<_UploadResponseModel> get copyWith => __$UploadResponseModelCopyWithImpl<_UploadResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponseModel&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType));
}


@override
int get hashCode => Object.hash(runtimeType,fileUrl,url,duration,filename,size,mimetype,mediaType);

@override
String toString() {
  return 'UploadResponseModel(fileUrl: $fileUrl, url: $url, duration: $duration, filename: $filename, size: $size, mimetype: $mimetype, mediaType: $mediaType)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseModelCopyWith<$Res> implements $UploadResponseModelCopyWith<$Res> {
  factory _$UploadResponseModelCopyWith(_UploadResponseModel value, $Res Function(_UploadResponseModel) _then) = __$UploadResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'file_url') String? fileUrl, String? url, int? duration, String? filename, int? size, String? mimetype,@JsonKey(name: 'media_type') String? mediaType
});




}
/// @nodoc
class __$UploadResponseModelCopyWithImpl<$Res>
    implements _$UploadResponseModelCopyWith<$Res> {
  __$UploadResponseModelCopyWithImpl(this._self, this._then);

  final _UploadResponseModel _self;
  final $Res Function(_UploadResponseModel) _then;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileUrl = freezed,Object? url = freezed,Object? duration = freezed,Object? filename = freezed,Object? size = freezed,Object? mimetype = freezed,Object? mediaType = freezed,}) {
  return _then(_UploadResponseModel(
fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
