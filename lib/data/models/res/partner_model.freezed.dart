// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnerModel {

 String get id; String get name; String? get thumbnail; String? get description; String? get type; String? get variant;@JsonKey(name: 'is_company') bool get isCompany; String? get email;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'other_phone') String? get otherPhone; String? get website;@JsonKey(name: 'personal_tax_code') String? get personalTaxCode; String? get address; String? get state; String? get street;
/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerModelCopyWith<PartnerModel> get copyWith => _$PartnerModelCopyWithImpl<PartnerModel>(this as PartnerModel, _$identity);

  /// Serializes this PartnerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.isCompany, isCompany) || other.isCompany == isCompany)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otherPhone, otherPhone) || other.otherPhone == otherPhone)&&(identical(other.website, website) || other.website == website)&&(identical(other.personalTaxCode, personalTaxCode) || other.personalTaxCode == personalTaxCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.state, state) || other.state == state)&&(identical(other.street, street) || other.street == street));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnail,description,type,variant,isCompany,email,phoneNumber,otherPhone,website,personalTaxCode,address,state,street);

@override
String toString() {
  return 'PartnerModel(id: $id, name: $name, thumbnail: $thumbnail, description: $description, type: $type, variant: $variant, isCompany: $isCompany, email: $email, phoneNumber: $phoneNumber, otherPhone: $otherPhone, website: $website, personalTaxCode: $personalTaxCode, address: $address, state: $state, street: $street)';
}


}

/// @nodoc
abstract mixin class $PartnerModelCopyWith<$Res>  {
  factory $PartnerModelCopyWith(PartnerModel value, $Res Function(PartnerModel) _then) = _$PartnerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? thumbnail, String? description, String? type, String? variant,@JsonKey(name: 'is_company') bool isCompany, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'other_phone') String? otherPhone, String? website,@JsonKey(name: 'personal_tax_code') String? personalTaxCode, String? address, String? state, String? street
});




}
/// @nodoc
class _$PartnerModelCopyWithImpl<$Res>
    implements $PartnerModelCopyWith<$Res> {
  _$PartnerModelCopyWithImpl(this._self, this._then);

  final PartnerModel _self;
  final $Res Function(PartnerModel) _then;

/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? thumbnail = freezed,Object? description = freezed,Object? type = freezed,Object? variant = freezed,Object? isCompany = null,Object? email = freezed,Object? phoneNumber = freezed,Object? otherPhone = freezed,Object? website = freezed,Object? personalTaxCode = freezed,Object? address = freezed,Object? state = freezed,Object? street = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,isCompany: null == isCompany ? _self.isCompany : isCompany // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,otherPhone: freezed == otherPhone ? _self.otherPhone : otherPhone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,personalTaxCode: freezed == personalTaxCode ? _self.personalTaxCode : personalTaxCode // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PartnerModel].
extension PartnerModelPatterns on PartnerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerModel value)  $default,){
final _that = this;
switch (_that) {
case _PartnerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? thumbnail,  String? description,  String? type,  String? variant, @JsonKey(name: 'is_company')  bool isCompany,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'other_phone')  String? otherPhone,  String? website, @JsonKey(name: 'personal_tax_code')  String? personalTaxCode,  String? address,  String? state,  String? street)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
return $default(_that.id,_that.name,_that.thumbnail,_that.description,_that.type,_that.variant,_that.isCompany,_that.email,_that.phoneNumber,_that.otherPhone,_that.website,_that.personalTaxCode,_that.address,_that.state,_that.street);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? thumbnail,  String? description,  String? type,  String? variant, @JsonKey(name: 'is_company')  bool isCompany,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'other_phone')  String? otherPhone,  String? website, @JsonKey(name: 'personal_tax_code')  String? personalTaxCode,  String? address,  String? state,  String? street)  $default,) {final _that = this;
switch (_that) {
case _PartnerModel():
return $default(_that.id,_that.name,_that.thumbnail,_that.description,_that.type,_that.variant,_that.isCompany,_that.email,_that.phoneNumber,_that.otherPhone,_that.website,_that.personalTaxCode,_that.address,_that.state,_that.street);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? thumbnail,  String? description,  String? type,  String? variant, @JsonKey(name: 'is_company')  bool isCompany,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'other_phone')  String? otherPhone,  String? website, @JsonKey(name: 'personal_tax_code')  String? personalTaxCode,  String? address,  String? state,  String? street)?  $default,) {final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
return $default(_that.id,_that.name,_that.thumbnail,_that.description,_that.type,_that.variant,_that.isCompany,_that.email,_that.phoneNumber,_that.otherPhone,_that.website,_that.personalTaxCode,_that.address,_that.state,_that.street);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerModel implements PartnerModel {
  const _PartnerModel({required this.id, required this.name, this.thumbnail, this.description, this.type, this.variant, @JsonKey(name: 'is_company') required this.isCompany, this.email, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'other_phone') this.otherPhone, this.website, @JsonKey(name: 'personal_tax_code') this.personalTaxCode, this.address, this.state, this.street});
  factory _PartnerModel.fromJson(Map<String, dynamic> json) => _$PartnerModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? thumbnail;
@override final  String? description;
@override final  String? type;
@override final  String? variant;
@override@JsonKey(name: 'is_company') final  bool isCompany;
@override final  String? email;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'other_phone') final  String? otherPhone;
@override final  String? website;
@override@JsonKey(name: 'personal_tax_code') final  String? personalTaxCode;
@override final  String? address;
@override final  String? state;
@override final  String? street;

/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerModelCopyWith<_PartnerModel> get copyWith => __$PartnerModelCopyWithImpl<_PartnerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.isCompany, isCompany) || other.isCompany == isCompany)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.otherPhone, otherPhone) || other.otherPhone == otherPhone)&&(identical(other.website, website) || other.website == website)&&(identical(other.personalTaxCode, personalTaxCode) || other.personalTaxCode == personalTaxCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.state, state) || other.state == state)&&(identical(other.street, street) || other.street == street));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnail,description,type,variant,isCompany,email,phoneNumber,otherPhone,website,personalTaxCode,address,state,street);

@override
String toString() {
  return 'PartnerModel(id: $id, name: $name, thumbnail: $thumbnail, description: $description, type: $type, variant: $variant, isCompany: $isCompany, email: $email, phoneNumber: $phoneNumber, otherPhone: $otherPhone, website: $website, personalTaxCode: $personalTaxCode, address: $address, state: $state, street: $street)';
}


}

/// @nodoc
abstract mixin class _$PartnerModelCopyWith<$Res> implements $PartnerModelCopyWith<$Res> {
  factory _$PartnerModelCopyWith(_PartnerModel value, $Res Function(_PartnerModel) _then) = __$PartnerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? thumbnail, String? description, String? type, String? variant,@JsonKey(name: 'is_company') bool isCompany, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'other_phone') String? otherPhone, String? website,@JsonKey(name: 'personal_tax_code') String? personalTaxCode, String? address, String? state, String? street
});




}
/// @nodoc
class __$PartnerModelCopyWithImpl<$Res>
    implements _$PartnerModelCopyWith<$Res> {
  __$PartnerModelCopyWithImpl(this._self, this._then);

  final _PartnerModel _self;
  final $Res Function(_PartnerModel) _then;

/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thumbnail = freezed,Object? description = freezed,Object? type = freezed,Object? variant = freezed,Object? isCompany = null,Object? email = freezed,Object? phoneNumber = freezed,Object? otherPhone = freezed,Object? website = freezed,Object? personalTaxCode = freezed,Object? address = freezed,Object? state = freezed,Object? street = freezed,}) {
  return _then(_PartnerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,isCompany: null == isCompany ? _self.isCompany : isCompany // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,otherPhone: freezed == otherPhone ? _self.otherPhone : otherPhone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,personalTaxCode: freezed == personalTaxCode ? _self.personalTaxCode : personalTaxCode // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
