// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond_calculator_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BondCalculatorInput {

 double get annualInterest; int get yearsToMaturity; double get parValue; double get requiredReturn;
/// Create a copy of BondCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BondCalculatorInputCopyWith<BondCalculatorInput> get copyWith => _$BondCalculatorInputCopyWithImpl<BondCalculatorInput>(this as BondCalculatorInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BondCalculatorInput&&(identical(other.annualInterest, annualInterest) || other.annualInterest == annualInterest)&&(identical(other.yearsToMaturity, yearsToMaturity) || other.yearsToMaturity == yearsToMaturity)&&(identical(other.parValue, parValue) || other.parValue == parValue)&&(identical(other.requiredReturn, requiredReturn) || other.requiredReturn == requiredReturn));
}


@override
int get hashCode => Object.hash(runtimeType,annualInterest,yearsToMaturity,parValue,requiredReturn);

@override
String toString() {
  return 'BondCalculatorInput(annualInterest: $annualInterest, yearsToMaturity: $yearsToMaturity, parValue: $parValue, requiredReturn: $requiredReturn)';
}


}

/// @nodoc
abstract mixin class $BondCalculatorInputCopyWith<$Res>  {
  factory $BondCalculatorInputCopyWith(BondCalculatorInput value, $Res Function(BondCalculatorInput) _then) = _$BondCalculatorInputCopyWithImpl;
@useResult
$Res call({
 double annualInterest, int yearsToMaturity, double parValue, double requiredReturn
});




}
/// @nodoc
class _$BondCalculatorInputCopyWithImpl<$Res>
    implements $BondCalculatorInputCopyWith<$Res> {
  _$BondCalculatorInputCopyWithImpl(this._self, this._then);

  final BondCalculatorInput _self;
  final $Res Function(BondCalculatorInput) _then;

/// Create a copy of BondCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annualInterest = null,Object? yearsToMaturity = null,Object? parValue = null,Object? requiredReturn = null,}) {
  return _then(_self.copyWith(
annualInterest: null == annualInterest ? _self.annualInterest : annualInterest // ignore: cast_nullable_to_non_nullable
as double,yearsToMaturity: null == yearsToMaturity ? _self.yearsToMaturity : yearsToMaturity // ignore: cast_nullable_to_non_nullable
as int,parValue: null == parValue ? _self.parValue : parValue // ignore: cast_nullable_to_non_nullable
as double,requiredReturn: null == requiredReturn ? _self.requiredReturn : requiredReturn // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BondCalculatorInput].
extension BondCalculatorInputPatterns on BondCalculatorInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BondCalculatorInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BondCalculatorInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BondCalculatorInput value)  $default,){
final _that = this;
switch (_that) {
case _BondCalculatorInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BondCalculatorInput value)?  $default,){
final _that = this;
switch (_that) {
case _BondCalculatorInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double annualInterest,  int yearsToMaturity,  double parValue,  double requiredReturn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BondCalculatorInput() when $default != null:
return $default(_that.annualInterest,_that.yearsToMaturity,_that.parValue,_that.requiredReturn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double annualInterest,  int yearsToMaturity,  double parValue,  double requiredReturn)  $default,) {final _that = this;
switch (_that) {
case _BondCalculatorInput():
return $default(_that.annualInterest,_that.yearsToMaturity,_that.parValue,_that.requiredReturn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double annualInterest,  int yearsToMaturity,  double parValue,  double requiredReturn)?  $default,) {final _that = this;
switch (_that) {
case _BondCalculatorInput() when $default != null:
return $default(_that.annualInterest,_that.yearsToMaturity,_that.parValue,_that.requiredReturn);case _:
  return null;

}
}

}

/// @nodoc


class _BondCalculatorInput implements BondCalculatorInput {
  const _BondCalculatorInput({required this.annualInterest, required this.yearsToMaturity, required this.parValue, required this.requiredReturn});
  

@override final  double annualInterest;
@override final  int yearsToMaturity;
@override final  double parValue;
@override final  double requiredReturn;

/// Create a copy of BondCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BondCalculatorInputCopyWith<_BondCalculatorInput> get copyWith => __$BondCalculatorInputCopyWithImpl<_BondCalculatorInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BondCalculatorInput&&(identical(other.annualInterest, annualInterest) || other.annualInterest == annualInterest)&&(identical(other.yearsToMaturity, yearsToMaturity) || other.yearsToMaturity == yearsToMaturity)&&(identical(other.parValue, parValue) || other.parValue == parValue)&&(identical(other.requiredReturn, requiredReturn) || other.requiredReturn == requiredReturn));
}


@override
int get hashCode => Object.hash(runtimeType,annualInterest,yearsToMaturity,parValue,requiredReturn);

@override
String toString() {
  return 'BondCalculatorInput(annualInterest: $annualInterest, yearsToMaturity: $yearsToMaturity, parValue: $parValue, requiredReturn: $requiredReturn)';
}


}

/// @nodoc
abstract mixin class _$BondCalculatorInputCopyWith<$Res> implements $BondCalculatorInputCopyWith<$Res> {
  factory _$BondCalculatorInputCopyWith(_BondCalculatorInput value, $Res Function(_BondCalculatorInput) _then) = __$BondCalculatorInputCopyWithImpl;
@override @useResult
$Res call({
 double annualInterest, int yearsToMaturity, double parValue, double requiredReturn
});




}
/// @nodoc
class __$BondCalculatorInputCopyWithImpl<$Res>
    implements _$BondCalculatorInputCopyWith<$Res> {
  __$BondCalculatorInputCopyWithImpl(this._self, this._then);

  final _BondCalculatorInput _self;
  final $Res Function(_BondCalculatorInput) _then;

/// Create a copy of BondCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annualInterest = null,Object? yearsToMaturity = null,Object? parValue = null,Object? requiredReturn = null,}) {
  return _then(_BondCalculatorInput(
annualInterest: null == annualInterest ? _self.annualInterest : annualInterest // ignore: cast_nullable_to_non_nullable
as double,yearsToMaturity: null == yearsToMaturity ? _self.yearsToMaturity : yearsToMaturity // ignore: cast_nullable_to_non_nullable
as int,parValue: null == parValue ? _self.parValue : parValue // ignore: cast_nullable_to_non_nullable
as double,requiredReturn: null == requiredReturn ? _self.requiredReturn : requiredReturn // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$BondCalculatorResult {

 double get presentValue;
/// Create a copy of BondCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BondCalculatorResultCopyWith<BondCalculatorResult> get copyWith => _$BondCalculatorResultCopyWithImpl<BondCalculatorResult>(this as BondCalculatorResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BondCalculatorResult&&(identical(other.presentValue, presentValue) || other.presentValue == presentValue));
}


@override
int get hashCode => Object.hash(runtimeType,presentValue);

@override
String toString() {
  return 'BondCalculatorResult(presentValue: $presentValue)';
}


}

/// @nodoc
abstract mixin class $BondCalculatorResultCopyWith<$Res>  {
  factory $BondCalculatorResultCopyWith(BondCalculatorResult value, $Res Function(BondCalculatorResult) _then) = _$BondCalculatorResultCopyWithImpl;
@useResult
$Res call({
 double presentValue
});




}
/// @nodoc
class _$BondCalculatorResultCopyWithImpl<$Res>
    implements $BondCalculatorResultCopyWith<$Res> {
  _$BondCalculatorResultCopyWithImpl(this._self, this._then);

  final BondCalculatorResult _self;
  final $Res Function(BondCalculatorResult) _then;

/// Create a copy of BondCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? presentValue = null,}) {
  return _then(_self.copyWith(
presentValue: null == presentValue ? _self.presentValue : presentValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BondCalculatorResult].
extension BondCalculatorResultPatterns on BondCalculatorResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BondCalculatorResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BondCalculatorResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BondCalculatorResult value)  $default,){
final _that = this;
switch (_that) {
case _BondCalculatorResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BondCalculatorResult value)?  $default,){
final _that = this;
switch (_that) {
case _BondCalculatorResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double presentValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BondCalculatorResult() when $default != null:
return $default(_that.presentValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double presentValue)  $default,) {final _that = this;
switch (_that) {
case _BondCalculatorResult():
return $default(_that.presentValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double presentValue)?  $default,) {final _that = this;
switch (_that) {
case _BondCalculatorResult() when $default != null:
return $default(_that.presentValue);case _:
  return null;

}
}

}

/// @nodoc


class _BondCalculatorResult implements BondCalculatorResult {
  const _BondCalculatorResult({required this.presentValue});
  

@override final  double presentValue;

/// Create a copy of BondCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BondCalculatorResultCopyWith<_BondCalculatorResult> get copyWith => __$BondCalculatorResultCopyWithImpl<_BondCalculatorResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BondCalculatorResult&&(identical(other.presentValue, presentValue) || other.presentValue == presentValue));
}


@override
int get hashCode => Object.hash(runtimeType,presentValue);

@override
String toString() {
  return 'BondCalculatorResult(presentValue: $presentValue)';
}


}

/// @nodoc
abstract mixin class _$BondCalculatorResultCopyWith<$Res> implements $BondCalculatorResultCopyWith<$Res> {
  factory _$BondCalculatorResultCopyWith(_BondCalculatorResult value, $Res Function(_BondCalculatorResult) _then) = __$BondCalculatorResultCopyWithImpl;
@override @useResult
$Res call({
 double presentValue
});




}
/// @nodoc
class __$BondCalculatorResultCopyWithImpl<$Res>
    implements _$BondCalculatorResultCopyWith<$Res> {
  __$BondCalculatorResultCopyWithImpl(this._self, this._then);

  final _BondCalculatorResult _self;
  final $Res Function(_BondCalculatorResult) _then;

/// Create a copy of BondCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presentValue = null,}) {
  return _then(_BondCalculatorResult(
presentValue: null == presentValue ? _self.presentValue : presentValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
