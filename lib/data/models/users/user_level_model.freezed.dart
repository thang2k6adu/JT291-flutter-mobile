// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLevelModel {

@JsonKey(name: 'current_level') int get currentLevel;@JsonKey(name: 'current_exp') int get currentExp;@JsonKey(name: 'total_exp') int get totalExp;@JsonKey(name: 'next_level_exp') int get nextLevelExp;
/// Create a copy of UserLevelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLevelModelCopyWith<UserLevelModel> get copyWith => _$UserLevelModelCopyWithImpl<UserLevelModel>(this as UserLevelModel, _$identity);

  /// Serializes this UserLevelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLevelModel&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentExp, currentExp) || other.currentExp == currentExp)&&(identical(other.totalExp, totalExp) || other.totalExp == totalExp)&&(identical(other.nextLevelExp, nextLevelExp) || other.nextLevelExp == nextLevelExp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentLevel,currentExp,totalExp,nextLevelExp);

@override
String toString() {
  return 'UserLevelModel(currentLevel: $currentLevel, currentExp: $currentExp, totalExp: $totalExp, nextLevelExp: $nextLevelExp)';
}


}

/// @nodoc
abstract mixin class $UserLevelModelCopyWith<$Res>  {
  factory $UserLevelModelCopyWith(UserLevelModel value, $Res Function(UserLevelModel) _then) = _$UserLevelModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_level') int currentLevel,@JsonKey(name: 'current_exp') int currentExp,@JsonKey(name: 'total_exp') int totalExp,@JsonKey(name: 'next_level_exp') int nextLevelExp
});




}
/// @nodoc
class _$UserLevelModelCopyWithImpl<$Res>
    implements $UserLevelModelCopyWith<$Res> {
  _$UserLevelModelCopyWithImpl(this._self, this._then);

  final UserLevelModel _self;
  final $Res Function(UserLevelModel) _then;

/// Create a copy of UserLevelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLevel = null,Object? currentExp = null,Object? totalExp = null,Object? nextLevelExp = null,}) {
  return _then(_self.copyWith(
currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,currentExp: null == currentExp ? _self.currentExp : currentExp // ignore: cast_nullable_to_non_nullable
as int,totalExp: null == totalExp ? _self.totalExp : totalExp // ignore: cast_nullable_to_non_nullable
as int,nextLevelExp: null == nextLevelExp ? _self.nextLevelExp : nextLevelExp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLevelModel].
extension UserLevelModelPatterns on UserLevelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLevelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLevelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLevelModel value)  $default,){
final _that = this;
switch (_that) {
case _UserLevelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLevelModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserLevelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_level')  int currentLevel, @JsonKey(name: 'current_exp')  int currentExp, @JsonKey(name: 'total_exp')  int totalExp, @JsonKey(name: 'next_level_exp')  int nextLevelExp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLevelModel() when $default != null:
return $default(_that.currentLevel,_that.currentExp,_that.totalExp,_that.nextLevelExp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_level')  int currentLevel, @JsonKey(name: 'current_exp')  int currentExp, @JsonKey(name: 'total_exp')  int totalExp, @JsonKey(name: 'next_level_exp')  int nextLevelExp)  $default,) {final _that = this;
switch (_that) {
case _UserLevelModel():
return $default(_that.currentLevel,_that.currentExp,_that.totalExp,_that.nextLevelExp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_level')  int currentLevel, @JsonKey(name: 'current_exp')  int currentExp, @JsonKey(name: 'total_exp')  int totalExp, @JsonKey(name: 'next_level_exp')  int nextLevelExp)?  $default,) {final _that = this;
switch (_that) {
case _UserLevelModel() when $default != null:
return $default(_that.currentLevel,_that.currentExp,_that.totalExp,_that.nextLevelExp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLevelModel implements UserLevelModel {
  const _UserLevelModel({@JsonKey(name: 'current_level') this.currentLevel = 0, @JsonKey(name: 'current_exp') this.currentExp = 0, @JsonKey(name: 'total_exp') this.totalExp = 0, @JsonKey(name: 'next_level_exp') this.nextLevelExp = 50});
  factory _UserLevelModel.fromJson(Map<String, dynamic> json) => _$UserLevelModelFromJson(json);

@override@JsonKey(name: 'current_level') final  int currentLevel;
@override@JsonKey(name: 'current_exp') final  int currentExp;
@override@JsonKey(name: 'total_exp') final  int totalExp;
@override@JsonKey(name: 'next_level_exp') final  int nextLevelExp;

/// Create a copy of UserLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLevelModelCopyWith<_UserLevelModel> get copyWith => __$UserLevelModelCopyWithImpl<_UserLevelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLevelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLevelModel&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentExp, currentExp) || other.currentExp == currentExp)&&(identical(other.totalExp, totalExp) || other.totalExp == totalExp)&&(identical(other.nextLevelExp, nextLevelExp) || other.nextLevelExp == nextLevelExp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentLevel,currentExp,totalExp,nextLevelExp);

@override
String toString() {
  return 'UserLevelModel(currentLevel: $currentLevel, currentExp: $currentExp, totalExp: $totalExp, nextLevelExp: $nextLevelExp)';
}


}

/// @nodoc
abstract mixin class _$UserLevelModelCopyWith<$Res> implements $UserLevelModelCopyWith<$Res> {
  factory _$UserLevelModelCopyWith(_UserLevelModel value, $Res Function(_UserLevelModel) _then) = __$UserLevelModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_level') int currentLevel,@JsonKey(name: 'current_exp') int currentExp,@JsonKey(name: 'total_exp') int totalExp,@JsonKey(name: 'next_level_exp') int nextLevelExp
});




}
/// @nodoc
class __$UserLevelModelCopyWithImpl<$Res>
    implements _$UserLevelModelCopyWith<$Res> {
  __$UserLevelModelCopyWithImpl(this._self, this._then);

  final _UserLevelModel _self;
  final $Res Function(_UserLevelModel) _then;

/// Create a copy of UserLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLevel = null,Object? currentExp = null,Object? totalExp = null,Object? nextLevelExp = null,}) {
  return _then(_UserLevelModel(
currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,currentExp: null == currentExp ? _self.currentExp : currentExp // ignore: cast_nullable_to_non_nullable
as int,totalExp: null == totalExp ? _self.totalExp : totalExp // ignore: cast_nullable_to_non_nullable
as int,nextLevelExp: null == nextLevelExp ? _self.nextLevelExp : nextLevelExp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
