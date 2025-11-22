// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftTransactionModel {

@JsonKey(name: 'id') String get id; UserModel get sender;@JsonKey(name: 'gift_info') GiftModel get giftInfo; DateTime get timestamp;
/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftTransactionModelCopyWith<GiftTransactionModel> get copyWith => _$GiftTransactionModelCopyWithImpl<GiftTransactionModel>(this as GiftTransactionModel, _$identity);

  /// Serializes this GiftTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.giftInfo, giftInfo) || other.giftInfo == giftInfo)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,giftInfo,timestamp);

@override
String toString() {
  return 'GiftTransactionModel(id: $id, sender: $sender, giftInfo: $giftInfo, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $GiftTransactionModelCopyWith<$Res>  {
  factory $GiftTransactionModelCopyWith(GiftTransactionModel value, $Res Function(GiftTransactionModel) _then) = _$GiftTransactionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id, UserModel sender,@JsonKey(name: 'gift_info') GiftModel giftInfo, DateTime timestamp
});


$UserModelCopyWith<$Res> get sender;$GiftModelCopyWith<$Res> get giftInfo;

}
/// @nodoc
class _$GiftTransactionModelCopyWithImpl<$Res>
    implements $GiftTransactionModelCopyWith<$Res> {
  _$GiftTransactionModelCopyWithImpl(this._self, this._then);

  final GiftTransactionModel _self;
  final $Res Function(GiftTransactionModel) _then;

/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sender = null,Object? giftInfo = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserModel,giftInfo: null == giftInfo ? _self.giftInfo : giftInfo // ignore: cast_nullable_to_non_nullable
as GiftModel,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get sender {
  
  return $UserModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftModelCopyWith<$Res> get giftInfo {
  
  return $GiftModelCopyWith<$Res>(_self.giftInfo, (value) {
    return _then(_self.copyWith(giftInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [GiftTransactionModel].
extension GiftTransactionModelPatterns on GiftTransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftTransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _GiftTransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _GiftTransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id,  UserModel sender, @JsonKey(name: 'gift_info')  GiftModel giftInfo,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftTransactionModel() when $default != null:
return $default(_that.id,_that.sender,_that.giftInfo,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id,  UserModel sender, @JsonKey(name: 'gift_info')  GiftModel giftInfo,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _GiftTransactionModel():
return $default(_that.id,_that.sender,_that.giftInfo,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id,  UserModel sender, @JsonKey(name: 'gift_info')  GiftModel giftInfo,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _GiftTransactionModel() when $default != null:
return $default(_that.id,_that.sender,_that.giftInfo,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftTransactionModel implements GiftTransactionModel {
  const _GiftTransactionModel({@JsonKey(name: 'id') required this.id, required this.sender, @JsonKey(name: 'gift_info') required this.giftInfo, required this.timestamp});
  factory _GiftTransactionModel.fromJson(Map<String, dynamic> json) => _$GiftTransactionModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override final  UserModel sender;
@override@JsonKey(name: 'gift_info') final  GiftModel giftInfo;
@override final  DateTime timestamp;

/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftTransactionModelCopyWith<_GiftTransactionModel> get copyWith => __$GiftTransactionModelCopyWithImpl<_GiftTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.giftInfo, giftInfo) || other.giftInfo == giftInfo)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,giftInfo,timestamp);

@override
String toString() {
  return 'GiftTransactionModel(id: $id, sender: $sender, giftInfo: $giftInfo, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$GiftTransactionModelCopyWith<$Res> implements $GiftTransactionModelCopyWith<$Res> {
  factory _$GiftTransactionModelCopyWith(_GiftTransactionModel value, $Res Function(_GiftTransactionModel) _then) = __$GiftTransactionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id, UserModel sender,@JsonKey(name: 'gift_info') GiftModel giftInfo, DateTime timestamp
});


@override $UserModelCopyWith<$Res> get sender;@override $GiftModelCopyWith<$Res> get giftInfo;

}
/// @nodoc
class __$GiftTransactionModelCopyWithImpl<$Res>
    implements _$GiftTransactionModelCopyWith<$Res> {
  __$GiftTransactionModelCopyWithImpl(this._self, this._then);

  final _GiftTransactionModel _self;
  final $Res Function(_GiftTransactionModel) _then;

/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sender = null,Object? giftInfo = null,Object? timestamp = null,}) {
  return _then(_GiftTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserModel,giftInfo: null == giftInfo ? _self.giftInfo : giftInfo // ignore: cast_nullable_to_non_nullable
as GiftModel,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get sender {
  
  return $UserModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of GiftTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftModelCopyWith<$Res> get giftInfo {
  
  return $GiftModelCopyWith<$Res>(_self.giftInfo, (value) {
    return _then(_self.copyWith(giftInfo: value));
  });
}
}

// dart format on
