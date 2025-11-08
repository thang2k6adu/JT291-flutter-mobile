// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionItem {

 String get name; int get quantity; String? get icon; int? get value;
/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemCopyWith<TransactionItem> get copyWith => _$TransactionItemCopyWithImpl<TransactionItem>(this as TransactionItem, _$identity);

  /// Serializes this TransactionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItem&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity,icon,value);

@override
String toString() {
  return 'TransactionItem(name: $name, quantity: $quantity, icon: $icon, value: $value)';
}


}

/// @nodoc
abstract mixin class $TransactionItemCopyWith<$Res>  {
  factory $TransactionItemCopyWith(TransactionItem value, $Res Function(TransactionItem) _then) = _$TransactionItemCopyWithImpl;
@useResult
$Res call({
 String name, int quantity, String? icon, int? value
});




}
/// @nodoc
class _$TransactionItemCopyWithImpl<$Res>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._self, this._then);

  final TransactionItem _self;
  final $Res Function(TransactionItem) _then;

/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantity = null,Object? icon = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItem].
extension TransactionItemPatterns on TransactionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItem value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int quantity,  String? icon,  int? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
return $default(_that.name,_that.quantity,_that.icon,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int quantity,  String? icon,  int? value)  $default,) {final _that = this;
switch (_that) {
case _TransactionItem():
return $default(_that.name,_that.quantity,_that.icon,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int quantity,  String? icon,  int? value)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
return $default(_that.name,_that.quantity,_that.icon,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItem implements TransactionItem {
  const _TransactionItem({required this.name, required this.quantity, this.icon, this.value});
  factory _TransactionItem.fromJson(Map<String, dynamic> json) => _$TransactionItemFromJson(json);

@override final  String name;
@override final  int quantity;
@override final  String? icon;
@override final  int? value;

/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemCopyWith<_TransactionItem> get copyWith => __$TransactionItemCopyWithImpl<_TransactionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItem&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity,icon,value);

@override
String toString() {
  return 'TransactionItem(name: $name, quantity: $quantity, icon: $icon, value: $value)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemCopyWith<$Res> implements $TransactionItemCopyWith<$Res> {
  factory _$TransactionItemCopyWith(_TransactionItem value, $Res Function(_TransactionItem) _then) = __$TransactionItemCopyWithImpl;
@override @useResult
$Res call({
 String name, int quantity, String? icon, int? value
});




}
/// @nodoc
class __$TransactionItemCopyWithImpl<$Res>
    implements _$TransactionItemCopyWith<$Res> {
  __$TransactionItemCopyWithImpl(this._self, this._then);

  final _TransactionItem _self;
  final $Res Function(_TransactionItem) _then;

/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? icon = freezed,Object? value = freezed,}) {
  return _then(_TransactionItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RelatedUser {

 String get id; String get username; String get displayName; String get avatar; bool? get isVerified;
/// Create a copy of RelatedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelatedUserCopyWith<RelatedUser> get copyWith => _$RelatedUserCopyWithImpl<RelatedUser>(this as RelatedUser, _$identity);

  /// Serializes this RelatedUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelatedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName,avatar,isVerified);

@override
String toString() {
  return 'RelatedUser(id: $id, username: $username, displayName: $displayName, avatar: $avatar, isVerified: $isVerified)';
}


}

/// @nodoc
abstract mixin class $RelatedUserCopyWith<$Res>  {
  factory $RelatedUserCopyWith(RelatedUser value, $Res Function(RelatedUser) _then) = _$RelatedUserCopyWithImpl;
@useResult
$Res call({
 String id, String username, String displayName, String avatar, bool? isVerified
});




}
/// @nodoc
class _$RelatedUserCopyWithImpl<$Res>
    implements $RelatedUserCopyWith<$Res> {
  _$RelatedUserCopyWithImpl(this._self, this._then);

  final RelatedUser _self;
  final $Res Function(RelatedUser) _then;

/// Create a copy of RelatedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? avatar = null,Object? isVerified = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RelatedUser].
extension RelatedUserPatterns on RelatedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelatedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelatedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelatedUser value)  $default,){
final _that = this;
switch (_that) {
case _RelatedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelatedUser value)?  $default,){
final _that = this;
switch (_that) {
case _RelatedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String displayName,  String avatar,  bool? isVerified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelatedUser() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatar,_that.isVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String displayName,  String avatar,  bool? isVerified)  $default,) {final _that = this;
switch (_that) {
case _RelatedUser():
return $default(_that.id,_that.username,_that.displayName,_that.avatar,_that.isVerified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String displayName,  String avatar,  bool? isVerified)?  $default,) {final _that = this;
switch (_that) {
case _RelatedUser() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatar,_that.isVerified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RelatedUser implements RelatedUser {
  const _RelatedUser({required this.id, required this.username, required this.displayName, required this.avatar, this.isVerified});
  factory _RelatedUser.fromJson(Map<String, dynamic> json) => _$RelatedUserFromJson(json);

@override final  String id;
@override final  String username;
@override final  String displayName;
@override final  String avatar;
@override final  bool? isVerified;

/// Create a copy of RelatedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelatedUserCopyWith<_RelatedUser> get copyWith => __$RelatedUserCopyWithImpl<_RelatedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RelatedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelatedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName,avatar,isVerified);

@override
String toString() {
  return 'RelatedUser(id: $id, username: $username, displayName: $displayName, avatar: $avatar, isVerified: $isVerified)';
}


}

/// @nodoc
abstract mixin class _$RelatedUserCopyWith<$Res> implements $RelatedUserCopyWith<$Res> {
  factory _$RelatedUserCopyWith(_RelatedUser value, $Res Function(_RelatedUser) _then) = __$RelatedUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String displayName, String avatar, bool? isVerified
});




}
/// @nodoc
class __$RelatedUserCopyWithImpl<$Res>
    implements _$RelatedUserCopyWith<$Res> {
  __$RelatedUserCopyWithImpl(this._self, this._then);

  final _RelatedUser _self;
  final $Res Function(_RelatedUser) _then;

/// Create a copy of RelatedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? avatar = null,Object? isVerified = freezed,}) {
  return _then(_RelatedUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$ExchangeDetails {

 CurrencyType get fromCurrency; double get fromAmount; CurrencyType get toCurrency; double get toAmount; double get rate;
/// Create a copy of ExchangeDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeDetailsCopyWith<ExchangeDetails> get copyWith => _$ExchangeDetailsCopyWithImpl<ExchangeDetails>(this as ExchangeDetails, _$identity);

  /// Serializes this ExchangeDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeDetails&&(identical(other.fromCurrency, fromCurrency) || other.fromCurrency == fromCurrency)&&(identical(other.fromAmount, fromAmount) || other.fromAmount == fromAmount)&&(identical(other.toCurrency, toCurrency) || other.toCurrency == toCurrency)&&(identical(other.toAmount, toAmount) || other.toAmount == toAmount)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromCurrency,fromAmount,toCurrency,toAmount,rate);

@override
String toString() {
  return 'ExchangeDetails(fromCurrency: $fromCurrency, fromAmount: $fromAmount, toCurrency: $toCurrency, toAmount: $toAmount, rate: $rate)';
}


}

/// @nodoc
abstract mixin class $ExchangeDetailsCopyWith<$Res>  {
  factory $ExchangeDetailsCopyWith(ExchangeDetails value, $Res Function(ExchangeDetails) _then) = _$ExchangeDetailsCopyWithImpl;
@useResult
$Res call({
 CurrencyType fromCurrency, double fromAmount, CurrencyType toCurrency, double toAmount, double rate
});




}
/// @nodoc
class _$ExchangeDetailsCopyWithImpl<$Res>
    implements $ExchangeDetailsCopyWith<$Res> {
  _$ExchangeDetailsCopyWithImpl(this._self, this._then);

  final ExchangeDetails _self;
  final $Res Function(ExchangeDetails) _then;

/// Create a copy of ExchangeDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromCurrency = null,Object? fromAmount = null,Object? toCurrency = null,Object? toAmount = null,Object? rate = null,}) {
  return _then(_self.copyWith(
fromCurrency: null == fromCurrency ? _self.fromCurrency : fromCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyType,fromAmount: null == fromAmount ? _self.fromAmount : fromAmount // ignore: cast_nullable_to_non_nullable
as double,toCurrency: null == toCurrency ? _self.toCurrency : toCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyType,toAmount: null == toAmount ? _self.toAmount : toAmount // ignore: cast_nullable_to_non_nullable
as double,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ExchangeDetails].
extension ExchangeDetailsPatterns on ExchangeDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeDetails value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CurrencyType fromCurrency,  double fromAmount,  CurrencyType toCurrency,  double toAmount,  double rate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeDetails() when $default != null:
return $default(_that.fromCurrency,_that.fromAmount,_that.toCurrency,_that.toAmount,_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CurrencyType fromCurrency,  double fromAmount,  CurrencyType toCurrency,  double toAmount,  double rate)  $default,) {final _that = this;
switch (_that) {
case _ExchangeDetails():
return $default(_that.fromCurrency,_that.fromAmount,_that.toCurrency,_that.toAmount,_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CurrencyType fromCurrency,  double fromAmount,  CurrencyType toCurrency,  double toAmount,  double rate)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeDetails() when $default != null:
return $default(_that.fromCurrency,_that.fromAmount,_that.toCurrency,_that.toAmount,_that.rate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExchangeDetails implements ExchangeDetails {
  const _ExchangeDetails({required this.fromCurrency, required this.fromAmount, required this.toCurrency, required this.toAmount, required this.rate});
  factory _ExchangeDetails.fromJson(Map<String, dynamic> json) => _$ExchangeDetailsFromJson(json);

@override final  CurrencyType fromCurrency;
@override final  double fromAmount;
@override final  CurrencyType toCurrency;
@override final  double toAmount;
@override final  double rate;

/// Create a copy of ExchangeDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeDetailsCopyWith<_ExchangeDetails> get copyWith => __$ExchangeDetailsCopyWithImpl<_ExchangeDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeDetails&&(identical(other.fromCurrency, fromCurrency) || other.fromCurrency == fromCurrency)&&(identical(other.fromAmount, fromAmount) || other.fromAmount == fromAmount)&&(identical(other.toCurrency, toCurrency) || other.toCurrency == toCurrency)&&(identical(other.toAmount, toAmount) || other.toAmount == toAmount)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromCurrency,fromAmount,toCurrency,toAmount,rate);

@override
String toString() {
  return 'ExchangeDetails(fromCurrency: $fromCurrency, fromAmount: $fromAmount, toCurrency: $toCurrency, toAmount: $toAmount, rate: $rate)';
}


}

/// @nodoc
abstract mixin class _$ExchangeDetailsCopyWith<$Res> implements $ExchangeDetailsCopyWith<$Res> {
  factory _$ExchangeDetailsCopyWith(_ExchangeDetails value, $Res Function(_ExchangeDetails) _then) = __$ExchangeDetailsCopyWithImpl;
@override @useResult
$Res call({
 CurrencyType fromCurrency, double fromAmount, CurrencyType toCurrency, double toAmount, double rate
});




}
/// @nodoc
class __$ExchangeDetailsCopyWithImpl<$Res>
    implements _$ExchangeDetailsCopyWith<$Res> {
  __$ExchangeDetailsCopyWithImpl(this._self, this._then);

  final _ExchangeDetails _self;
  final $Res Function(_ExchangeDetails) _then;

/// Create a copy of ExchangeDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromCurrency = null,Object? fromAmount = null,Object? toCurrency = null,Object? toAmount = null,Object? rate = null,}) {
  return _then(_ExchangeDetails(
fromCurrency: null == fromCurrency ? _self.fromCurrency : fromCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyType,fromAmount: null == fromAmount ? _self.fromAmount : fromAmount // ignore: cast_nullable_to_non_nullable
as double,toCurrency: null == toCurrency ? _self.toCurrency : toCurrency // ignore: cast_nullable_to_non_nullable
as CurrencyType,toAmount: null == toAmount ? _self.toAmount : toAmount // ignore: cast_nullable_to_non_nullable
as double,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TransactionModel {

 String get id; TransactionType get type; double get amount; double? get balanceAfter; String get timestamp; String get description; TransactionItem? get item; RelatedUser? get relatedUser; ExchangeDetails? get exchange; TransactionStatus get status; String? get note; String? get referenceCode;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.description, description) || other.description == description)&&(identical(other.item, item) || other.item == item)&&(identical(other.relatedUser, relatedUser) || other.relatedUser == relatedUser)&&(identical(other.exchange, exchange) || other.exchange == exchange)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.referenceCode, referenceCode) || other.referenceCode == referenceCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,balanceAfter,timestamp,description,item,relatedUser,exchange,status,note,referenceCode);

@override
String toString() {
  return 'TransactionModel(id: $id, type: $type, amount: $amount, balanceAfter: $balanceAfter, timestamp: $timestamp, description: $description, item: $item, relatedUser: $relatedUser, exchange: $exchange, status: $status, note: $note, referenceCode: $referenceCode)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 String id, TransactionType type, double amount, double? balanceAfter, String timestamp, String description, TransactionItem? item, RelatedUser? relatedUser, ExchangeDetails? exchange, TransactionStatus status, String? note, String? referenceCode
});


$TransactionItemCopyWith<$Res>? get item;$RelatedUserCopyWith<$Res>? get relatedUser;$ExchangeDetailsCopyWith<$Res>? get exchange;

}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? balanceAfter = freezed,Object? timestamp = null,Object? description = null,Object? item = freezed,Object? relatedUser = freezed,Object? exchange = freezed,Object? status = null,Object? note = freezed,Object? referenceCode = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as double?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as TransactionItem?,relatedUser: freezed == relatedUser ? _self.relatedUser : relatedUser // ignore: cast_nullable_to_non_nullable
as RelatedUser?,exchange: freezed == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as ExchangeDetails?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,referenceCode: freezed == referenceCode ? _self.referenceCode : referenceCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $TransactionItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RelatedUserCopyWith<$Res>? get relatedUser {
    if (_self.relatedUser == null) {
    return null;
  }

  return $RelatedUserCopyWith<$Res>(_self.relatedUser!, (value) {
    return _then(_self.copyWith(relatedUser: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExchangeDetailsCopyWith<$Res>? get exchange {
    if (_self.exchange == null) {
    return null;
  }

  return $ExchangeDetailsCopyWith<$Res>(_self.exchange!, (value) {
    return _then(_self.copyWith(exchange: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TransactionType type,  double amount,  double? balanceAfter,  String timestamp,  String description,  TransactionItem? item,  RelatedUser? relatedUser,  ExchangeDetails? exchange,  TransactionStatus status,  String? note,  String? referenceCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.balanceAfter,_that.timestamp,_that.description,_that.item,_that.relatedUser,_that.exchange,_that.status,_that.note,_that.referenceCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TransactionType type,  double amount,  double? balanceAfter,  String timestamp,  String description,  TransactionItem? item,  RelatedUser? relatedUser,  ExchangeDetails? exchange,  TransactionStatus status,  String? note,  String? referenceCode)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.id,_that.type,_that.amount,_that.balanceAfter,_that.timestamp,_that.description,_that.item,_that.relatedUser,_that.exchange,_that.status,_that.note,_that.referenceCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TransactionType type,  double amount,  double? balanceAfter,  String timestamp,  String description,  TransactionItem? item,  RelatedUser? relatedUser,  ExchangeDetails? exchange,  TransactionStatus status,  String? note,  String? referenceCode)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.balanceAfter,_that.timestamp,_that.description,_that.item,_that.relatedUser,_that.exchange,_that.status,_that.note,_that.referenceCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel implements TransactionModel {
  const _TransactionModel({required this.id, required this.type, required this.amount, this.balanceAfter, required this.timestamp, required this.description, this.item, this.relatedUser, this.exchange, required this.status, this.note, this.referenceCode});
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  String id;
@override final  TransactionType type;
@override final  double amount;
@override final  double? balanceAfter;
@override final  String timestamp;
@override final  String description;
@override final  TransactionItem? item;
@override final  RelatedUser? relatedUser;
@override final  ExchangeDetails? exchange;
@override final  TransactionStatus status;
@override final  String? note;
@override final  String? referenceCode;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.description, description) || other.description == description)&&(identical(other.item, item) || other.item == item)&&(identical(other.relatedUser, relatedUser) || other.relatedUser == relatedUser)&&(identical(other.exchange, exchange) || other.exchange == exchange)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.referenceCode, referenceCode) || other.referenceCode == referenceCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,balanceAfter,timestamp,description,item,relatedUser,exchange,status,note,referenceCode);

@override
String toString() {
  return 'TransactionModel(id: $id, type: $type, amount: $amount, balanceAfter: $balanceAfter, timestamp: $timestamp, description: $description, item: $item, relatedUser: $relatedUser, exchange: $exchange, status: $status, note: $note, referenceCode: $referenceCode)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, TransactionType type, double amount, double? balanceAfter, String timestamp, String description, TransactionItem? item, RelatedUser? relatedUser, ExchangeDetails? exchange, TransactionStatus status, String? note, String? referenceCode
});


@override $TransactionItemCopyWith<$Res>? get item;@override $RelatedUserCopyWith<$Res>? get relatedUser;@override $ExchangeDetailsCopyWith<$Res>? get exchange;

}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? balanceAfter = freezed,Object? timestamp = null,Object? description = null,Object? item = freezed,Object? relatedUser = freezed,Object? exchange = freezed,Object? status = null,Object? note = freezed,Object? referenceCode = freezed,}) {
  return _then(_TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,balanceAfter: freezed == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as double?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as TransactionItem?,relatedUser: freezed == relatedUser ? _self.relatedUser : relatedUser // ignore: cast_nullable_to_non_nullable
as RelatedUser?,exchange: freezed == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as ExchangeDetails?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TransactionStatus,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,referenceCode: freezed == referenceCode ? _self.referenceCode : referenceCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $TransactionItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RelatedUserCopyWith<$Res>? get relatedUser {
    if (_self.relatedUser == null) {
    return null;
  }

  return $RelatedUserCopyWith<$Res>(_self.relatedUser!, (value) {
    return _then(_self.copyWith(relatedUser: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExchangeDetailsCopyWith<$Res>? get exchange {
    if (_self.exchange == null) {
    return null;
  }

  return $ExchangeDetailsCopyWith<$Res>(_self.exchange!, (value) {
    return _then(_self.copyWith(exchange: value));
  });
}
}


/// @nodoc
mixin _$TransactionHistoryResponse {

 List<TransactionModel> get data; PaginationModel get pagination;
/// Create a copy of TransactionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionHistoryResponseCopyWith<TransactionHistoryResponse> get copyWith => _$TransactionHistoryResponseCopyWithImpl<TransactionHistoryResponse>(this as TransactionHistoryResponse, _$identity);

  /// Serializes this TransactionHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionHistoryResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'TransactionHistoryResponse(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $TransactionHistoryResponseCopyWith<$Res>  {
  factory $TransactionHistoryResponseCopyWith(TransactionHistoryResponse value, $Res Function(TransactionHistoryResponse) _then) = _$TransactionHistoryResponseCopyWithImpl;
@useResult
$Res call({
 List<TransactionModel> data, PaginationModel pagination
});


$PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$TransactionHistoryResponseCopyWithImpl<$Res>
    implements $TransactionHistoryResponseCopyWith<$Res> {
  _$TransactionHistoryResponseCopyWithImpl(this._self, this._then);

  final TransactionHistoryResponse _self;
  final $Res Function(TransactionHistoryResponse) _then;

/// Create a copy of TransactionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}
/// Create a copy of TransactionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionHistoryResponse].
extension TransactionHistoryResponsePatterns on TransactionHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _TransactionHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TransactionModel> data,  PaginationModel pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionHistoryResponse() when $default != null:
return $default(_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TransactionModel> data,  PaginationModel pagination)  $default,) {final _that = this;
switch (_that) {
case _TransactionHistoryResponse():
return $default(_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TransactionModel> data,  PaginationModel pagination)?  $default,) {final _that = this;
switch (_that) {
case _TransactionHistoryResponse() when $default != null:
return $default(_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionHistoryResponse implements TransactionHistoryResponse {
  const _TransactionHistoryResponse({required final  List<TransactionModel> data, required this.pagination}): _data = data;
  factory _TransactionHistoryResponse.fromJson(Map<String, dynamic> json) => _$TransactionHistoryResponseFromJson(json);

 final  List<TransactionModel> _data;
@override List<TransactionModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel pagination;

/// Create a copy of TransactionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionHistoryResponseCopyWith<_TransactionHistoryResponse> get copyWith => __$TransactionHistoryResponseCopyWithImpl<_TransactionHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionHistoryResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'TransactionHistoryResponse(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$TransactionHistoryResponseCopyWith<$Res> implements $TransactionHistoryResponseCopyWith<$Res> {
  factory _$TransactionHistoryResponseCopyWith(_TransactionHistoryResponse value, $Res Function(_TransactionHistoryResponse) _then) = __$TransactionHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionModel> data, PaginationModel pagination
});


@override $PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$TransactionHistoryResponseCopyWithImpl<$Res>
    implements _$TransactionHistoryResponseCopyWith<$Res> {
  __$TransactionHistoryResponseCopyWithImpl(this._self, this._then);

  final _TransactionHistoryResponse _self;
  final $Res Function(_TransactionHistoryResponse) _then;

/// Create a copy of TransactionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_TransactionHistoryResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}

/// Create a copy of TransactionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
