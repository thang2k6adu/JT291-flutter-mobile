// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_general.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserGeneralModel {

 String? get id; String? get gender; String? get nickname; String? get bio;@JsonKey(name: 'date_of_birth') DateTime? get dateOfBirth;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'profile_urls') List<String>? get profileUrls; List<String>? get interests;
/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserGeneralModelCopyWith<UserGeneralModel> get copyWith => _$UserGeneralModelCopyWithImpl<UserGeneralModel>(this as UserGeneralModel, _$identity);

  /// Serializes this UserGeneralModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserGeneralModel&&(identical(other.id, id) || other.id == id)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other.profileUrls, profileUrls)&&const DeepCollectionEquality().equals(other.interests, interests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,gender,nickname,bio,dateOfBirth,avatarUrl,const DeepCollectionEquality().hash(profileUrls),const DeepCollectionEquality().hash(interests));

@override
String toString() {
  return 'UserGeneralModel(id: $id, gender: $gender, nickname: $nickname, bio: $bio, dateOfBirth: $dateOfBirth, avatarUrl: $avatarUrl, profileUrls: $profileUrls, interests: $interests)';
}


}

/// @nodoc
abstract mixin class $UserGeneralModelCopyWith<$Res>  {
  factory $UserGeneralModelCopyWith(UserGeneralModel value, $Res Function(UserGeneralModel) _then) = _$UserGeneralModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? gender, String? nickname, String? bio,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'profile_urls') List<String>? profileUrls, List<String>? interests
});




}
/// @nodoc
class _$UserGeneralModelCopyWithImpl<$Res>
    implements $UserGeneralModelCopyWith<$Res> {
  _$UserGeneralModelCopyWithImpl(this._self, this._then);

  final UserGeneralModel _self;
  final $Res Function(UserGeneralModel) _then;

/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? gender = freezed,Object? nickname = freezed,Object? bio = freezed,Object? dateOfBirth = freezed,Object? avatarUrl = freezed,Object? profileUrls = freezed,Object? interests = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,profileUrls: freezed == profileUrls ? _self.profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserGeneralModel].
extension UserGeneralModelPatterns on UserGeneralModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserGeneralModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserGeneralModel value)  $default,){
final _that = this;
switch (_that) {
case _UserGeneralModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserGeneralModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? gender,  String? nickname,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'profile_urls')  List<String>? profileUrls,  List<String>? interests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
return $default(_that.id,_that.gender,_that.nickname,_that.bio,_that.dateOfBirth,_that.avatarUrl,_that.profileUrls,_that.interests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? gender,  String? nickname,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'profile_urls')  List<String>? profileUrls,  List<String>? interests)  $default,) {final _that = this;
switch (_that) {
case _UserGeneralModel():
return $default(_that.id,_that.gender,_that.nickname,_that.bio,_that.dateOfBirth,_that.avatarUrl,_that.profileUrls,_that.interests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? gender,  String? nickname,  String? bio, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'profile_urls')  List<String>? profileUrls,  List<String>? interests)?  $default,) {final _that = this;
switch (_that) {
case _UserGeneralModel() when $default != null:
return $default(_that.id,_that.gender,_that.nickname,_that.bio,_that.dateOfBirth,_that.avatarUrl,_that.profileUrls,_that.interests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserGeneralModel implements UserGeneralModel {
  const _UserGeneralModel({this.id, this.gender, this.nickname, this.bio, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'profile_urls') final  List<String>? profileUrls, final  List<String>? interests}): _profileUrls = profileUrls,_interests = interests;
  factory _UserGeneralModel.fromJson(Map<String, dynamic> json) => _$UserGeneralModelFromJson(json);

@override final  String? id;
@override final  String? gender;
@override final  String? nickname;
@override final  String? bio;
@override@JsonKey(name: 'date_of_birth') final  DateTime? dateOfBirth;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
 final  List<String>? _profileUrls;
@override@JsonKey(name: 'profile_urls') List<String>? get profileUrls {
  final value = _profileUrls;
  if (value == null) return null;
  if (_profileUrls is EqualUnmodifiableListView) return _profileUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _interests;
@override List<String>? get interests {
  final value = _interests;
  if (value == null) return null;
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserGeneralModelCopyWith<_UserGeneralModel> get copyWith => __$UserGeneralModelCopyWithImpl<_UserGeneralModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserGeneralModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserGeneralModel&&(identical(other.id, id) || other.id == id)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&const DeepCollectionEquality().equals(other._profileUrls, _profileUrls)&&const DeepCollectionEquality().equals(other._interests, _interests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,gender,nickname,bio,dateOfBirth,avatarUrl,const DeepCollectionEquality().hash(_profileUrls),const DeepCollectionEquality().hash(_interests));

@override
String toString() {
  return 'UserGeneralModel(id: $id, gender: $gender, nickname: $nickname, bio: $bio, dateOfBirth: $dateOfBirth, avatarUrl: $avatarUrl, profileUrls: $profileUrls, interests: $interests)';
}


}

/// @nodoc
abstract mixin class _$UserGeneralModelCopyWith<$Res> implements $UserGeneralModelCopyWith<$Res> {
  factory _$UserGeneralModelCopyWith(_UserGeneralModel value, $Res Function(_UserGeneralModel) _then) = __$UserGeneralModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? gender, String? nickname, String? bio,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'profile_urls') List<String>? profileUrls, List<String>? interests
});




}
/// @nodoc
class __$UserGeneralModelCopyWithImpl<$Res>
    implements _$UserGeneralModelCopyWith<$Res> {
  __$UserGeneralModelCopyWithImpl(this._self, this._then);

  final _UserGeneralModel _self;
  final $Res Function(_UserGeneralModel) _then;

/// Create a copy of UserGeneralModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? gender = freezed,Object? nickname = freezed,Object? bio = freezed,Object? dateOfBirth = freezed,Object? avatarUrl = freezed,Object? profileUrls = freezed,Object? interests = freezed,}) {
  return _then(_UserGeneralModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,profileUrls: freezed == profileUrls ? _self._profileUrls : profileUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,interests: freezed == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
