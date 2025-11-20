// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diamond_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiamondBalanceModel {

@JsonKey(name: 'diamond_balance') double get diamondBalance;
/// Create a copy of DiamondBalanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiamondBalanceModelCopyWith<DiamondBalanceModel> get copyWith => _$DiamondBalanceModelCopyWithImpl<DiamondBalanceModel>(this as DiamondBalanceModel, _$identity);

  /// Serializes this DiamondBalanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiamondBalanceModel&&(identical(other.diamondBalance, diamondBalance) || other.diamondBalance == diamondBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diamondBalance);

@override
String toString() {
  return 'DiamondBalanceModel(diamondBalance: $diamondBalance)';
}


}

/// @nodoc
abstract mixin class $DiamondBalanceModelCopyWith<$Res>  {
  factory $DiamondBalanceModelCopyWith(DiamondBalanceModel value, $Res Function(DiamondBalanceModel) _then) = _$DiamondBalanceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'diamond_balance') double diamondBalance
});




}
/// @nodoc
class _$DiamondBalanceModelCopyWithImpl<$Res>
    implements $DiamondBalanceModelCopyWith<$Res> {
  _$DiamondBalanceModelCopyWithImpl(this._self, this._then);

  final DiamondBalanceModel _self;
  final $Res Function(DiamondBalanceModel) _then;

/// Create a copy of DiamondBalanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? diamondBalance = null,}) {
  return _then(_self.copyWith(
diamondBalance: null == diamondBalance ? _self.diamondBalance : diamondBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DiamondBalanceModel].
extension DiamondBalanceModelPatterns on DiamondBalanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiamondBalanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiamondBalanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiamondBalanceModel value)  $default,){
final _that = this;
switch (_that) {
case _DiamondBalanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiamondBalanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _DiamondBalanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'diamond_balance')  double diamondBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiamondBalanceModel() when $default != null:
return $default(_that.diamondBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'diamond_balance')  double diamondBalance)  $default,) {final _that = this;
switch (_that) {
case _DiamondBalanceModel():
return $default(_that.diamondBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'diamond_balance')  double diamondBalance)?  $default,) {final _that = this;
switch (_that) {
case _DiamondBalanceModel() when $default != null:
return $default(_that.diamondBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiamondBalanceModel implements DiamondBalanceModel {
  const _DiamondBalanceModel({@JsonKey(name: 'diamond_balance') required this.diamondBalance});
  factory _DiamondBalanceModel.fromJson(Map<String, dynamic> json) => _$DiamondBalanceModelFromJson(json);

@override@JsonKey(name: 'diamond_balance') final  double diamondBalance;

/// Create a copy of DiamondBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiamondBalanceModelCopyWith<_DiamondBalanceModel> get copyWith => __$DiamondBalanceModelCopyWithImpl<_DiamondBalanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiamondBalanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiamondBalanceModel&&(identical(other.diamondBalance, diamondBalance) || other.diamondBalance == diamondBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,diamondBalance);

@override
String toString() {
  return 'DiamondBalanceModel(diamondBalance: $diamondBalance)';
}


}

/// @nodoc
abstract mixin class _$DiamondBalanceModelCopyWith<$Res> implements $DiamondBalanceModelCopyWith<$Res> {
  factory _$DiamondBalanceModelCopyWith(_DiamondBalanceModel value, $Res Function(_DiamondBalanceModel) _then) = __$DiamondBalanceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'diamond_balance') double diamondBalance
});




}
/// @nodoc
class __$DiamondBalanceModelCopyWithImpl<$Res>
    implements _$DiamondBalanceModelCopyWith<$Res> {
  __$DiamondBalanceModelCopyWithImpl(this._self, this._then);

  final _DiamondBalanceModel _self;
  final $Res Function(_DiamondBalanceModel) _then;

/// Create a copy of DiamondBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? diamondBalance = null,}) {
  return _then(_DiamondBalanceModel(
diamondBalance: null == diamondBalance ? _self.diamondBalance : diamondBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
