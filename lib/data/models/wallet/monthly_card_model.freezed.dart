// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonthlyCardModel {

 int get cardId; int get price; int get diamondsDaily;
/// Create a copy of MonthlyCardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlyCardModelCopyWith<MonthlyCardModel> get copyWith => _$MonthlyCardModelCopyWithImpl<MonthlyCardModel>(this as MonthlyCardModel, _$identity);

  /// Serializes this MonthlyCardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlyCardModel&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.price, price) || other.price == price)&&(identical(other.diamondsDaily, diamondsDaily) || other.diamondsDaily == diamondsDaily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,price,diamondsDaily);

@override
String toString() {
  return 'MonthlyCardModel(cardId: $cardId, price: $price, diamondsDaily: $diamondsDaily)';
}


}

/// @nodoc
abstract mixin class $MonthlyCardModelCopyWith<$Res>  {
  factory $MonthlyCardModelCopyWith(MonthlyCardModel value, $Res Function(MonthlyCardModel) _then) = _$MonthlyCardModelCopyWithImpl;
@useResult
$Res call({
 int cardId, int price, int diamondsDaily
});




}
/// @nodoc
class _$MonthlyCardModelCopyWithImpl<$Res>
    implements $MonthlyCardModelCopyWith<$Res> {
  _$MonthlyCardModelCopyWithImpl(this._self, this._then);

  final MonthlyCardModel _self;
  final $Res Function(MonthlyCardModel) _then;

/// Create a copy of MonthlyCardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? price = null,Object? diamondsDaily = null,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,diamondsDaily: null == diamondsDaily ? _self.diamondsDaily : diamondsDaily // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthlyCardModel].
extension MonthlyCardModelPatterns on MonthlyCardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlyCardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlyCardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlyCardModel value)  $default,){
final _that = this;
switch (_that) {
case _MonthlyCardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlyCardModel value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlyCardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cardId,  int price,  int diamondsDaily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlyCardModel() when $default != null:
return $default(_that.cardId,_that.price,_that.diamondsDaily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cardId,  int price,  int diamondsDaily)  $default,) {final _that = this;
switch (_that) {
case _MonthlyCardModel():
return $default(_that.cardId,_that.price,_that.diamondsDaily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cardId,  int price,  int diamondsDaily)?  $default,) {final _that = this;
switch (_that) {
case _MonthlyCardModel() when $default != null:
return $default(_that.cardId,_that.price,_that.diamondsDaily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlyCardModel implements MonthlyCardModel {
  const _MonthlyCardModel({required this.cardId, required this.price, required this.diamondsDaily});
  factory _MonthlyCardModel.fromJson(Map<String, dynamic> json) => _$MonthlyCardModelFromJson(json);

@override final  int cardId;
@override final  int price;
@override final  int diamondsDaily;

/// Create a copy of MonthlyCardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlyCardModelCopyWith<_MonthlyCardModel> get copyWith => __$MonthlyCardModelCopyWithImpl<_MonthlyCardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlyCardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlyCardModel&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.price, price) || other.price == price)&&(identical(other.diamondsDaily, diamondsDaily) || other.diamondsDaily == diamondsDaily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,price,diamondsDaily);

@override
String toString() {
  return 'MonthlyCardModel(cardId: $cardId, price: $price, diamondsDaily: $diamondsDaily)';
}


}

/// @nodoc
abstract mixin class _$MonthlyCardModelCopyWith<$Res> implements $MonthlyCardModelCopyWith<$Res> {
  factory _$MonthlyCardModelCopyWith(_MonthlyCardModel value, $Res Function(_MonthlyCardModel) _then) = __$MonthlyCardModelCopyWithImpl;
@override @useResult
$Res call({
 int cardId, int price, int diamondsDaily
});




}
/// @nodoc
class __$MonthlyCardModelCopyWithImpl<$Res>
    implements _$MonthlyCardModelCopyWith<$Res> {
  __$MonthlyCardModelCopyWithImpl(this._self, this._then);

  final _MonthlyCardModel _self;
  final $Res Function(_MonthlyCardModel) _then;

/// Create a copy of MonthlyCardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? price = null,Object? diamondsDaily = null,}) {
  return _then(_MonthlyCardModel(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,diamondsDaily: null == diamondsDaily ? _self.diamondsDaily : diamondsDaily // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
