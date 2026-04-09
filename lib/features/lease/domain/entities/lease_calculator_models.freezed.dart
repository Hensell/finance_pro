// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lease_calculator_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaseComparisonInput {

 double get discountRate; double get leasePayment; int get periods; double get purchasePrice; double get residualValue;
/// Create a copy of LeaseComparisonInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseComparisonInputCopyWith<LeaseComparisonInput> get copyWith => _$LeaseComparisonInputCopyWithImpl<LeaseComparisonInput>(this as LeaseComparisonInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseComparisonInput&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.leasePayment, leasePayment) || other.leasePayment == leasePayment)&&(identical(other.periods, periods) || other.periods == periods)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.residualValue, residualValue) || other.residualValue == residualValue));
}


@override
int get hashCode => Object.hash(runtimeType,discountRate,leasePayment,periods,purchasePrice,residualValue);

@override
String toString() {
  return 'LeaseComparisonInput(discountRate: $discountRate, leasePayment: $leasePayment, periods: $periods, purchasePrice: $purchasePrice, residualValue: $residualValue)';
}


}

/// @nodoc
abstract mixin class $LeaseComparisonInputCopyWith<$Res>  {
  factory $LeaseComparisonInputCopyWith(LeaseComparisonInput value, $Res Function(LeaseComparisonInput) _then) = _$LeaseComparisonInputCopyWithImpl;
@useResult
$Res call({
 double discountRate, double leasePayment, int periods, double purchasePrice, double residualValue
});




}
/// @nodoc
class _$LeaseComparisonInputCopyWithImpl<$Res>
    implements $LeaseComparisonInputCopyWith<$Res> {
  _$LeaseComparisonInputCopyWithImpl(this._self, this._then);

  final LeaseComparisonInput _self;
  final $Res Function(LeaseComparisonInput) _then;

/// Create a copy of LeaseComparisonInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? discountRate = null,Object? leasePayment = null,Object? periods = null,Object? purchasePrice = null,Object? residualValue = null,}) {
  return _then(_self.copyWith(
discountRate: null == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double,leasePayment: null == leasePayment ? _self.leasePayment : leasePayment // ignore: cast_nullable_to_non_nullable
as double,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as int,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double,residualValue: null == residualValue ? _self.residualValue : residualValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseComparisonInput].
extension LeaseComparisonInputPatterns on LeaseComparisonInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseComparisonInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseComparisonInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseComparisonInput value)  $default,){
final _that = this;
switch (_that) {
case _LeaseComparisonInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseComparisonInput value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseComparisonInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double discountRate,  double leasePayment,  int periods,  double purchasePrice,  double residualValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseComparisonInput() when $default != null:
return $default(_that.discountRate,_that.leasePayment,_that.periods,_that.purchasePrice,_that.residualValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double discountRate,  double leasePayment,  int periods,  double purchasePrice,  double residualValue)  $default,) {final _that = this;
switch (_that) {
case _LeaseComparisonInput():
return $default(_that.discountRate,_that.leasePayment,_that.periods,_that.purchasePrice,_that.residualValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double discountRate,  double leasePayment,  int periods,  double purchasePrice,  double residualValue)?  $default,) {final _that = this;
switch (_that) {
case _LeaseComparisonInput() when $default != null:
return $default(_that.discountRate,_that.leasePayment,_that.periods,_that.purchasePrice,_that.residualValue);case _:
  return null;

}
}

}

/// @nodoc


class _LeaseComparisonInput implements LeaseComparisonInput {
  const _LeaseComparisonInput({required this.discountRate, required this.leasePayment, required this.periods, required this.purchasePrice, required this.residualValue});
  

@override final  double discountRate;
@override final  double leasePayment;
@override final  int periods;
@override final  double purchasePrice;
@override final  double residualValue;

/// Create a copy of LeaseComparisonInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseComparisonInputCopyWith<_LeaseComparisonInput> get copyWith => __$LeaseComparisonInputCopyWithImpl<_LeaseComparisonInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseComparisonInput&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.leasePayment, leasePayment) || other.leasePayment == leasePayment)&&(identical(other.periods, periods) || other.periods == periods)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.residualValue, residualValue) || other.residualValue == residualValue));
}


@override
int get hashCode => Object.hash(runtimeType,discountRate,leasePayment,periods,purchasePrice,residualValue);

@override
String toString() {
  return 'LeaseComparisonInput(discountRate: $discountRate, leasePayment: $leasePayment, periods: $periods, purchasePrice: $purchasePrice, residualValue: $residualValue)';
}


}

/// @nodoc
abstract mixin class _$LeaseComparisonInputCopyWith<$Res> implements $LeaseComparisonInputCopyWith<$Res> {
  factory _$LeaseComparisonInputCopyWith(_LeaseComparisonInput value, $Res Function(_LeaseComparisonInput) _then) = __$LeaseComparisonInputCopyWithImpl;
@override @useResult
$Res call({
 double discountRate, double leasePayment, int periods, double purchasePrice, double residualValue
});




}
/// @nodoc
class __$LeaseComparisonInputCopyWithImpl<$Res>
    implements _$LeaseComparisonInputCopyWith<$Res> {
  __$LeaseComparisonInputCopyWithImpl(this._self, this._then);

  final _LeaseComparisonInput _self;
  final $Res Function(_LeaseComparisonInput) _then;

/// Create a copy of LeaseComparisonInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? discountRate = null,Object? leasePayment = null,Object? periods = null,Object? purchasePrice = null,Object? residualValue = null,}) {
  return _then(_LeaseComparisonInput(
discountRate: null == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double,leasePayment: null == leasePayment ? _self.leasePayment : leasePayment // ignore: cast_nullable_to_non_nullable
as double,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as int,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double,residualValue: null == residualValue ? _self.residualValue : residualValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$LeaseComparisonResult {

 double get difference; double get discountedResidualValue; double get leasePresentValue; double get purchaseNetCost;
/// Create a copy of LeaseComparisonResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseComparisonResultCopyWith<LeaseComparisonResult> get copyWith => _$LeaseComparisonResultCopyWithImpl<LeaseComparisonResult>(this as LeaseComparisonResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseComparisonResult&&(identical(other.difference, difference) || other.difference == difference)&&(identical(other.discountedResidualValue, discountedResidualValue) || other.discountedResidualValue == discountedResidualValue)&&(identical(other.leasePresentValue, leasePresentValue) || other.leasePresentValue == leasePresentValue)&&(identical(other.purchaseNetCost, purchaseNetCost) || other.purchaseNetCost == purchaseNetCost));
}


@override
int get hashCode => Object.hash(runtimeType,difference,discountedResidualValue,leasePresentValue,purchaseNetCost);

@override
String toString() {
  return 'LeaseComparisonResult(difference: $difference, discountedResidualValue: $discountedResidualValue, leasePresentValue: $leasePresentValue, purchaseNetCost: $purchaseNetCost)';
}


}

/// @nodoc
abstract mixin class $LeaseComparisonResultCopyWith<$Res>  {
  factory $LeaseComparisonResultCopyWith(LeaseComparisonResult value, $Res Function(LeaseComparisonResult) _then) = _$LeaseComparisonResultCopyWithImpl;
@useResult
$Res call({
 double difference, double discountedResidualValue, double leasePresentValue, double purchaseNetCost
});




}
/// @nodoc
class _$LeaseComparisonResultCopyWithImpl<$Res>
    implements $LeaseComparisonResultCopyWith<$Res> {
  _$LeaseComparisonResultCopyWithImpl(this._self, this._then);

  final LeaseComparisonResult _self;
  final $Res Function(LeaseComparisonResult) _then;

/// Create a copy of LeaseComparisonResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difference = null,Object? discountedResidualValue = null,Object? leasePresentValue = null,Object? purchaseNetCost = null,}) {
  return _then(_self.copyWith(
difference: null == difference ? _self.difference : difference // ignore: cast_nullable_to_non_nullable
as double,discountedResidualValue: null == discountedResidualValue ? _self.discountedResidualValue : discountedResidualValue // ignore: cast_nullable_to_non_nullable
as double,leasePresentValue: null == leasePresentValue ? _self.leasePresentValue : leasePresentValue // ignore: cast_nullable_to_non_nullable
as double,purchaseNetCost: null == purchaseNetCost ? _self.purchaseNetCost : purchaseNetCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseComparisonResult].
extension LeaseComparisonResultPatterns on LeaseComparisonResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseComparisonResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseComparisonResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseComparisonResult value)  $default,){
final _that = this;
switch (_that) {
case _LeaseComparisonResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseComparisonResult value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseComparisonResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double difference,  double discountedResidualValue,  double leasePresentValue,  double purchaseNetCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseComparisonResult() when $default != null:
return $default(_that.difference,_that.discountedResidualValue,_that.leasePresentValue,_that.purchaseNetCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double difference,  double discountedResidualValue,  double leasePresentValue,  double purchaseNetCost)  $default,) {final _that = this;
switch (_that) {
case _LeaseComparisonResult():
return $default(_that.difference,_that.discountedResidualValue,_that.leasePresentValue,_that.purchaseNetCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double difference,  double discountedResidualValue,  double leasePresentValue,  double purchaseNetCost)?  $default,) {final _that = this;
switch (_that) {
case _LeaseComparisonResult() when $default != null:
return $default(_that.difference,_that.discountedResidualValue,_that.leasePresentValue,_that.purchaseNetCost);case _:
  return null;

}
}

}

/// @nodoc


class _LeaseComparisonResult implements LeaseComparisonResult {
  const _LeaseComparisonResult({required this.difference, required this.discountedResidualValue, required this.leasePresentValue, required this.purchaseNetCost});
  

@override final  double difference;
@override final  double discountedResidualValue;
@override final  double leasePresentValue;
@override final  double purchaseNetCost;

/// Create a copy of LeaseComparisonResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseComparisonResultCopyWith<_LeaseComparisonResult> get copyWith => __$LeaseComparisonResultCopyWithImpl<_LeaseComparisonResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseComparisonResult&&(identical(other.difference, difference) || other.difference == difference)&&(identical(other.discountedResidualValue, discountedResidualValue) || other.discountedResidualValue == discountedResidualValue)&&(identical(other.leasePresentValue, leasePresentValue) || other.leasePresentValue == leasePresentValue)&&(identical(other.purchaseNetCost, purchaseNetCost) || other.purchaseNetCost == purchaseNetCost));
}


@override
int get hashCode => Object.hash(runtimeType,difference,discountedResidualValue,leasePresentValue,purchaseNetCost);

@override
String toString() {
  return 'LeaseComparisonResult(difference: $difference, discountedResidualValue: $discountedResidualValue, leasePresentValue: $leasePresentValue, purchaseNetCost: $purchaseNetCost)';
}


}

/// @nodoc
abstract mixin class _$LeaseComparisonResultCopyWith<$Res> implements $LeaseComparisonResultCopyWith<$Res> {
  factory _$LeaseComparisonResultCopyWith(_LeaseComparisonResult value, $Res Function(_LeaseComparisonResult) _then) = __$LeaseComparisonResultCopyWithImpl;
@override @useResult
$Res call({
 double difference, double discountedResidualValue, double leasePresentValue, double purchaseNetCost
});




}
/// @nodoc
class __$LeaseComparisonResultCopyWithImpl<$Res>
    implements _$LeaseComparisonResultCopyWith<$Res> {
  __$LeaseComparisonResultCopyWithImpl(this._self, this._then);

  final _LeaseComparisonResult _self;
  final $Res Function(_LeaseComparisonResult) _then;

/// Create a copy of LeaseComparisonResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difference = null,Object? discountedResidualValue = null,Object? leasePresentValue = null,Object? purchaseNetCost = null,}) {
  return _then(_LeaseComparisonResult(
difference: null == difference ? _self.difference : difference // ignore: cast_nullable_to_non_nullable
as double,discountedResidualValue: null == discountedResidualValue ? _self.discountedResidualValue : discountedResidualValue // ignore: cast_nullable_to_non_nullable
as double,leasePresentValue: null == leasePresentValue ? _self.leasePresentValue : leasePresentValue // ignore: cast_nullable_to_non_nullable
as double,purchaseNetCost: null == purchaseNetCost ? _self.purchaseNetCost : purchaseNetCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
