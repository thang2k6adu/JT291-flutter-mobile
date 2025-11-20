// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vex_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VexBalanceModel {

@JsonKey(name: 'vex_balance') double get vexBalance;@JsonKey(name: 'vex_balance_usd') double get vexBalanceUsd;@JsonKey(name: 'exchange_rate') ExchangeRate get exchangeRate;@JsonKey(name: 'daily_limits') DailyLimits get dailyLimits;
/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VexBalanceModelCopyWith<VexBalanceModel> get copyWith => _$VexBalanceModelCopyWithImpl<VexBalanceModel>(this as VexBalanceModel, _$identity);

  /// Serializes this VexBalanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VexBalanceModel&&(identical(other.vexBalance, vexBalance) || other.vexBalance == vexBalance)&&(identical(other.vexBalanceUsd, vexBalanceUsd) || other.vexBalanceUsd == vexBalanceUsd)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.dailyLimits, dailyLimits) || other.dailyLimits == dailyLimits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vexBalance,vexBalanceUsd,exchangeRate,dailyLimits);

@override
String toString() {
  return 'VexBalanceModel(vexBalance: $vexBalance, vexBalanceUsd: $vexBalanceUsd, exchangeRate: $exchangeRate, dailyLimits: $dailyLimits)';
}


}

/// @nodoc
abstract mixin class $VexBalanceModelCopyWith<$Res>  {
  factory $VexBalanceModelCopyWith(VexBalanceModel value, $Res Function(VexBalanceModel) _then) = _$VexBalanceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vex_balance') double vexBalance,@JsonKey(name: 'vex_balance_usd') double vexBalanceUsd,@JsonKey(name: 'exchange_rate') ExchangeRate exchangeRate,@JsonKey(name: 'daily_limits') DailyLimits dailyLimits
});


$ExchangeRateCopyWith<$Res> get exchangeRate;$DailyLimitsCopyWith<$Res> get dailyLimits;

}
/// @nodoc
class _$VexBalanceModelCopyWithImpl<$Res>
    implements $VexBalanceModelCopyWith<$Res> {
  _$VexBalanceModelCopyWithImpl(this._self, this._then);

  final VexBalanceModel _self;
  final $Res Function(VexBalanceModel) _then;

/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vexBalance = null,Object? vexBalanceUsd = null,Object? exchangeRate = null,Object? dailyLimits = null,}) {
  return _then(_self.copyWith(
vexBalance: null == vexBalance ? _self.vexBalance : vexBalance // ignore: cast_nullable_to_non_nullable
as double,vexBalanceUsd: null == vexBalanceUsd ? _self.vexBalanceUsd : vexBalanceUsd // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRate,dailyLimits: null == dailyLimits ? _self.dailyLimits : dailyLimits // ignore: cast_nullable_to_non_nullable
as DailyLimits,
  ));
}
/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExchangeRateCopyWith<$Res> get exchangeRate {
  
  return $ExchangeRateCopyWith<$Res>(_self.exchangeRate, (value) {
    return _then(_self.copyWith(exchangeRate: value));
  });
}/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyLimitsCopyWith<$Res> get dailyLimits {
  
  return $DailyLimitsCopyWith<$Res>(_self.dailyLimits, (value) {
    return _then(_self.copyWith(dailyLimits: value));
  });
}
}


/// Adds pattern-matching-related methods to [VexBalanceModel].
extension VexBalanceModelPatterns on VexBalanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VexBalanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VexBalanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VexBalanceModel value)  $default,){
final _that = this;
switch (_that) {
case _VexBalanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VexBalanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _VexBalanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'vex_balance')  double vexBalance, @JsonKey(name: 'vex_balance_usd')  double vexBalanceUsd, @JsonKey(name: 'exchange_rate')  ExchangeRate exchangeRate, @JsonKey(name: 'daily_limits')  DailyLimits dailyLimits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VexBalanceModel() when $default != null:
return $default(_that.vexBalance,_that.vexBalanceUsd,_that.exchangeRate,_that.dailyLimits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'vex_balance')  double vexBalance, @JsonKey(name: 'vex_balance_usd')  double vexBalanceUsd, @JsonKey(name: 'exchange_rate')  ExchangeRate exchangeRate, @JsonKey(name: 'daily_limits')  DailyLimits dailyLimits)  $default,) {final _that = this;
switch (_that) {
case _VexBalanceModel():
return $default(_that.vexBalance,_that.vexBalanceUsd,_that.exchangeRate,_that.dailyLimits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'vex_balance')  double vexBalance, @JsonKey(name: 'vex_balance_usd')  double vexBalanceUsd, @JsonKey(name: 'exchange_rate')  ExchangeRate exchangeRate, @JsonKey(name: 'daily_limits')  DailyLimits dailyLimits)?  $default,) {final _that = this;
switch (_that) {
case _VexBalanceModel() when $default != null:
return $default(_that.vexBalance,_that.vexBalanceUsd,_that.exchangeRate,_that.dailyLimits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VexBalanceModel implements VexBalanceModel {
  const _VexBalanceModel({@JsonKey(name: 'vex_balance') required this.vexBalance, @JsonKey(name: 'vex_balance_usd') required this.vexBalanceUsd, @JsonKey(name: 'exchange_rate') required this.exchangeRate, @JsonKey(name: 'daily_limits') required this.dailyLimits});
  factory _VexBalanceModel.fromJson(Map<String, dynamic> json) => _$VexBalanceModelFromJson(json);

@override@JsonKey(name: 'vex_balance') final  double vexBalance;
@override@JsonKey(name: 'vex_balance_usd') final  double vexBalanceUsd;
@override@JsonKey(name: 'exchange_rate') final  ExchangeRate exchangeRate;
@override@JsonKey(name: 'daily_limits') final  DailyLimits dailyLimits;

/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VexBalanceModelCopyWith<_VexBalanceModel> get copyWith => __$VexBalanceModelCopyWithImpl<_VexBalanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VexBalanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VexBalanceModel&&(identical(other.vexBalance, vexBalance) || other.vexBalance == vexBalance)&&(identical(other.vexBalanceUsd, vexBalanceUsd) || other.vexBalanceUsd == vexBalanceUsd)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.dailyLimits, dailyLimits) || other.dailyLimits == dailyLimits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vexBalance,vexBalanceUsd,exchangeRate,dailyLimits);

@override
String toString() {
  return 'VexBalanceModel(vexBalance: $vexBalance, vexBalanceUsd: $vexBalanceUsd, exchangeRate: $exchangeRate, dailyLimits: $dailyLimits)';
}


}

/// @nodoc
abstract mixin class _$VexBalanceModelCopyWith<$Res> implements $VexBalanceModelCopyWith<$Res> {
  factory _$VexBalanceModelCopyWith(_VexBalanceModel value, $Res Function(_VexBalanceModel) _then) = __$VexBalanceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vex_balance') double vexBalance,@JsonKey(name: 'vex_balance_usd') double vexBalanceUsd,@JsonKey(name: 'exchange_rate') ExchangeRate exchangeRate,@JsonKey(name: 'daily_limits') DailyLimits dailyLimits
});


@override $ExchangeRateCopyWith<$Res> get exchangeRate;@override $DailyLimitsCopyWith<$Res> get dailyLimits;

}
/// @nodoc
class __$VexBalanceModelCopyWithImpl<$Res>
    implements _$VexBalanceModelCopyWith<$Res> {
  __$VexBalanceModelCopyWithImpl(this._self, this._then);

  final _VexBalanceModel _self;
  final $Res Function(_VexBalanceModel) _then;

/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vexBalance = null,Object? vexBalanceUsd = null,Object? exchangeRate = null,Object? dailyLimits = null,}) {
  return _then(_VexBalanceModel(
vexBalance: null == vexBalance ? _self.vexBalance : vexBalance // ignore: cast_nullable_to_non_nullable
as double,vexBalanceUsd: null == vexBalanceUsd ? _self.vexBalanceUsd : vexBalanceUsd // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: null == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as ExchangeRate,dailyLimits: null == dailyLimits ? _self.dailyLimits : dailyLimits // ignore: cast_nullable_to_non_nullable
as DailyLimits,
  ));
}

/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExchangeRateCopyWith<$Res> get exchangeRate {
  
  return $ExchangeRateCopyWith<$Res>(_self.exchangeRate, (value) {
    return _then(_self.copyWith(exchangeRate: value));
  });
}/// Create a copy of VexBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyLimitsCopyWith<$Res> get dailyLimits {
  
  return $DailyLimitsCopyWith<$Res>(_self.dailyLimits, (value) {
    return _then(_self.copyWith(dailyLimits: value));
  });
}
}


/// @nodoc
mixin _$ExchangeRate {

@JsonKey(name: 'vex_to_usd') double get vexToUsd;@JsonKey(name: 'last_updated') DateTime get lastUpdated;
/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRateCopyWith<ExchangeRate> get copyWith => _$ExchangeRateCopyWithImpl<ExchangeRate>(this as ExchangeRate, _$identity);

  /// Serializes this ExchangeRate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRate&&(identical(other.vexToUsd, vexToUsd) || other.vexToUsd == vexToUsd)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vexToUsd,lastUpdated);

@override
String toString() {
  return 'ExchangeRate(vexToUsd: $vexToUsd, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $ExchangeRateCopyWith<$Res>  {
  factory $ExchangeRateCopyWith(ExchangeRate value, $Res Function(ExchangeRate) _then) = _$ExchangeRateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vex_to_usd') double vexToUsd,@JsonKey(name: 'last_updated') DateTime lastUpdated
});




}
/// @nodoc
class _$ExchangeRateCopyWithImpl<$Res>
    implements $ExchangeRateCopyWith<$Res> {
  _$ExchangeRateCopyWithImpl(this._self, this._then);

  final ExchangeRate _self;
  final $Res Function(ExchangeRate) _then;

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vexToUsd = null,Object? lastUpdated = null,}) {
  return _then(_self.copyWith(
vexToUsd: null == vexToUsd ? _self.vexToUsd : vexToUsd // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ExchangeRate].
extension ExchangeRatePatterns on ExchangeRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRate value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRate value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'vex_to_usd')  double vexToUsd, @JsonKey(name: 'last_updated')  DateTime lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
return $default(_that.vexToUsd,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'vex_to_usd')  double vexToUsd, @JsonKey(name: 'last_updated')  DateTime lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRate():
return $default(_that.vexToUsd,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'vex_to_usd')  double vexToUsd, @JsonKey(name: 'last_updated')  DateTime lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRate() when $default != null:
return $default(_that.vexToUsd,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExchangeRate implements ExchangeRate {
  const _ExchangeRate({@JsonKey(name: 'vex_to_usd') required this.vexToUsd, @JsonKey(name: 'last_updated') required this.lastUpdated});
  factory _ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

@override@JsonKey(name: 'vex_to_usd') final  double vexToUsd;
@override@JsonKey(name: 'last_updated') final  DateTime lastUpdated;

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRateCopyWith<_ExchangeRate> get copyWith => __$ExchangeRateCopyWithImpl<_ExchangeRate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeRateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRate&&(identical(other.vexToUsd, vexToUsd) || other.vexToUsd == vexToUsd)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vexToUsd,lastUpdated);

@override
String toString() {
  return 'ExchangeRate(vexToUsd: $vexToUsd, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRateCopyWith<$Res> implements $ExchangeRateCopyWith<$Res> {
  factory _$ExchangeRateCopyWith(_ExchangeRate value, $Res Function(_ExchangeRate) _then) = __$ExchangeRateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vex_to_usd') double vexToUsd,@JsonKey(name: 'last_updated') DateTime lastUpdated
});




}
/// @nodoc
class __$ExchangeRateCopyWithImpl<$Res>
    implements _$ExchangeRateCopyWith<$Res> {
  __$ExchangeRateCopyWithImpl(this._self, this._then);

  final _ExchangeRate _self;
  final $Res Function(_ExchangeRate) _then;

/// Create a copy of ExchangeRate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vexToUsd = null,Object? lastUpdated = null,}) {
  return _then(_ExchangeRate(
vexToUsd: null == vexToUsd ? _self.vexToUsd : vexToUsd // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$DailyLimits {

@JsonKey(name: 'deposit_remaining') double get depositRemaining;@JsonKey(name: 'withdraw_remaining') double get withdrawRemaining;@JsonKey(name: 'transfer_remaining') double get transferRemaining;
/// Create a copy of DailyLimits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyLimitsCopyWith<DailyLimits> get copyWith => _$DailyLimitsCopyWithImpl<DailyLimits>(this as DailyLimits, _$identity);

  /// Serializes this DailyLimits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyLimits&&(identical(other.depositRemaining, depositRemaining) || other.depositRemaining == depositRemaining)&&(identical(other.withdrawRemaining, withdrawRemaining) || other.withdrawRemaining == withdrawRemaining)&&(identical(other.transferRemaining, transferRemaining) || other.transferRemaining == transferRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depositRemaining,withdrawRemaining,transferRemaining);

@override
String toString() {
  return 'DailyLimits(depositRemaining: $depositRemaining, withdrawRemaining: $withdrawRemaining, transferRemaining: $transferRemaining)';
}


}

/// @nodoc
abstract mixin class $DailyLimitsCopyWith<$Res>  {
  factory $DailyLimitsCopyWith(DailyLimits value, $Res Function(DailyLimits) _then) = _$DailyLimitsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'deposit_remaining') double depositRemaining,@JsonKey(name: 'withdraw_remaining') double withdrawRemaining,@JsonKey(name: 'transfer_remaining') double transferRemaining
});




}
/// @nodoc
class _$DailyLimitsCopyWithImpl<$Res>
    implements $DailyLimitsCopyWith<$Res> {
  _$DailyLimitsCopyWithImpl(this._self, this._then);

  final DailyLimits _self;
  final $Res Function(DailyLimits) _then;

/// Create a copy of DailyLimits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? depositRemaining = null,Object? withdrawRemaining = null,Object? transferRemaining = null,}) {
  return _then(_self.copyWith(
depositRemaining: null == depositRemaining ? _self.depositRemaining : depositRemaining // ignore: cast_nullable_to_non_nullable
as double,withdrawRemaining: null == withdrawRemaining ? _self.withdrawRemaining : withdrawRemaining // ignore: cast_nullable_to_non_nullable
as double,transferRemaining: null == transferRemaining ? _self.transferRemaining : transferRemaining // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyLimits].
extension DailyLimitsPatterns on DailyLimits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyLimits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyLimits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyLimits value)  $default,){
final _that = this;
switch (_that) {
case _DailyLimits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyLimits value)?  $default,){
final _that = this;
switch (_that) {
case _DailyLimits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'deposit_remaining')  double depositRemaining, @JsonKey(name: 'withdraw_remaining')  double withdrawRemaining, @JsonKey(name: 'transfer_remaining')  double transferRemaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyLimits() when $default != null:
return $default(_that.depositRemaining,_that.withdrawRemaining,_that.transferRemaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'deposit_remaining')  double depositRemaining, @JsonKey(name: 'withdraw_remaining')  double withdrawRemaining, @JsonKey(name: 'transfer_remaining')  double transferRemaining)  $default,) {final _that = this;
switch (_that) {
case _DailyLimits():
return $default(_that.depositRemaining,_that.withdrawRemaining,_that.transferRemaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'deposit_remaining')  double depositRemaining, @JsonKey(name: 'withdraw_remaining')  double withdrawRemaining, @JsonKey(name: 'transfer_remaining')  double transferRemaining)?  $default,) {final _that = this;
switch (_that) {
case _DailyLimits() when $default != null:
return $default(_that.depositRemaining,_that.withdrawRemaining,_that.transferRemaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyLimits implements DailyLimits {
  const _DailyLimits({@JsonKey(name: 'deposit_remaining') required this.depositRemaining, @JsonKey(name: 'withdraw_remaining') required this.withdrawRemaining, @JsonKey(name: 'transfer_remaining') required this.transferRemaining});
  factory _DailyLimits.fromJson(Map<String, dynamic> json) => _$DailyLimitsFromJson(json);

@override@JsonKey(name: 'deposit_remaining') final  double depositRemaining;
@override@JsonKey(name: 'withdraw_remaining') final  double withdrawRemaining;
@override@JsonKey(name: 'transfer_remaining') final  double transferRemaining;

/// Create a copy of DailyLimits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyLimitsCopyWith<_DailyLimits> get copyWith => __$DailyLimitsCopyWithImpl<_DailyLimits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyLimitsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyLimits&&(identical(other.depositRemaining, depositRemaining) || other.depositRemaining == depositRemaining)&&(identical(other.withdrawRemaining, withdrawRemaining) || other.withdrawRemaining == withdrawRemaining)&&(identical(other.transferRemaining, transferRemaining) || other.transferRemaining == transferRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depositRemaining,withdrawRemaining,transferRemaining);

@override
String toString() {
  return 'DailyLimits(depositRemaining: $depositRemaining, withdrawRemaining: $withdrawRemaining, transferRemaining: $transferRemaining)';
}


}

/// @nodoc
abstract mixin class _$DailyLimitsCopyWith<$Res> implements $DailyLimitsCopyWith<$Res> {
  factory _$DailyLimitsCopyWith(_DailyLimits value, $Res Function(_DailyLimits) _then) = __$DailyLimitsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'deposit_remaining') double depositRemaining,@JsonKey(name: 'withdraw_remaining') double withdrawRemaining,@JsonKey(name: 'transfer_remaining') double transferRemaining
});




}
/// @nodoc
class __$DailyLimitsCopyWithImpl<$Res>
    implements _$DailyLimitsCopyWith<$Res> {
  __$DailyLimitsCopyWithImpl(this._self, this._then);

  final _DailyLimits _self;
  final $Res Function(_DailyLimits) _then;

/// Create a copy of DailyLimits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? depositRemaining = null,Object? withdrawRemaining = null,Object? transferRemaining = null,}) {
  return _then(_DailyLimits(
depositRemaining: null == depositRemaining ? _self.depositRemaining : depositRemaining // ignore: cast_nullable_to_non_nullable
as double,withdrawRemaining: null == withdrawRemaining ? _self.withdrawRemaining : withdrawRemaining // ignore: cast_nullable_to_non_nullable
as double,transferRemaining: null == transferRemaining ? _self.transferRemaining : transferRemaining // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
