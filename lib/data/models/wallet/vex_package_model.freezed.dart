// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vex_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VexPackageModel {

 int get packageId;@JsonKey(name: 'vexAmount') int get vexAmount;@JsonKey(name: 'baseDiamonds') int get baseDiamonds;@JsonKey(name: 'bonusDiamonds') int get bonusDiamonds;@JsonKey(name: 'totalDiamonds') int get totalDiamonds;
/// Create a copy of VexPackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VexPackageModelCopyWith<VexPackageModel> get copyWith => _$VexPackageModelCopyWithImpl<VexPackageModel>(this as VexPackageModel, _$identity);

  /// Serializes this VexPackageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VexPackageModel&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.vexAmount, vexAmount) || other.vexAmount == vexAmount)&&(identical(other.baseDiamonds, baseDiamonds) || other.baseDiamonds == baseDiamonds)&&(identical(other.bonusDiamonds, bonusDiamonds) || other.bonusDiamonds == bonusDiamonds)&&(identical(other.totalDiamonds, totalDiamonds) || other.totalDiamonds == totalDiamonds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageId,vexAmount,baseDiamonds,bonusDiamonds,totalDiamonds);

@override
String toString() {
  return 'VexPackageModel(packageId: $packageId, vexAmount: $vexAmount, baseDiamonds: $baseDiamonds, bonusDiamonds: $bonusDiamonds, totalDiamonds: $totalDiamonds)';
}


}

/// @nodoc
abstract mixin class $VexPackageModelCopyWith<$Res>  {
  factory $VexPackageModelCopyWith(VexPackageModel value, $Res Function(VexPackageModel) _then) = _$VexPackageModelCopyWithImpl;
@useResult
$Res call({
 int packageId,@JsonKey(name: 'vexAmount') int vexAmount,@JsonKey(name: 'baseDiamonds') int baseDiamonds,@JsonKey(name: 'bonusDiamonds') int bonusDiamonds,@JsonKey(name: 'totalDiamonds') int totalDiamonds
});




}
/// @nodoc
class _$VexPackageModelCopyWithImpl<$Res>
    implements $VexPackageModelCopyWith<$Res> {
  _$VexPackageModelCopyWithImpl(this._self, this._then);

  final VexPackageModel _self;
  final $Res Function(VexPackageModel) _then;

/// Create a copy of VexPackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageId = null,Object? vexAmount = null,Object? baseDiamonds = null,Object? bonusDiamonds = null,Object? totalDiamonds = null,}) {
  return _then(_self.copyWith(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int,vexAmount: null == vexAmount ? _self.vexAmount : vexAmount // ignore: cast_nullable_to_non_nullable
as int,baseDiamonds: null == baseDiamonds ? _self.baseDiamonds : baseDiamonds // ignore: cast_nullable_to_non_nullable
as int,bonusDiamonds: null == bonusDiamonds ? _self.bonusDiamonds : bonusDiamonds // ignore: cast_nullable_to_non_nullable
as int,totalDiamonds: null == totalDiamonds ? _self.totalDiamonds : totalDiamonds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VexPackageModel].
extension VexPackageModelPatterns on VexPackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VexPackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VexPackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VexPackageModel value)  $default,){
final _that = this;
switch (_that) {
case _VexPackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VexPackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _VexPackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int packageId, @JsonKey(name: 'vexAmount')  int vexAmount, @JsonKey(name: 'baseDiamonds')  int baseDiamonds, @JsonKey(name: 'bonusDiamonds')  int bonusDiamonds, @JsonKey(name: 'totalDiamonds')  int totalDiamonds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VexPackageModel() when $default != null:
return $default(_that.packageId,_that.vexAmount,_that.baseDiamonds,_that.bonusDiamonds,_that.totalDiamonds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int packageId, @JsonKey(name: 'vexAmount')  int vexAmount, @JsonKey(name: 'baseDiamonds')  int baseDiamonds, @JsonKey(name: 'bonusDiamonds')  int bonusDiamonds, @JsonKey(name: 'totalDiamonds')  int totalDiamonds)  $default,) {final _that = this;
switch (_that) {
case _VexPackageModel():
return $default(_that.packageId,_that.vexAmount,_that.baseDiamonds,_that.bonusDiamonds,_that.totalDiamonds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int packageId, @JsonKey(name: 'vexAmount')  int vexAmount, @JsonKey(name: 'baseDiamonds')  int baseDiamonds, @JsonKey(name: 'bonusDiamonds')  int bonusDiamonds, @JsonKey(name: 'totalDiamonds')  int totalDiamonds)?  $default,) {final _that = this;
switch (_that) {
case _VexPackageModel() when $default != null:
return $default(_that.packageId,_that.vexAmount,_that.baseDiamonds,_that.bonusDiamonds,_that.totalDiamonds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VexPackageModel implements VexPackageModel {
  const _VexPackageModel({required this.packageId, @JsonKey(name: 'vexAmount') required this.vexAmount, @JsonKey(name: 'baseDiamonds') required this.baseDiamonds, @JsonKey(name: 'bonusDiamonds') required this.bonusDiamonds, @JsonKey(name: 'totalDiamonds') required this.totalDiamonds});
  factory _VexPackageModel.fromJson(Map<String, dynamic> json) => _$VexPackageModelFromJson(json);

@override final  int packageId;
@override@JsonKey(name: 'vexAmount') final  int vexAmount;
@override@JsonKey(name: 'baseDiamonds') final  int baseDiamonds;
@override@JsonKey(name: 'bonusDiamonds') final  int bonusDiamonds;
@override@JsonKey(name: 'totalDiamonds') final  int totalDiamonds;

/// Create a copy of VexPackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VexPackageModelCopyWith<_VexPackageModel> get copyWith => __$VexPackageModelCopyWithImpl<_VexPackageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VexPackageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VexPackageModel&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.vexAmount, vexAmount) || other.vexAmount == vexAmount)&&(identical(other.baseDiamonds, baseDiamonds) || other.baseDiamonds == baseDiamonds)&&(identical(other.bonusDiamonds, bonusDiamonds) || other.bonusDiamonds == bonusDiamonds)&&(identical(other.totalDiamonds, totalDiamonds) || other.totalDiamonds == totalDiamonds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageId,vexAmount,baseDiamonds,bonusDiamonds,totalDiamonds);

@override
String toString() {
  return 'VexPackageModel(packageId: $packageId, vexAmount: $vexAmount, baseDiamonds: $baseDiamonds, bonusDiamonds: $bonusDiamonds, totalDiamonds: $totalDiamonds)';
}


}

/// @nodoc
abstract mixin class _$VexPackageModelCopyWith<$Res> implements $VexPackageModelCopyWith<$Res> {
  factory _$VexPackageModelCopyWith(_VexPackageModel value, $Res Function(_VexPackageModel) _then) = __$VexPackageModelCopyWithImpl;
@override @useResult
$Res call({
 int packageId,@JsonKey(name: 'vexAmount') int vexAmount,@JsonKey(name: 'baseDiamonds') int baseDiamonds,@JsonKey(name: 'bonusDiamonds') int bonusDiamonds,@JsonKey(name: 'totalDiamonds') int totalDiamonds
});




}
/// @nodoc
class __$VexPackageModelCopyWithImpl<$Res>
    implements _$VexPackageModelCopyWith<$Res> {
  __$VexPackageModelCopyWithImpl(this._self, this._then);

  final _VexPackageModel _self;
  final $Res Function(_VexPackageModel) _then;

/// Create a copy of VexPackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageId = null,Object? vexAmount = null,Object? baseDiamonds = null,Object? bonusDiamonds = null,Object? totalDiamonds = null,}) {
  return _then(_VexPackageModel(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int,vexAmount: null == vexAmount ? _self.vexAmount : vexAmount // ignore: cast_nullable_to_non_nullable
as int,baseDiamonds: null == baseDiamonds ? _self.baseDiamonds : baseDiamonds // ignore: cast_nullable_to_non_nullable
as int,bonusDiamonds: null == bonusDiamonds ? _self.bonusDiamonds : bonusDiamonds // ignore: cast_nullable_to_non_nullable
as int,totalDiamonds: null == totalDiamonds ? _self.totalDiamonds : totalDiamonds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
