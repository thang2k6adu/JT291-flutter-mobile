// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletSummaryModel {

 double get totalDiamondBalance; int get vexBalance; String get monthlyCardStatus;
/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletSummaryModelCopyWith<WalletSummaryModel> get copyWith => _$WalletSummaryModelCopyWithImpl<WalletSummaryModel>(this as WalletSummaryModel, _$identity);

  /// Serializes this WalletSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletSummaryModel&&(identical(other.totalDiamondBalance, totalDiamondBalance) || other.totalDiamondBalance == totalDiamondBalance)&&(identical(other.vexBalance, vexBalance) || other.vexBalance == vexBalance)&&(identical(other.monthlyCardStatus, monthlyCardStatus) || other.monthlyCardStatus == monthlyCardStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDiamondBalance,vexBalance,monthlyCardStatus);

@override
String toString() {
  return 'WalletSummaryModel(totalDiamondBalance: $totalDiamondBalance, vexBalance: $vexBalance, monthlyCardStatus: $monthlyCardStatus)';
}


}

/// @nodoc
abstract mixin class $WalletSummaryModelCopyWith<$Res>  {
  factory $WalletSummaryModelCopyWith(WalletSummaryModel value, $Res Function(WalletSummaryModel) _then) = _$WalletSummaryModelCopyWithImpl;
@useResult
$Res call({
 double totalDiamondBalance, int vexBalance, String monthlyCardStatus
});




}
/// @nodoc
class _$WalletSummaryModelCopyWithImpl<$Res>
    implements $WalletSummaryModelCopyWith<$Res> {
  _$WalletSummaryModelCopyWithImpl(this._self, this._then);

  final WalletSummaryModel _self;
  final $Res Function(WalletSummaryModel) _then;

/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDiamondBalance = null,Object? vexBalance = null,Object? monthlyCardStatus = null,}) {
  return _then(_self.copyWith(
totalDiamondBalance: null == totalDiamondBalance ? _self.totalDiamondBalance : totalDiamondBalance // ignore: cast_nullable_to_non_nullable
as double,vexBalance: null == vexBalance ? _self.vexBalance : vexBalance // ignore: cast_nullable_to_non_nullable
as int,monthlyCardStatus: null == monthlyCardStatus ? _self.monthlyCardStatus : monthlyCardStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletSummaryModel].
extension WalletSummaryModelPatterns on WalletSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalDiamondBalance,  int vexBalance,  String monthlyCardStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
return $default(_that.totalDiamondBalance,_that.vexBalance,_that.monthlyCardStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalDiamondBalance,  int vexBalance,  String monthlyCardStatus)  $default,) {final _that = this;
switch (_that) {
case _WalletSummaryModel():
return $default(_that.totalDiamondBalance,_that.vexBalance,_that.monthlyCardStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalDiamondBalance,  int vexBalance,  String monthlyCardStatus)?  $default,) {final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
return $default(_that.totalDiamondBalance,_that.vexBalance,_that.monthlyCardStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletSummaryModel implements WalletSummaryModel {
  const _WalletSummaryModel({required this.totalDiamondBalance, required this.vexBalance, required this.monthlyCardStatus});
  factory _WalletSummaryModel.fromJson(Map<String, dynamic> json) => _$WalletSummaryModelFromJson(json);

@override final  double totalDiamondBalance;
@override final  int vexBalance;
@override final  String monthlyCardStatus;

/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletSummaryModelCopyWith<_WalletSummaryModel> get copyWith => __$WalletSummaryModelCopyWithImpl<_WalletSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletSummaryModel&&(identical(other.totalDiamondBalance, totalDiamondBalance) || other.totalDiamondBalance == totalDiamondBalance)&&(identical(other.vexBalance, vexBalance) || other.vexBalance == vexBalance)&&(identical(other.monthlyCardStatus, monthlyCardStatus) || other.monthlyCardStatus == monthlyCardStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDiamondBalance,vexBalance,monthlyCardStatus);

@override
String toString() {
  return 'WalletSummaryModel(totalDiamondBalance: $totalDiamondBalance, vexBalance: $vexBalance, monthlyCardStatus: $monthlyCardStatus)';
}


}

/// @nodoc
abstract mixin class _$WalletSummaryModelCopyWith<$Res> implements $WalletSummaryModelCopyWith<$Res> {
  factory _$WalletSummaryModelCopyWith(_WalletSummaryModel value, $Res Function(_WalletSummaryModel) _then) = __$WalletSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 double totalDiamondBalance, int vexBalance, String monthlyCardStatus
});




}
/// @nodoc
class __$WalletSummaryModelCopyWithImpl<$Res>
    implements _$WalletSummaryModelCopyWith<$Res> {
  __$WalletSummaryModelCopyWithImpl(this._self, this._then);

  final _WalletSummaryModel _self;
  final $Res Function(_WalletSummaryModel) _then;

/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDiamondBalance = null,Object? vexBalance = null,Object? monthlyCardStatus = null,}) {
  return _then(_WalletSummaryModel(
totalDiamondBalance: null == totalDiamondBalance ? _self.totalDiamondBalance : totalDiamondBalance // ignore: cast_nullable_to_non_nullable
as double,vexBalance: null == vexBalance ? _self.vexBalance : vexBalance // ignore: cast_nullable_to_non_nullable
as int,monthlyCardStatus: null == monthlyCardStatus ? _self.monthlyCardStatus : monthlyCardStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
