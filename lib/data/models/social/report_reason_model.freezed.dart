// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_reason_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportReasonModel {

 int get id; String get label;
/// Create a copy of ReportReasonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportReasonModelCopyWith<ReportReasonModel> get copyWith => _$ReportReasonModelCopyWithImpl<ReportReasonModel>(this as ReportReasonModel, _$identity);

  /// Serializes this ReportReasonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportReasonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'ReportReasonModel(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class $ReportReasonModelCopyWith<$Res>  {
  factory $ReportReasonModelCopyWith(ReportReasonModel value, $Res Function(ReportReasonModel) _then) = _$ReportReasonModelCopyWithImpl;
@useResult
$Res call({
 int id, String label
});




}
/// @nodoc
class _$ReportReasonModelCopyWithImpl<$Res>
    implements $ReportReasonModelCopyWith<$Res> {
  _$ReportReasonModelCopyWithImpl(this._self, this._then);

  final ReportReasonModel _self;
  final $Res Function(ReportReasonModel) _then;

/// Create a copy of ReportReasonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportReasonModel].
extension ReportReasonModelPatterns on ReportReasonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportReasonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportReasonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportReasonModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportReasonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportReasonModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportReasonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportReasonModel() when $default != null:
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String label)  $default,) {final _that = this;
switch (_that) {
case _ReportReasonModel():
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String label)?  $default,) {final _that = this;
switch (_that) {
case _ReportReasonModel() when $default != null:
return $default(_that.id,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportReasonModel implements ReportReasonModel {
  const _ReportReasonModel({required this.id, required this.label});
  factory _ReportReasonModel.fromJson(Map<String, dynamic> json) => _$ReportReasonModelFromJson(json);

@override final  int id;
@override final  String label;

/// Create a copy of ReportReasonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportReasonModelCopyWith<_ReportReasonModel> get copyWith => __$ReportReasonModelCopyWithImpl<_ReportReasonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportReasonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportReasonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'ReportReasonModel(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class _$ReportReasonModelCopyWith<$Res> implements $ReportReasonModelCopyWith<$Res> {
  factory _$ReportReasonModelCopyWith(_ReportReasonModel value, $Res Function(_ReportReasonModel) _then) = __$ReportReasonModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String label
});




}
/// @nodoc
class __$ReportReasonModelCopyWithImpl<$Res>
    implements _$ReportReasonModelCopyWith<$Res> {
  __$ReportReasonModelCopyWithImpl(this._self, this._then);

  final _ReportReasonModel _self;
  final $Res Function(_ReportReasonModel) _then;

/// Create a copy of ReportReasonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,}) {
  return _then(_ReportReasonModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
