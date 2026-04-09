// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_calculator_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareCalculatorInput {

 double get dividend; double get requiredReturn; double get initialGrowthRate; int get periods; double get terminalGrowthRate;
/// Create a copy of ShareCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareCalculatorInputCopyWith<ShareCalculatorInput> get copyWith => _$ShareCalculatorInputCopyWithImpl<ShareCalculatorInput>(this as ShareCalculatorInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareCalculatorInput&&(identical(other.dividend, dividend) || other.dividend == dividend)&&(identical(other.requiredReturn, requiredReturn) || other.requiredReturn == requiredReturn)&&(identical(other.initialGrowthRate, initialGrowthRate) || other.initialGrowthRate == initialGrowthRate)&&(identical(other.periods, periods) || other.periods == periods)&&(identical(other.terminalGrowthRate, terminalGrowthRate) || other.terminalGrowthRate == terminalGrowthRate));
}


@override
int get hashCode => Object.hash(runtimeType,dividend,requiredReturn,initialGrowthRate,periods,terminalGrowthRate);

@override
String toString() {
  return 'ShareCalculatorInput(dividend: $dividend, requiredReturn: $requiredReturn, initialGrowthRate: $initialGrowthRate, periods: $periods, terminalGrowthRate: $terminalGrowthRate)';
}


}

/// @nodoc
abstract mixin class $ShareCalculatorInputCopyWith<$Res>  {
  factory $ShareCalculatorInputCopyWith(ShareCalculatorInput value, $Res Function(ShareCalculatorInput) _then) = _$ShareCalculatorInputCopyWithImpl;
@useResult
$Res call({
 double dividend, double requiredReturn, double initialGrowthRate, int periods, double terminalGrowthRate
});




}
/// @nodoc
class _$ShareCalculatorInputCopyWithImpl<$Res>
    implements $ShareCalculatorInputCopyWith<$Res> {
  _$ShareCalculatorInputCopyWithImpl(this._self, this._then);

  final ShareCalculatorInput _self;
  final $Res Function(ShareCalculatorInput) _then;

/// Create a copy of ShareCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dividend = null,Object? requiredReturn = null,Object? initialGrowthRate = null,Object? periods = null,Object? terminalGrowthRate = null,}) {
  return _then(_self.copyWith(
dividend: null == dividend ? _self.dividend : dividend // ignore: cast_nullable_to_non_nullable
as double,requiredReturn: null == requiredReturn ? _self.requiredReturn : requiredReturn // ignore: cast_nullable_to_non_nullable
as double,initialGrowthRate: null == initialGrowthRate ? _self.initialGrowthRate : initialGrowthRate // ignore: cast_nullable_to_non_nullable
as double,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as int,terminalGrowthRate: null == terminalGrowthRate ? _self.terminalGrowthRate : terminalGrowthRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareCalculatorInput].
extension ShareCalculatorInputPatterns on ShareCalculatorInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareCalculatorInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareCalculatorInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareCalculatorInput value)  $default,){
final _that = this;
switch (_that) {
case _ShareCalculatorInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareCalculatorInput value)?  $default,){
final _that = this;
switch (_that) {
case _ShareCalculatorInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double dividend,  double requiredReturn,  double initialGrowthRate,  int periods,  double terminalGrowthRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareCalculatorInput() when $default != null:
return $default(_that.dividend,_that.requiredReturn,_that.initialGrowthRate,_that.periods,_that.terminalGrowthRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double dividend,  double requiredReturn,  double initialGrowthRate,  int periods,  double terminalGrowthRate)  $default,) {final _that = this;
switch (_that) {
case _ShareCalculatorInput():
return $default(_that.dividend,_that.requiredReturn,_that.initialGrowthRate,_that.periods,_that.terminalGrowthRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double dividend,  double requiredReturn,  double initialGrowthRate,  int periods,  double terminalGrowthRate)?  $default,) {final _that = this;
switch (_that) {
case _ShareCalculatorInput() when $default != null:
return $default(_that.dividend,_that.requiredReturn,_that.initialGrowthRate,_that.periods,_that.terminalGrowthRate);case _:
  return null;

}
}

}

/// @nodoc


class _ShareCalculatorInput implements ShareCalculatorInput {
  const _ShareCalculatorInput({required this.dividend, required this.requiredReturn, required this.initialGrowthRate, required this.periods, required this.terminalGrowthRate});
  

@override final  double dividend;
@override final  double requiredReturn;
@override final  double initialGrowthRate;
@override final  int periods;
@override final  double terminalGrowthRate;

/// Create a copy of ShareCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareCalculatorInputCopyWith<_ShareCalculatorInput> get copyWith => __$ShareCalculatorInputCopyWithImpl<_ShareCalculatorInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareCalculatorInput&&(identical(other.dividend, dividend) || other.dividend == dividend)&&(identical(other.requiredReturn, requiredReturn) || other.requiredReturn == requiredReturn)&&(identical(other.initialGrowthRate, initialGrowthRate) || other.initialGrowthRate == initialGrowthRate)&&(identical(other.periods, periods) || other.periods == periods)&&(identical(other.terminalGrowthRate, terminalGrowthRate) || other.terminalGrowthRate == terminalGrowthRate));
}


@override
int get hashCode => Object.hash(runtimeType,dividend,requiredReturn,initialGrowthRate,periods,terminalGrowthRate);

@override
String toString() {
  return 'ShareCalculatorInput(dividend: $dividend, requiredReturn: $requiredReturn, initialGrowthRate: $initialGrowthRate, periods: $periods, terminalGrowthRate: $terminalGrowthRate)';
}


}

/// @nodoc
abstract mixin class _$ShareCalculatorInputCopyWith<$Res> implements $ShareCalculatorInputCopyWith<$Res> {
  factory _$ShareCalculatorInputCopyWith(_ShareCalculatorInput value, $Res Function(_ShareCalculatorInput) _then) = __$ShareCalculatorInputCopyWithImpl;
@override @useResult
$Res call({
 double dividend, double requiredReturn, double initialGrowthRate, int periods, double terminalGrowthRate
});




}
/// @nodoc
class __$ShareCalculatorInputCopyWithImpl<$Res>
    implements _$ShareCalculatorInputCopyWith<$Res> {
  __$ShareCalculatorInputCopyWithImpl(this._self, this._then);

  final _ShareCalculatorInput _self;
  final $Res Function(_ShareCalculatorInput) _then;

/// Create a copy of ShareCalculatorInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dividend = null,Object? requiredReturn = null,Object? initialGrowthRate = null,Object? periods = null,Object? terminalGrowthRate = null,}) {
  return _then(_ShareCalculatorInput(
dividend: null == dividend ? _self.dividend : dividend // ignore: cast_nullable_to_non_nullable
as double,requiredReturn: null == requiredReturn ? _self.requiredReturn : requiredReturn // ignore: cast_nullable_to_non_nullable
as double,initialGrowthRate: null == initialGrowthRate ? _self.initialGrowthRate : initialGrowthRate // ignore: cast_nullable_to_non_nullable
as double,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as int,terminalGrowthRate: null == terminalGrowthRate ? _self.terminalGrowthRate : terminalGrowthRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ShareProjectionRow {

 int get period; double get dividendBase; double get growthFactor; double get projectedDividend; double get discountFactor; double get presentValue;
/// Create a copy of ShareProjectionRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareProjectionRowCopyWith<ShareProjectionRow> get copyWith => _$ShareProjectionRowCopyWithImpl<ShareProjectionRow>(this as ShareProjectionRow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareProjectionRow&&(identical(other.period, period) || other.period == period)&&(identical(other.dividendBase, dividendBase) || other.dividendBase == dividendBase)&&(identical(other.growthFactor, growthFactor) || other.growthFactor == growthFactor)&&(identical(other.projectedDividend, projectedDividend) || other.projectedDividend == projectedDividend)&&(identical(other.discountFactor, discountFactor) || other.discountFactor == discountFactor)&&(identical(other.presentValue, presentValue) || other.presentValue == presentValue));
}


@override
int get hashCode => Object.hash(runtimeType,period,dividendBase,growthFactor,projectedDividend,discountFactor,presentValue);

@override
String toString() {
  return 'ShareProjectionRow(period: $period, dividendBase: $dividendBase, growthFactor: $growthFactor, projectedDividend: $projectedDividend, discountFactor: $discountFactor, presentValue: $presentValue)';
}


}

/// @nodoc
abstract mixin class $ShareProjectionRowCopyWith<$Res>  {
  factory $ShareProjectionRowCopyWith(ShareProjectionRow value, $Res Function(ShareProjectionRow) _then) = _$ShareProjectionRowCopyWithImpl;
@useResult
$Res call({
 int period, double dividendBase, double growthFactor, double projectedDividend, double discountFactor, double presentValue
});




}
/// @nodoc
class _$ShareProjectionRowCopyWithImpl<$Res>
    implements $ShareProjectionRowCopyWith<$Res> {
  _$ShareProjectionRowCopyWithImpl(this._self, this._then);

  final ShareProjectionRow _self;
  final $Res Function(ShareProjectionRow) _then;

/// Create a copy of ShareProjectionRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? dividendBase = null,Object? growthFactor = null,Object? projectedDividend = null,Object? discountFactor = null,Object? presentValue = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as int,dividendBase: null == dividendBase ? _self.dividendBase : dividendBase // ignore: cast_nullable_to_non_nullable
as double,growthFactor: null == growthFactor ? _self.growthFactor : growthFactor // ignore: cast_nullable_to_non_nullable
as double,projectedDividend: null == projectedDividend ? _self.projectedDividend : projectedDividend // ignore: cast_nullable_to_non_nullable
as double,discountFactor: null == discountFactor ? _self.discountFactor : discountFactor // ignore: cast_nullable_to_non_nullable
as double,presentValue: null == presentValue ? _self.presentValue : presentValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareProjectionRow].
extension ShareProjectionRowPatterns on ShareProjectionRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareProjectionRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareProjectionRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareProjectionRow value)  $default,){
final _that = this;
switch (_that) {
case _ShareProjectionRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareProjectionRow value)?  $default,){
final _that = this;
switch (_that) {
case _ShareProjectionRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int period,  double dividendBase,  double growthFactor,  double projectedDividend,  double discountFactor,  double presentValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareProjectionRow() when $default != null:
return $default(_that.period,_that.dividendBase,_that.growthFactor,_that.projectedDividend,_that.discountFactor,_that.presentValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int period,  double dividendBase,  double growthFactor,  double projectedDividend,  double discountFactor,  double presentValue)  $default,) {final _that = this;
switch (_that) {
case _ShareProjectionRow():
return $default(_that.period,_that.dividendBase,_that.growthFactor,_that.projectedDividend,_that.discountFactor,_that.presentValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int period,  double dividendBase,  double growthFactor,  double projectedDividend,  double discountFactor,  double presentValue)?  $default,) {final _that = this;
switch (_that) {
case _ShareProjectionRow() when $default != null:
return $default(_that.period,_that.dividendBase,_that.growthFactor,_that.projectedDividend,_that.discountFactor,_that.presentValue);case _:
  return null;

}
}

}

/// @nodoc


class _ShareProjectionRow implements ShareProjectionRow {
  const _ShareProjectionRow({required this.period, required this.dividendBase, required this.growthFactor, required this.projectedDividend, required this.discountFactor, required this.presentValue});
  

@override final  int period;
@override final  double dividendBase;
@override final  double growthFactor;
@override final  double projectedDividend;
@override final  double discountFactor;
@override final  double presentValue;

/// Create a copy of ShareProjectionRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareProjectionRowCopyWith<_ShareProjectionRow> get copyWith => __$ShareProjectionRowCopyWithImpl<_ShareProjectionRow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareProjectionRow&&(identical(other.period, period) || other.period == period)&&(identical(other.dividendBase, dividendBase) || other.dividendBase == dividendBase)&&(identical(other.growthFactor, growthFactor) || other.growthFactor == growthFactor)&&(identical(other.projectedDividend, projectedDividend) || other.projectedDividend == projectedDividend)&&(identical(other.discountFactor, discountFactor) || other.discountFactor == discountFactor)&&(identical(other.presentValue, presentValue) || other.presentValue == presentValue));
}


@override
int get hashCode => Object.hash(runtimeType,period,dividendBase,growthFactor,projectedDividend,discountFactor,presentValue);

@override
String toString() {
  return 'ShareProjectionRow(period: $period, dividendBase: $dividendBase, growthFactor: $growthFactor, projectedDividend: $projectedDividend, discountFactor: $discountFactor, presentValue: $presentValue)';
}


}

/// @nodoc
abstract mixin class _$ShareProjectionRowCopyWith<$Res> implements $ShareProjectionRowCopyWith<$Res> {
  factory _$ShareProjectionRowCopyWith(_ShareProjectionRow value, $Res Function(_ShareProjectionRow) _then) = __$ShareProjectionRowCopyWithImpl;
@override @useResult
$Res call({
 int period, double dividendBase, double growthFactor, double projectedDividend, double discountFactor, double presentValue
});




}
/// @nodoc
class __$ShareProjectionRowCopyWithImpl<$Res>
    implements _$ShareProjectionRowCopyWith<$Res> {
  __$ShareProjectionRowCopyWithImpl(this._self, this._then);

  final _ShareProjectionRow _self;
  final $Res Function(_ShareProjectionRow) _then;

/// Create a copy of ShareProjectionRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? dividendBase = null,Object? growthFactor = null,Object? projectedDividend = null,Object? discountFactor = null,Object? presentValue = null,}) {
  return _then(_ShareProjectionRow(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as int,dividendBase: null == dividendBase ? _self.dividendBase : dividendBase // ignore: cast_nullable_to_non_nullable
as double,growthFactor: null == growthFactor ? _self.growthFactor : growthFactor // ignore: cast_nullable_to_non_nullable
as double,projectedDividend: null == projectedDividend ? _self.projectedDividend : projectedDividend // ignore: cast_nullable_to_non_nullable
as double,discountFactor: null == discountFactor ? _self.discountFactor : discountFactor // ignore: cast_nullable_to_non_nullable
as double,presentValue: null == presentValue ? _self.presentValue : presentValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ShareCalculatorResult {

 ShareCalculationMode get mode; double get presentValue; List<ShareProjectionRow> get projectionRows; double? get terminalDividend; double? get terminalPrice; double? get terminalPresentValue;
/// Create a copy of ShareCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareCalculatorResultCopyWith<ShareCalculatorResult> get copyWith => _$ShareCalculatorResultCopyWithImpl<ShareCalculatorResult>(this as ShareCalculatorResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareCalculatorResult&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.presentValue, presentValue) || other.presentValue == presentValue)&&const DeepCollectionEquality().equals(other.projectionRows, projectionRows)&&(identical(other.terminalDividend, terminalDividend) || other.terminalDividend == terminalDividend)&&(identical(other.terminalPrice, terminalPrice) || other.terminalPrice == terminalPrice)&&(identical(other.terminalPresentValue, terminalPresentValue) || other.terminalPresentValue == terminalPresentValue));
}


@override
int get hashCode => Object.hash(runtimeType,mode,presentValue,const DeepCollectionEquality().hash(projectionRows),terminalDividend,terminalPrice,terminalPresentValue);

@override
String toString() {
  return 'ShareCalculatorResult(mode: $mode, presentValue: $presentValue, projectionRows: $projectionRows, terminalDividend: $terminalDividend, terminalPrice: $terminalPrice, terminalPresentValue: $terminalPresentValue)';
}


}

/// @nodoc
abstract mixin class $ShareCalculatorResultCopyWith<$Res>  {
  factory $ShareCalculatorResultCopyWith(ShareCalculatorResult value, $Res Function(ShareCalculatorResult) _then) = _$ShareCalculatorResultCopyWithImpl;
@useResult
$Res call({
 ShareCalculationMode mode, double presentValue, List<ShareProjectionRow> projectionRows, double? terminalDividend, double? terminalPrice, double? terminalPresentValue
});




}
/// @nodoc
class _$ShareCalculatorResultCopyWithImpl<$Res>
    implements $ShareCalculatorResultCopyWith<$Res> {
  _$ShareCalculatorResultCopyWithImpl(this._self, this._then);

  final ShareCalculatorResult _self;
  final $Res Function(ShareCalculatorResult) _then;

/// Create a copy of ShareCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? presentValue = null,Object? projectionRows = null,Object? terminalDividend = freezed,Object? terminalPrice = freezed,Object? terminalPresentValue = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ShareCalculationMode,presentValue: null == presentValue ? _self.presentValue : presentValue // ignore: cast_nullable_to_non_nullable
as double,projectionRows: null == projectionRows ? _self.projectionRows : projectionRows // ignore: cast_nullable_to_non_nullable
as List<ShareProjectionRow>,terminalDividend: freezed == terminalDividend ? _self.terminalDividend : terminalDividend // ignore: cast_nullable_to_non_nullable
as double?,terminalPrice: freezed == terminalPrice ? _self.terminalPrice : terminalPrice // ignore: cast_nullable_to_non_nullable
as double?,terminalPresentValue: freezed == terminalPresentValue ? _self.terminalPresentValue : terminalPresentValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareCalculatorResult].
extension ShareCalculatorResultPatterns on ShareCalculatorResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareCalculatorResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareCalculatorResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareCalculatorResult value)  $default,){
final _that = this;
switch (_that) {
case _ShareCalculatorResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareCalculatorResult value)?  $default,){
final _that = this;
switch (_that) {
case _ShareCalculatorResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ShareCalculationMode mode,  double presentValue,  List<ShareProjectionRow> projectionRows,  double? terminalDividend,  double? terminalPrice,  double? terminalPresentValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareCalculatorResult() when $default != null:
return $default(_that.mode,_that.presentValue,_that.projectionRows,_that.terminalDividend,_that.terminalPrice,_that.terminalPresentValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ShareCalculationMode mode,  double presentValue,  List<ShareProjectionRow> projectionRows,  double? terminalDividend,  double? terminalPrice,  double? terminalPresentValue)  $default,) {final _that = this;
switch (_that) {
case _ShareCalculatorResult():
return $default(_that.mode,_that.presentValue,_that.projectionRows,_that.terminalDividend,_that.terminalPrice,_that.terminalPresentValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ShareCalculationMode mode,  double presentValue,  List<ShareProjectionRow> projectionRows,  double? terminalDividend,  double? terminalPrice,  double? terminalPresentValue)?  $default,) {final _that = this;
switch (_that) {
case _ShareCalculatorResult() when $default != null:
return $default(_that.mode,_that.presentValue,_that.projectionRows,_that.terminalDividend,_that.terminalPrice,_that.terminalPresentValue);case _:
  return null;

}
}

}

/// @nodoc


class _ShareCalculatorResult implements ShareCalculatorResult {
  const _ShareCalculatorResult({required this.mode, required this.presentValue, final  List<ShareProjectionRow> projectionRows = const <ShareProjectionRow>[], this.terminalDividend, this.terminalPrice, this.terminalPresentValue}): _projectionRows = projectionRows;
  

@override final  ShareCalculationMode mode;
@override final  double presentValue;
 final  List<ShareProjectionRow> _projectionRows;
@override@JsonKey() List<ShareProjectionRow> get projectionRows {
  if (_projectionRows is EqualUnmodifiableListView) return _projectionRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectionRows);
}

@override final  double? terminalDividend;
@override final  double? terminalPrice;
@override final  double? terminalPresentValue;

/// Create a copy of ShareCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareCalculatorResultCopyWith<_ShareCalculatorResult> get copyWith => __$ShareCalculatorResultCopyWithImpl<_ShareCalculatorResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareCalculatorResult&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.presentValue, presentValue) || other.presentValue == presentValue)&&const DeepCollectionEquality().equals(other._projectionRows, _projectionRows)&&(identical(other.terminalDividend, terminalDividend) || other.terminalDividend == terminalDividend)&&(identical(other.terminalPrice, terminalPrice) || other.terminalPrice == terminalPrice)&&(identical(other.terminalPresentValue, terminalPresentValue) || other.terminalPresentValue == terminalPresentValue));
}


@override
int get hashCode => Object.hash(runtimeType,mode,presentValue,const DeepCollectionEquality().hash(_projectionRows),terminalDividend,terminalPrice,terminalPresentValue);

@override
String toString() {
  return 'ShareCalculatorResult(mode: $mode, presentValue: $presentValue, projectionRows: $projectionRows, terminalDividend: $terminalDividend, terminalPrice: $terminalPrice, terminalPresentValue: $terminalPresentValue)';
}


}

/// @nodoc
abstract mixin class _$ShareCalculatorResultCopyWith<$Res> implements $ShareCalculatorResultCopyWith<$Res> {
  factory _$ShareCalculatorResultCopyWith(_ShareCalculatorResult value, $Res Function(_ShareCalculatorResult) _then) = __$ShareCalculatorResultCopyWithImpl;
@override @useResult
$Res call({
 ShareCalculationMode mode, double presentValue, List<ShareProjectionRow> projectionRows, double? terminalDividend, double? terminalPrice, double? terminalPresentValue
});




}
/// @nodoc
class __$ShareCalculatorResultCopyWithImpl<$Res>
    implements _$ShareCalculatorResultCopyWith<$Res> {
  __$ShareCalculatorResultCopyWithImpl(this._self, this._then);

  final _ShareCalculatorResult _self;
  final $Res Function(_ShareCalculatorResult) _then;

/// Create a copy of ShareCalculatorResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? presentValue = null,Object? projectionRows = null,Object? terminalDividend = freezed,Object? terminalPrice = freezed,Object? terminalPresentValue = freezed,}) {
  return _then(_ShareCalculatorResult(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ShareCalculationMode,presentValue: null == presentValue ? _self.presentValue : presentValue // ignore: cast_nullable_to_non_nullable
as double,projectionRows: null == projectionRows ? _self._projectionRows : projectionRows // ignore: cast_nullable_to_non_nullable
as List<ShareProjectionRow>,terminalDividend: freezed == terminalDividend ? _self.terminalDividend : terminalDividend // ignore: cast_nullable_to_non_nullable
as double?,terminalPrice: freezed == terminalPrice ? _self.terminalPrice : terminalPrice // ignore: cast_nullable_to_non_nullable
as double?,terminalPresentValue: freezed == terminalPresentValue ? _self.terminalPresentValue : terminalPresentValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
