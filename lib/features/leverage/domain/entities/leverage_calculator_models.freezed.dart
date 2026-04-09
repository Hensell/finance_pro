// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leverage_calculator_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperatingLeverageInput {

 double get salesVolume; double get salePrice; double get variableCost; double get fixedCost;
/// Create a copy of OperatingLeverageInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperatingLeverageInputCopyWith<OperatingLeverageInput> get copyWith => _$OperatingLeverageInputCopyWithImpl<OperatingLeverageInput>(this as OperatingLeverageInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperatingLeverageInput&&(identical(other.salesVolume, salesVolume) || other.salesVolume == salesVolume)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.variableCost, variableCost) || other.variableCost == variableCost)&&(identical(other.fixedCost, fixedCost) || other.fixedCost == fixedCost));
}


@override
int get hashCode => Object.hash(runtimeType,salesVolume,salePrice,variableCost,fixedCost);

@override
String toString() {
  return 'OperatingLeverageInput(salesVolume: $salesVolume, salePrice: $salePrice, variableCost: $variableCost, fixedCost: $fixedCost)';
}


}

/// @nodoc
abstract mixin class $OperatingLeverageInputCopyWith<$Res>  {
  factory $OperatingLeverageInputCopyWith(OperatingLeverageInput value, $Res Function(OperatingLeverageInput) _then) = _$OperatingLeverageInputCopyWithImpl;
@useResult
$Res call({
 double salesVolume, double salePrice, double variableCost, double fixedCost
});




}
/// @nodoc
class _$OperatingLeverageInputCopyWithImpl<$Res>
    implements $OperatingLeverageInputCopyWith<$Res> {
  _$OperatingLeverageInputCopyWithImpl(this._self, this._then);

  final OperatingLeverageInput _self;
  final $Res Function(OperatingLeverageInput) _then;

/// Create a copy of OperatingLeverageInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesVolume = null,Object? salePrice = null,Object? variableCost = null,Object? fixedCost = null,}) {
  return _then(_self.copyWith(
salesVolume: null == salesVolume ? _self.salesVolume : salesVolume // ignore: cast_nullable_to_non_nullable
as double,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as double,variableCost: null == variableCost ? _self.variableCost : variableCost // ignore: cast_nullable_to_non_nullable
as double,fixedCost: null == fixedCost ? _self.fixedCost : fixedCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OperatingLeverageInput].
extension OperatingLeverageInputPatterns on OperatingLeverageInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperatingLeverageInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperatingLeverageInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperatingLeverageInput value)  $default,){
final _that = this;
switch (_that) {
case _OperatingLeverageInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperatingLeverageInput value)?  $default,){
final _that = this;
switch (_that) {
case _OperatingLeverageInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double salesVolume,  double salePrice,  double variableCost,  double fixedCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperatingLeverageInput() when $default != null:
return $default(_that.salesVolume,_that.salePrice,_that.variableCost,_that.fixedCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double salesVolume,  double salePrice,  double variableCost,  double fixedCost)  $default,) {final _that = this;
switch (_that) {
case _OperatingLeverageInput():
return $default(_that.salesVolume,_that.salePrice,_that.variableCost,_that.fixedCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double salesVolume,  double salePrice,  double variableCost,  double fixedCost)?  $default,) {final _that = this;
switch (_that) {
case _OperatingLeverageInput() when $default != null:
return $default(_that.salesVolume,_that.salePrice,_that.variableCost,_that.fixedCost);case _:
  return null;

}
}

}

/// @nodoc


class _OperatingLeverageInput implements OperatingLeverageInput {
  const _OperatingLeverageInput({required this.salesVolume, required this.salePrice, required this.variableCost, required this.fixedCost});
  

@override final  double salesVolume;
@override final  double salePrice;
@override final  double variableCost;
@override final  double fixedCost;

/// Create a copy of OperatingLeverageInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperatingLeverageInputCopyWith<_OperatingLeverageInput> get copyWith => __$OperatingLeverageInputCopyWithImpl<_OperatingLeverageInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperatingLeverageInput&&(identical(other.salesVolume, salesVolume) || other.salesVolume == salesVolume)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.variableCost, variableCost) || other.variableCost == variableCost)&&(identical(other.fixedCost, fixedCost) || other.fixedCost == fixedCost));
}


@override
int get hashCode => Object.hash(runtimeType,salesVolume,salePrice,variableCost,fixedCost);

@override
String toString() {
  return 'OperatingLeverageInput(salesVolume: $salesVolume, salePrice: $salePrice, variableCost: $variableCost, fixedCost: $fixedCost)';
}


}

/// @nodoc
abstract mixin class _$OperatingLeverageInputCopyWith<$Res> implements $OperatingLeverageInputCopyWith<$Res> {
  factory _$OperatingLeverageInputCopyWith(_OperatingLeverageInput value, $Res Function(_OperatingLeverageInput) _then) = __$OperatingLeverageInputCopyWithImpl;
@override @useResult
$Res call({
 double salesVolume, double salePrice, double variableCost, double fixedCost
});




}
/// @nodoc
class __$OperatingLeverageInputCopyWithImpl<$Res>
    implements _$OperatingLeverageInputCopyWith<$Res> {
  __$OperatingLeverageInputCopyWithImpl(this._self, this._then);

  final _OperatingLeverageInput _self;
  final $Res Function(_OperatingLeverageInput) _then;

/// Create a copy of OperatingLeverageInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesVolume = null,Object? salePrice = null,Object? variableCost = null,Object? fixedCost = null,}) {
  return _then(_OperatingLeverageInput(
salesVolume: null == salesVolume ? _self.salesVolume : salesVolume // ignore: cast_nullable_to_non_nullable
as double,salePrice: null == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as double,variableCost: null == variableCost ? _self.variableCost : variableCost // ignore: cast_nullable_to_non_nullable
as double,fixedCost: null == fixedCost ? _self.fixedCost : fixedCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$FinancialLeverageInput {

 double get interest; double get preferredDividends; double get taxRate; double get earningsBeforeInterestAndTaxes;
/// Create a copy of FinancialLeverageInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinancialLeverageInputCopyWith<FinancialLeverageInput> get copyWith => _$FinancialLeverageInputCopyWithImpl<FinancialLeverageInput>(this as FinancialLeverageInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinancialLeverageInput&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.preferredDividends, preferredDividends) || other.preferredDividends == preferredDividends)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.earningsBeforeInterestAndTaxes, earningsBeforeInterestAndTaxes) || other.earningsBeforeInterestAndTaxes == earningsBeforeInterestAndTaxes));
}


@override
int get hashCode => Object.hash(runtimeType,interest,preferredDividends,taxRate,earningsBeforeInterestAndTaxes);

@override
String toString() {
  return 'FinancialLeverageInput(interest: $interest, preferredDividends: $preferredDividends, taxRate: $taxRate, earningsBeforeInterestAndTaxes: $earningsBeforeInterestAndTaxes)';
}


}

/// @nodoc
abstract mixin class $FinancialLeverageInputCopyWith<$Res>  {
  factory $FinancialLeverageInputCopyWith(FinancialLeverageInput value, $Res Function(FinancialLeverageInput) _then) = _$FinancialLeverageInputCopyWithImpl;
@useResult
$Res call({
 double interest, double preferredDividends, double taxRate, double earningsBeforeInterestAndTaxes
});




}
/// @nodoc
class _$FinancialLeverageInputCopyWithImpl<$Res>
    implements $FinancialLeverageInputCopyWith<$Res> {
  _$FinancialLeverageInputCopyWithImpl(this._self, this._then);

  final FinancialLeverageInput _self;
  final $Res Function(FinancialLeverageInput) _then;

/// Create a copy of FinancialLeverageInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interest = null,Object? preferredDividends = null,Object? taxRate = null,Object? earningsBeforeInterestAndTaxes = null,}) {
  return _then(_self.copyWith(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as double,preferredDividends: null == preferredDividends ? _self.preferredDividends : preferredDividends // ignore: cast_nullable_to_non_nullable
as double,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,earningsBeforeInterestAndTaxes: null == earningsBeforeInterestAndTaxes ? _self.earningsBeforeInterestAndTaxes : earningsBeforeInterestAndTaxes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FinancialLeverageInput].
extension FinancialLeverageInputPatterns on FinancialLeverageInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinancialLeverageInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinancialLeverageInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinancialLeverageInput value)  $default,){
final _that = this;
switch (_that) {
case _FinancialLeverageInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinancialLeverageInput value)?  $default,){
final _that = this;
switch (_that) {
case _FinancialLeverageInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double interest,  double preferredDividends,  double taxRate,  double earningsBeforeInterestAndTaxes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinancialLeverageInput() when $default != null:
return $default(_that.interest,_that.preferredDividends,_that.taxRate,_that.earningsBeforeInterestAndTaxes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double interest,  double preferredDividends,  double taxRate,  double earningsBeforeInterestAndTaxes)  $default,) {final _that = this;
switch (_that) {
case _FinancialLeverageInput():
return $default(_that.interest,_that.preferredDividends,_that.taxRate,_that.earningsBeforeInterestAndTaxes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double interest,  double preferredDividends,  double taxRate,  double earningsBeforeInterestAndTaxes)?  $default,) {final _that = this;
switch (_that) {
case _FinancialLeverageInput() when $default != null:
return $default(_that.interest,_that.preferredDividends,_that.taxRate,_that.earningsBeforeInterestAndTaxes);case _:
  return null;

}
}

}

/// @nodoc


class _FinancialLeverageInput implements FinancialLeverageInput {
  const _FinancialLeverageInput({required this.interest, required this.preferredDividends, required this.taxRate, required this.earningsBeforeInterestAndTaxes});
  

@override final  double interest;
@override final  double preferredDividends;
@override final  double taxRate;
@override final  double earningsBeforeInterestAndTaxes;

/// Create a copy of FinancialLeverageInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinancialLeverageInputCopyWith<_FinancialLeverageInput> get copyWith => __$FinancialLeverageInputCopyWithImpl<_FinancialLeverageInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinancialLeverageInput&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.preferredDividends, preferredDividends) || other.preferredDividends == preferredDividends)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.earningsBeforeInterestAndTaxes, earningsBeforeInterestAndTaxes) || other.earningsBeforeInterestAndTaxes == earningsBeforeInterestAndTaxes));
}


@override
int get hashCode => Object.hash(runtimeType,interest,preferredDividends,taxRate,earningsBeforeInterestAndTaxes);

@override
String toString() {
  return 'FinancialLeverageInput(interest: $interest, preferredDividends: $preferredDividends, taxRate: $taxRate, earningsBeforeInterestAndTaxes: $earningsBeforeInterestAndTaxes)';
}


}

/// @nodoc
abstract mixin class _$FinancialLeverageInputCopyWith<$Res> implements $FinancialLeverageInputCopyWith<$Res> {
  factory _$FinancialLeverageInputCopyWith(_FinancialLeverageInput value, $Res Function(_FinancialLeverageInput) _then) = __$FinancialLeverageInputCopyWithImpl;
@override @useResult
$Res call({
 double interest, double preferredDividends, double taxRate, double earningsBeforeInterestAndTaxes
});




}
/// @nodoc
class __$FinancialLeverageInputCopyWithImpl<$Res>
    implements _$FinancialLeverageInputCopyWith<$Res> {
  __$FinancialLeverageInputCopyWithImpl(this._self, this._then);

  final _FinancialLeverageInput _self;
  final $Res Function(_FinancialLeverageInput) _then;

/// Create a copy of FinancialLeverageInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interest = null,Object? preferredDividends = null,Object? taxRate = null,Object? earningsBeforeInterestAndTaxes = null,}) {
  return _then(_FinancialLeverageInput(
interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as double,preferredDividends: null == preferredDividends ? _self.preferredDividends : preferredDividends // ignore: cast_nullable_to_non_nullable
as double,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,earningsBeforeInterestAndTaxes: null == earningsBeforeInterestAndTaxes ? _self.earningsBeforeInterestAndTaxes : earningsBeforeInterestAndTaxes // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$LeverageResult {

 double get degree;
/// Create a copy of LeverageResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeverageResultCopyWith<LeverageResult> get copyWith => _$LeverageResultCopyWithImpl<LeverageResult>(this as LeverageResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeverageResult&&(identical(other.degree, degree) || other.degree == degree));
}


@override
int get hashCode => Object.hash(runtimeType,degree);

@override
String toString() {
  return 'LeverageResult(degree: $degree)';
}


}

/// @nodoc
abstract mixin class $LeverageResultCopyWith<$Res>  {
  factory $LeverageResultCopyWith(LeverageResult value, $Res Function(LeverageResult) _then) = _$LeverageResultCopyWithImpl;
@useResult
$Res call({
 double degree
});




}
/// @nodoc
class _$LeverageResultCopyWithImpl<$Res>
    implements $LeverageResultCopyWith<$Res> {
  _$LeverageResultCopyWithImpl(this._self, this._then);

  final LeverageResult _self;
  final $Res Function(LeverageResult) _then;

/// Create a copy of LeverageResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? degree = null,}) {
  return _then(_self.copyWith(
degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LeverageResult].
extension LeverageResultPatterns on LeverageResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeverageResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeverageResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeverageResult value)  $default,){
final _that = this;
switch (_that) {
case _LeverageResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeverageResult value)?  $default,){
final _that = this;
switch (_that) {
case _LeverageResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double degree)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeverageResult() when $default != null:
return $default(_that.degree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double degree)  $default,) {final _that = this;
switch (_that) {
case _LeverageResult():
return $default(_that.degree);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double degree)?  $default,) {final _that = this;
switch (_that) {
case _LeverageResult() when $default != null:
return $default(_that.degree);case _:
  return null;

}
}

}

/// @nodoc


class _LeverageResult implements LeverageResult {
  const _LeverageResult({required this.degree});
  

@override final  double degree;

/// Create a copy of LeverageResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeverageResultCopyWith<_LeverageResult> get copyWith => __$LeverageResultCopyWithImpl<_LeverageResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeverageResult&&(identical(other.degree, degree) || other.degree == degree));
}


@override
int get hashCode => Object.hash(runtimeType,degree);

@override
String toString() {
  return 'LeverageResult(degree: $degree)';
}


}

/// @nodoc
abstract mixin class _$LeverageResultCopyWith<$Res> implements $LeverageResultCopyWith<$Res> {
  factory _$LeverageResultCopyWith(_LeverageResult value, $Res Function(_LeverageResult) _then) = __$LeverageResultCopyWithImpl;
@override @useResult
$Res call({
 double degree
});




}
/// @nodoc
class __$LeverageResultCopyWithImpl<$Res>
    implements _$LeverageResultCopyWith<$Res> {
  __$LeverageResultCopyWithImpl(this._self, this._then);

  final _LeverageResult _self;
  final $Res Function(_LeverageResult) _then;

/// Create a copy of LeverageResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? degree = null,}) {
  return _then(_LeverageResult(
degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
