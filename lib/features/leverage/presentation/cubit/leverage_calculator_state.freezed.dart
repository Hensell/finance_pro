// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leverage_calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeverageCalculatorState {

 Map<String, String> get inputs; LeverageMode get mode; LeverageResult? get result; String? get validationKey;
/// Create a copy of LeverageCalculatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeverageCalculatorStateCopyWith<LeverageCalculatorState> get copyWith => _$LeverageCalculatorStateCopyWithImpl<LeverageCalculatorState>(this as LeverageCalculatorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeverageCalculatorState&&const DeepCollectionEquality().equals(other.inputs, inputs)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.result, result) || other.result == result)&&(identical(other.validationKey, validationKey) || other.validationKey == validationKey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(inputs),mode,result,validationKey);

@override
String toString() {
  return 'LeverageCalculatorState(inputs: $inputs, mode: $mode, result: $result, validationKey: $validationKey)';
}


}

/// @nodoc
abstract mixin class $LeverageCalculatorStateCopyWith<$Res>  {
  factory $LeverageCalculatorStateCopyWith(LeverageCalculatorState value, $Res Function(LeverageCalculatorState) _then) = _$LeverageCalculatorStateCopyWithImpl;
@useResult
$Res call({
 Map<String, String> inputs, LeverageMode mode, LeverageResult? result, String? validationKey
});


$LeverageResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$LeverageCalculatorStateCopyWithImpl<$Res>
    implements $LeverageCalculatorStateCopyWith<$Res> {
  _$LeverageCalculatorStateCopyWithImpl(this._self, this._then);

  final LeverageCalculatorState _self;
  final $Res Function(LeverageCalculatorState) _then;

/// Create a copy of LeverageCalculatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputs = null,Object? mode = null,Object? result = freezed,Object? validationKey = freezed,}) {
  return _then(_self.copyWith(
inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as Map<String, String>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LeverageMode,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LeverageResult?,validationKey: freezed == validationKey ? _self.validationKey : validationKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LeverageCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeverageResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $LeverageResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [LeverageCalculatorState].
extension LeverageCalculatorStatePatterns on LeverageCalculatorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeverageCalculatorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeverageCalculatorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeverageCalculatorState value)  $default,){
final _that = this;
switch (_that) {
case _LeverageCalculatorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeverageCalculatorState value)?  $default,){
final _that = this;
switch (_that) {
case _LeverageCalculatorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, String> inputs,  LeverageMode mode,  LeverageResult? result,  String? validationKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeverageCalculatorState() when $default != null:
return $default(_that.inputs,_that.mode,_that.result,_that.validationKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, String> inputs,  LeverageMode mode,  LeverageResult? result,  String? validationKey)  $default,) {final _that = this;
switch (_that) {
case _LeverageCalculatorState():
return $default(_that.inputs,_that.mode,_that.result,_that.validationKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, String> inputs,  LeverageMode mode,  LeverageResult? result,  String? validationKey)?  $default,) {final _that = this;
switch (_that) {
case _LeverageCalculatorState() when $default != null:
return $default(_that.inputs,_that.mode,_that.result,_that.validationKey);case _:
  return null;

}
}

}

/// @nodoc


class _LeverageCalculatorState implements LeverageCalculatorState {
  const _LeverageCalculatorState({final  Map<String, String> inputs = const <String, String>{}, this.mode = LeverageMode.operating, this.result, this.validationKey}): _inputs = inputs;
  

 final  Map<String, String> _inputs;
@override@JsonKey() Map<String, String> get inputs {
  if (_inputs is EqualUnmodifiableMapView) return _inputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_inputs);
}

@override@JsonKey() final  LeverageMode mode;
@override final  LeverageResult? result;
@override final  String? validationKey;

/// Create a copy of LeverageCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeverageCalculatorStateCopyWith<_LeverageCalculatorState> get copyWith => __$LeverageCalculatorStateCopyWithImpl<_LeverageCalculatorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeverageCalculatorState&&const DeepCollectionEquality().equals(other._inputs, _inputs)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.result, result) || other.result == result)&&(identical(other.validationKey, validationKey) || other.validationKey == validationKey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inputs),mode,result,validationKey);

@override
String toString() {
  return 'LeverageCalculatorState(inputs: $inputs, mode: $mode, result: $result, validationKey: $validationKey)';
}


}

/// @nodoc
abstract mixin class _$LeverageCalculatorStateCopyWith<$Res> implements $LeverageCalculatorStateCopyWith<$Res> {
  factory _$LeverageCalculatorStateCopyWith(_LeverageCalculatorState value, $Res Function(_LeverageCalculatorState) _then) = __$LeverageCalculatorStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, String> inputs, LeverageMode mode, LeverageResult? result, String? validationKey
});


@override $LeverageResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$LeverageCalculatorStateCopyWithImpl<$Res>
    implements _$LeverageCalculatorStateCopyWith<$Res> {
  __$LeverageCalculatorStateCopyWithImpl(this._self, this._then);

  final _LeverageCalculatorState _self;
  final $Res Function(_LeverageCalculatorState) _then;

/// Create a copy of LeverageCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputs = null,Object? mode = null,Object? result = freezed,Object? validationKey = freezed,}) {
  return _then(_LeverageCalculatorState(
inputs: null == inputs ? _self._inputs : inputs // ignore: cast_nullable_to_non_nullable
as Map<String, String>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LeverageMode,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LeverageResult?,validationKey: freezed == validationKey ? _self.validationKey : validationKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LeverageCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeverageResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $LeverageResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
