// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileState {

/// User profile data
 UserModel? get user;/// Relationship với current user
 UserRelationshipModel? get relationship;/// Loading states
 bool get isLoading; bool get isFollowLoading;/// Error handling
 String? get error;/// Profile images for carousel
 List<String> get profileImages;
/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileStateCopyWith<UserProfileState> get copyWith => _$UserProfileStateCopyWithImpl<UserProfileState>(this as UserProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileState&&(identical(other.user, user) || other.user == user)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFollowLoading, isFollowLoading) || other.isFollowLoading == isFollowLoading)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.profileImages, profileImages));
}


@override
int get hashCode => Object.hash(runtimeType,user,relationship,isLoading,isFollowLoading,error,const DeepCollectionEquality().hash(profileImages));

@override
String toString() {
  return 'UserProfileState(user: $user, relationship: $relationship, isLoading: $isLoading, isFollowLoading: $isFollowLoading, error: $error, profileImages: $profileImages)';
}


}

/// @nodoc
abstract mixin class $UserProfileStateCopyWith<$Res>  {
  factory $UserProfileStateCopyWith(UserProfileState value, $Res Function(UserProfileState) _then) = _$UserProfileStateCopyWithImpl;
@useResult
$Res call({
 UserModel? user, UserRelationshipModel? relationship, bool isLoading, bool isFollowLoading, String? error, List<String> profileImages
});


$UserModelCopyWith<$Res>? get user;$UserRelationshipModelCopyWith<$Res>? get relationship;

}
/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._self, this._then);

  final UserProfileState _self;
  final $Res Function(UserProfileState) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? relationship = freezed,Object? isLoading = null,Object? isFollowLoading = null,Object? error = freezed,Object? profileImages = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,relationship: freezed == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as UserRelationshipModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFollowLoading: null == isFollowLoading ? _self.isFollowLoading : isFollowLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,profileImages: null == profileImages ? _self.profileImages : profileImages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRelationshipModelCopyWith<$Res>? get relationship {
    if (_self.relationship == null) {
    return null;
  }

  return $UserRelationshipModelCopyWith<$Res>(_self.relationship!, (value) {
    return _then(_self.copyWith(relationship: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfileState].
extension UserProfileStatePatterns on UserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileState value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel? user,  UserRelationshipModel? relationship,  bool isLoading,  bool isFollowLoading,  String? error,  List<String> profileImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
return $default(_that.user,_that.relationship,_that.isLoading,_that.isFollowLoading,_that.error,_that.profileImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel? user,  UserRelationshipModel? relationship,  bool isLoading,  bool isFollowLoading,  String? error,  List<String> profileImages)  $default,) {final _that = this;
switch (_that) {
case _UserProfileState():
return $default(_that.user,_that.relationship,_that.isLoading,_that.isFollowLoading,_that.error,_that.profileImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel? user,  UserRelationshipModel? relationship,  bool isLoading,  bool isFollowLoading,  String? error,  List<String> profileImages)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
return $default(_that.user,_that.relationship,_that.isLoading,_that.isFollowLoading,_that.error,_that.profileImages);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileState extends UserProfileState {
  const _UserProfileState({this.user, this.relationship, this.isLoading = true, this.isFollowLoading = false, this.error, final  List<String> profileImages = const []}): _profileImages = profileImages,super._();
  

/// User profile data
@override final  UserModel? user;
/// Relationship với current user
@override final  UserRelationshipModel? relationship;
/// Loading states
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFollowLoading;
/// Error handling
@override final  String? error;
/// Profile images for carousel
 final  List<String> _profileImages;
/// Profile images for carousel
@override@JsonKey() List<String> get profileImages {
  if (_profileImages is EqualUnmodifiableListView) return _profileImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profileImages);
}


/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileStateCopyWith<_UserProfileState> get copyWith => __$UserProfileStateCopyWithImpl<_UserProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileState&&(identical(other.user, user) || other.user == user)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFollowLoading, isFollowLoading) || other.isFollowLoading == isFollowLoading)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._profileImages, _profileImages));
}


@override
int get hashCode => Object.hash(runtimeType,user,relationship,isLoading,isFollowLoading,error,const DeepCollectionEquality().hash(_profileImages));

@override
String toString() {
  return 'UserProfileState(user: $user, relationship: $relationship, isLoading: $isLoading, isFollowLoading: $isFollowLoading, error: $error, profileImages: $profileImages)';
}


}

/// @nodoc
abstract mixin class _$UserProfileStateCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory _$UserProfileStateCopyWith(_UserProfileState value, $Res Function(_UserProfileState) _then) = __$UserProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserModel? user, UserRelationshipModel? relationship, bool isLoading, bool isFollowLoading, String? error, List<String> profileImages
});


@override $UserModelCopyWith<$Res>? get user;@override $UserRelationshipModelCopyWith<$Res>? get relationship;

}
/// @nodoc
class __$UserProfileStateCopyWithImpl<$Res>
    implements _$UserProfileStateCopyWith<$Res> {
  __$UserProfileStateCopyWithImpl(this._self, this._then);

  final _UserProfileState _self;
  final $Res Function(_UserProfileState) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? relationship = freezed,Object? isLoading = null,Object? isFollowLoading = null,Object? error = freezed,Object? profileImages = null,}) {
  return _then(_UserProfileState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,relationship: freezed == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as UserRelationshipModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFollowLoading: null == isFollowLoading ? _self.isFollowLoading : isFollowLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,profileImages: null == profileImages ? _self._profileImages : profileImages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserRelationshipModelCopyWith<$Res>? get relationship {
    if (_self.relationship == null) {
    return null;
  }

  return $UserRelationshipModelCopyWith<$Res>(_self.relationship!, (value) {
    return _then(_self.copyWith(relationship: value));
  });
}
}

// dart format on
