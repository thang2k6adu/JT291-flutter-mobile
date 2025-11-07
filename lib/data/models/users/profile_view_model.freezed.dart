// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileViewModel {

 String get userId; bool get canViewFull; int get total; List<ViewerModel> get views; PaginationModel get pagination;
/// Create a copy of ProfileViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileViewModelCopyWith<ProfileViewModel> get copyWith => _$ProfileViewModelCopyWithImpl<ProfileViewModel>(this as ProfileViewModel, _$identity);

  /// Serializes this ProfileViewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileViewModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.canViewFull, canViewFull) || other.canViewFull == canViewFull)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.views, views)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,canViewFull,total,const DeepCollectionEquality().hash(views),pagination);

@override
String toString() {
  return 'ProfileViewModel(userId: $userId, canViewFull: $canViewFull, total: $total, views: $views, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $ProfileViewModelCopyWith<$Res>  {
  factory $ProfileViewModelCopyWith(ProfileViewModel value, $Res Function(ProfileViewModel) _then) = _$ProfileViewModelCopyWithImpl;
@useResult
$Res call({
 String userId, bool canViewFull, int total, List<ViewerModel> views, PaginationModel pagination
});


$PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$ProfileViewModelCopyWithImpl<$Res>
    implements $ProfileViewModelCopyWith<$Res> {
  _$ProfileViewModelCopyWithImpl(this._self, this._then);

  final ProfileViewModel _self;
  final $Res Function(ProfileViewModel) _then;

/// Create a copy of ProfileViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? canViewFull = null,Object? total = null,Object? views = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,canViewFull: null == canViewFull ? _self.canViewFull : canViewFull // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as List<ViewerModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}
/// Create a copy of ProfileViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get pagination {
  
  return $PaginationModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileViewModel].
extension ProfileViewModelPatterns on ProfileViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileViewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileViewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileViewModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileViewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileViewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileViewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  bool canViewFull,  int total,  List<ViewerModel> views,  PaginationModel pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileViewModel() when $default != null:
return $default(_that.userId,_that.canViewFull,_that.total,_that.views,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  bool canViewFull,  int total,  List<ViewerModel> views,  PaginationModel pagination)  $default,) {final _that = this;
switch (_that) {
case _ProfileViewModel():
return $default(_that.userId,_that.canViewFull,_that.total,_that.views,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  bool canViewFull,  int total,  List<ViewerModel> views,  PaginationModel pagination)?  $default,) {final _that = this;
switch (_that) {
case _ProfileViewModel() when $default != null:
return $default(_that.userId,_that.canViewFull,_that.total,_that.views,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileViewModel implements ProfileViewModel {
  const _ProfileViewModel({required this.userId, required this.canViewFull, required this.total, required final  List<ViewerModel> views, required this.pagination}): _views = views;
  factory _ProfileViewModel.fromJson(Map<String, dynamic> json) => _$ProfileViewModelFromJson(json);

@override final  String userId;
@override final  bool canViewFull;
@override final  int total;
 final  List<ViewerModel> _views;
@override List<ViewerModel> get views {
  if (_views is EqualUnmodifiableListView) return _views;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_views);
}

@override final  PaginationModel pagination;

/// Create a copy of ProfileViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileViewModelCopyWith<_ProfileViewModel> get copyWith => __$ProfileViewModelCopyWithImpl<_ProfileViewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileViewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileViewModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.canViewFull, canViewFull) || other.canViewFull == canViewFull)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._views, _views)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,canViewFull,total,const DeepCollectionEquality().hash(_views),pagination);

@override
String toString() {
  return 'ProfileViewModel(userId: $userId, canViewFull: $canViewFull, total: $total, views: $views, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$ProfileViewModelCopyWith<$Res> implements $ProfileViewModelCopyWith<$Res> {
  factory _$ProfileViewModelCopyWith(_ProfileViewModel value, $Res Function(_ProfileViewModel) _then) = __$ProfileViewModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, bool canViewFull, int total, List<ViewerModel> views, PaginationModel pagination
});


@override $PaginationModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$ProfileViewModelCopyWithImpl<$Res>
    implements _$ProfileViewModelCopyWith<$Res> {
  __$ProfileViewModelCopyWithImpl(this._self, this._then);

  final _ProfileViewModel _self;
  final $Res Function(_ProfileViewModel) _then;

/// Create a copy of ProfileViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? canViewFull = null,Object? total = null,Object? views = null,Object? pagination = null,}) {
  return _then(_ProfileViewModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,canViewFull: null == canViewFull ? _self.canViewFull : canViewFull // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,views: null == views ? _self._views : views // ignore: cast_nullable_to_non_nullable
as List<ViewerModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,
  ));
}

/// Create a copy of ProfileViewModel
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
