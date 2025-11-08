// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recharge_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RechargePackageModel {

 int get packageId; int get diamonds; int get price;
/// Create a copy of RechargePackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RechargePackageModelCopyWith<RechargePackageModel> get copyWith => _$RechargePackageModelCopyWithImpl<RechargePackageModel>(this as RechargePackageModel, _$identity);

  /// Serializes this RechargePackageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RechargePackageModel&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.diamonds, diamonds) || other.diamonds == diamonds)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageId,diamonds,price);

@override
String toString() {
  return 'RechargePackageModel(packageId: $packageId, diamonds: $diamonds, price: $price)';
}


}

/// @nodoc
abstract mixin class $RechargePackageModelCopyWith<$Res>  {
  factory $RechargePackageModelCopyWith(RechargePackageModel value, $Res Function(RechargePackageModel) _then) = _$RechargePackageModelCopyWithImpl;
@useResult
$Res call({
 int packageId, int diamonds, int price
});




}
/// @nodoc
class _$RechargePackageModelCopyWithImpl<$Res>
    implements $RechargePackageModelCopyWith<$Res> {
  _$RechargePackageModelCopyWithImpl(this._self, this._then);

  final RechargePackageModel _self;
  final $Res Function(RechargePackageModel) _then;

/// Create a copy of RechargePackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageId = null,Object? diamonds = null,Object? price = null,}) {
  return _then(_self.copyWith(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int,diamonds: null == diamonds ? _self.diamonds : diamonds // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RechargePackageModel].
extension RechargePackageModelPatterns on RechargePackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RechargePackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RechargePackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RechargePackageModel value)  $default,){
final _that = this;
switch (_that) {
case _RechargePackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RechargePackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _RechargePackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int packageId,  int diamonds,  int price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RechargePackageModel() when $default != null:
return $default(_that.packageId,_that.diamonds,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int packageId,  int diamonds,  int price)  $default,) {final _that = this;
switch (_that) {
case _RechargePackageModel():
return $default(_that.packageId,_that.diamonds,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int packageId,  int diamonds,  int price)?  $default,) {final _that = this;
switch (_that) {
case _RechargePackageModel() when $default != null:
return $default(_that.packageId,_that.diamonds,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RechargePackageModel implements RechargePackageModel {
  const _RechargePackageModel({required this.packageId, required this.diamonds, required this.price});
  factory _RechargePackageModel.fromJson(Map<String, dynamic> json) => _$RechargePackageModelFromJson(json);

@override final  int packageId;
@override final  int diamonds;
@override final  int price;

/// Create a copy of RechargePackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RechargePackageModelCopyWith<_RechargePackageModel> get copyWith => __$RechargePackageModelCopyWithImpl<_RechargePackageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RechargePackageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RechargePackageModel&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.diamonds, diamonds) || other.diamonds == diamonds)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageId,diamonds,price);

@override
String toString() {
  return 'RechargePackageModel(packageId: $packageId, diamonds: $diamonds, price: $price)';
}


}

/// @nodoc
abstract mixin class _$RechargePackageModelCopyWith<$Res> implements $RechargePackageModelCopyWith<$Res> {
  factory _$RechargePackageModelCopyWith(_RechargePackageModel value, $Res Function(_RechargePackageModel) _then) = __$RechargePackageModelCopyWithImpl;
@override @useResult
$Res call({
 int packageId, int diamonds, int price
});




}
/// @nodoc
class __$RechargePackageModelCopyWithImpl<$Res>
    implements _$RechargePackageModelCopyWith<$Res> {
  __$RechargePackageModelCopyWithImpl(this._self, this._then);

  final _RechargePackageModel _self;
  final $Res Function(_RechargePackageModel) _then;

/// Create a copy of RechargePackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageId = null,Object? diamonds = null,Object? price = null,}) {
  return _then(_RechargePackageModel(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int,diamonds: null == diamonds ? _self.diamonds : diamonds // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
