// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftModel {

 String get id; String get name;@JsonKey(name: 'image_url') String get imageUrl; double? get price; String get type;@JsonKey(name: 'is_event') bool get isEvent;@JsonKey(name: 'event_end_date') DateTime? get eventEndDate; String? get description; String? get category;@JsonKey(name: 'quantity') int get quantity;@JsonKey(name: 'required_count') int get requiredCount;@JsonKey(name: 'current_count') int get currentCount;
/// Create a copy of GiftModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftModelCopyWith<GiftModel> get copyWith => _$GiftModelCopyWithImpl<GiftModel>(this as GiftModel, _$identity);

  /// Serializes this GiftModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.type, type) || other.type == type)&&(identical(other.isEvent, isEvent) || other.isEvent == isEvent)&&(identical(other.eventEndDate, eventEndDate) || other.eventEndDate == eventEndDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.requiredCount, requiredCount) || other.requiredCount == requiredCount)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,type,isEvent,eventEndDate,description,category,quantity,requiredCount,currentCount);

@override
String toString() {
  return 'GiftModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, type: $type, isEvent: $isEvent, eventEndDate: $eventEndDate, description: $description, category: $category, quantity: $quantity, requiredCount: $requiredCount, currentCount: $currentCount)';
}


}

/// @nodoc
abstract mixin class $GiftModelCopyWith<$Res>  {
  factory $GiftModelCopyWith(GiftModel value, $Res Function(GiftModel) _then) = _$GiftModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'image_url') String imageUrl, double? price, String type,@JsonKey(name: 'is_event') bool isEvent,@JsonKey(name: 'event_end_date') DateTime? eventEndDate, String? description, String? category,@JsonKey(name: 'quantity') int quantity,@JsonKey(name: 'required_count') int requiredCount,@JsonKey(name: 'current_count') int currentCount
});




}
/// @nodoc
class _$GiftModelCopyWithImpl<$Res>
    implements $GiftModelCopyWith<$Res> {
  _$GiftModelCopyWithImpl(this._self, this._then);

  final GiftModel _self;
  final $Res Function(GiftModel) _then;

/// Create a copy of GiftModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? price = freezed,Object? type = null,Object? isEvent = null,Object? eventEndDate = freezed,Object? description = freezed,Object? category = freezed,Object? quantity = null,Object? requiredCount = null,Object? currentCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isEvent: null == isEvent ? _self.isEvent : isEvent // ignore: cast_nullable_to_non_nullable
as bool,eventEndDate: freezed == eventEndDate ? _self.eventEndDate : eventEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,requiredCount: null == requiredCount ? _self.requiredCount : requiredCount // ignore: cast_nullable_to_non_nullable
as int,currentCount: null == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftModel].
extension GiftModelPatterns on GiftModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftModel value)  $default,){
final _that = this;
switch (_that) {
case _GiftModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftModel value)?  $default,){
final _that = this;
switch (_that) {
case _GiftModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'image_url')  String imageUrl,  double? price,  String type, @JsonKey(name: 'is_event')  bool isEvent, @JsonKey(name: 'event_end_date')  DateTime? eventEndDate,  String? description,  String? category, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'required_count')  int requiredCount, @JsonKey(name: 'current_count')  int currentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.type,_that.isEvent,_that.eventEndDate,_that.description,_that.category,_that.quantity,_that.requiredCount,_that.currentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'image_url')  String imageUrl,  double? price,  String type, @JsonKey(name: 'is_event')  bool isEvent, @JsonKey(name: 'event_end_date')  DateTime? eventEndDate,  String? description,  String? category, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'required_count')  int requiredCount, @JsonKey(name: 'current_count')  int currentCount)  $default,) {final _that = this;
switch (_that) {
case _GiftModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.type,_that.isEvent,_that.eventEndDate,_that.description,_that.category,_that.quantity,_that.requiredCount,_that.currentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'image_url')  String imageUrl,  double? price,  String type, @JsonKey(name: 'is_event')  bool isEvent, @JsonKey(name: 'event_end_date')  DateTime? eventEndDate,  String? description,  String? category, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'required_count')  int requiredCount, @JsonKey(name: 'current_count')  int currentCount)?  $default,) {final _that = this;
switch (_that) {
case _GiftModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.type,_that.isEvent,_that.eventEndDate,_that.description,_that.category,_that.quantity,_that.requiredCount,_that.currentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftModel implements GiftModel {
  const _GiftModel({required this.id, required this.name, @JsonKey(name: 'image_url') required this.imageUrl, this.price = 0.0, this.type = 'normal', @JsonKey(name: 'is_event') this.isEvent = false, @JsonKey(name: 'event_end_date') this.eventEndDate, this.description, this.category, @JsonKey(name: 'quantity') this.quantity = 0, @JsonKey(name: 'required_count') this.requiredCount = 0, @JsonKey(name: 'current_count') this.currentCount = 0});
  factory _GiftModel.fromJson(Map<String, dynamic> json) => _$GiftModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey() final  double? price;
@override@JsonKey() final  String type;
@override@JsonKey(name: 'is_event') final  bool isEvent;
@override@JsonKey(name: 'event_end_date') final  DateTime? eventEndDate;
@override final  String? description;
@override final  String? category;
@override@JsonKey(name: 'quantity') final  int quantity;
@override@JsonKey(name: 'required_count') final  int requiredCount;
@override@JsonKey(name: 'current_count') final  int currentCount;

/// Create a copy of GiftModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftModelCopyWith<_GiftModel> get copyWith => __$GiftModelCopyWithImpl<_GiftModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.type, type) || other.type == type)&&(identical(other.isEvent, isEvent) || other.isEvent == isEvent)&&(identical(other.eventEndDate, eventEndDate) || other.eventEndDate == eventEndDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.requiredCount, requiredCount) || other.requiredCount == requiredCount)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,type,isEvent,eventEndDate,description,category,quantity,requiredCount,currentCount);

@override
String toString() {
  return 'GiftModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, type: $type, isEvent: $isEvent, eventEndDate: $eventEndDate, description: $description, category: $category, quantity: $quantity, requiredCount: $requiredCount, currentCount: $currentCount)';
}


}

/// @nodoc
abstract mixin class _$GiftModelCopyWith<$Res> implements $GiftModelCopyWith<$Res> {
  factory _$GiftModelCopyWith(_GiftModel value, $Res Function(_GiftModel) _then) = __$GiftModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'image_url') String imageUrl, double? price, String type,@JsonKey(name: 'is_event') bool isEvent,@JsonKey(name: 'event_end_date') DateTime? eventEndDate, String? description, String? category,@JsonKey(name: 'quantity') int quantity,@JsonKey(name: 'required_count') int requiredCount,@JsonKey(name: 'current_count') int currentCount
});




}
/// @nodoc
class __$GiftModelCopyWithImpl<$Res>
    implements _$GiftModelCopyWith<$Res> {
  __$GiftModelCopyWithImpl(this._self, this._then);

  final _GiftModel _self;
  final $Res Function(_GiftModel) _then;

/// Create a copy of GiftModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? price = freezed,Object? type = null,Object? isEvent = null,Object? eventEndDate = freezed,Object? description = freezed,Object? category = freezed,Object? quantity = null,Object? requiredCount = null,Object? currentCount = null,}) {
  return _then(_GiftModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isEvent: null == isEvent ? _self.isEvent : isEvent // ignore: cast_nullable_to_non_nullable
as bool,eventEndDate: freezed == eventEndDate ? _self.eventEndDate : eventEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,requiredCount: null == requiredCount ? _self.requiredCount : requiredCount // ignore: cast_nullable_to_non_nullable
as int,currentCount: null == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
