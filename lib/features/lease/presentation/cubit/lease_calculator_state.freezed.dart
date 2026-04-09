// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lease_calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaseCalculatorState {

 Map<String, String> get inputs; LeaseComparisonResult? get result; String? get validationKey;
/// Create a copy of LeaseCalculatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseCalculatorStateCopyWith<LeaseCalculatorState> get copyWith => _$LeaseCalculatorStateCopyWithImpl<LeaseCalculatorState>(this as LeaseCalculatorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseCalculatorState&&const DeepCollectionEquality().equals(other.inputs, inputs)&&(identical(other.result, result) || other.result == result)&&(identical(other.validationKey, validationKey) || other.validationKey == validationKey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(inputs),result,validationKey);

@override
String toString() {
  return 'LeaseCalculatorState(inputs: $inputs, result: $result, validationKey: $validationKey)';
}


}

/// @nodoc
abstract mixin class $LeaseCalculatorStateCopyWith<$Res>  {
  factory $LeaseCalculatorStateCopyWith(LeaseCalculatorState value, $Res Function(LeaseCalculatorState) _then) = _$LeaseCalculatorStateCopyWithImpl;
@useResult
$Res call({
 Map<String, String> inputs, LeaseComparisonResult? result, String? validationKey
});


$LeaseComparisonResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$LeaseCalculatorStateCopyWithImpl<$Res>
    implements $LeaseCalculatorStateCopyWith<$Res> {
  _$LeaseCalculatorStateCopyWithImpl(this._self, this._then);

  final LeaseCalculatorState _self;
  final $Res Function(LeaseCalculatorState) _then;

/// Create a copy of LeaseCalculatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputs = null,Object? result = freezed,Object? validationKey = freezed,}) {
  return _then(_self.copyWith(
inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as Map<String, String>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LeaseComparisonResult?,validationKey: freezed == validationKey ? _self.validationKey : validationKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LeaseCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeaseComparisonResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $LeaseComparisonResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [LeaseCalculatorState].
extension LeaseCalculatorStatePatterns on LeaseCalculatorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseCalculatorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseCalculatorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseCalculatorState value)  $default,){
final _that = this;
switch (_that) {
case _LeaseCalculatorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseCalculatorState value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseCalculatorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, String> inputs,  LeaseComparisonResult? result,  String? validationKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseCalculatorState() when $default != null:
return $default(_that.inputs,_that.result,_that.validationKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, String> inputs,  LeaseComparisonResult? result,  String? validationKey)  $default,) {final _that = this;
switch (_that) {
case _LeaseCalculatorState():
return $default(_that.inputs,_that.result,_that.validationKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, String> inputs,  LeaseComparisonResult? result,  String? validationKey)?  $default,) {final _that = this;
switch (_that) {
case _LeaseCalculatorState() when $default != null:
return $default(_that.inputs,_that.result,_that.validationKey);case _:
  return null;

}
}

}

/// @nodoc


class _LeaseCalculatorState implements LeaseCalculatorState {
  const _LeaseCalculatorState({final  Map<String, String> inputs = const <String, String>{}, this.result, this.validationKey}): _inputs = inputs;
  

 final  Map<String, String> _inputs;
@override@JsonKey() Map<String, String> get inputs {
  if (_inputs is EqualUnmodifiableMapView) return _inputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_inputs);
}

@override final  LeaseComparisonResult? result;
@override final  String? validationKey;

/// Create a copy of LeaseCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseCalculatorStateCopyWith<_LeaseCalculatorState> get copyWith => __$LeaseCalculatorStateCopyWithImpl<_LeaseCalculatorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseCalculatorState&&const DeepCollectionEquality().equals(other._inputs, _inputs)&&(identical(other.result, result) || other.result == result)&&(identical(other.validationKey, validationKey) || other.validationKey == validationKey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inputs),result,validationKey);

@override
String toString() {
  return 'LeaseCalculatorState(inputs: $inputs, result: $result, validationKey: $validationKey)';
}


}

/// @nodoc
abstract mixin class _$LeaseCalculatorStateCopyWith<$Res> implements $LeaseCalculatorStateCopyWith<$Res> {
  factory _$LeaseCalculatorStateCopyWith(_LeaseCalculatorState value, $Res Function(_LeaseCalculatorState) _then) = __$LeaseCalculatorStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, String> inputs, LeaseComparisonResult? result, String? validationKey
});


@override $LeaseComparisonResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$LeaseCalculatorStateCopyWithImpl<$Res>
    implements _$LeaseCalculatorStateCopyWith<$Res> {
  __$LeaseCalculatorStateCopyWithImpl(this._self, this._then);

  final _LeaseCalculatorState _self;
  final $Res Function(_LeaseCalculatorState) _then;

/// Create a copy of LeaseCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputs = null,Object? result = freezed,Object? validationKey = freezed,}) {
  return _then(_LeaseCalculatorState(
inputs: null == inputs ? _self._inputs : inputs // ignore: cast_nullable_to_non_nullable
as Map<String, String>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LeaseComparisonResult?,validationKey: freezed == validationKey ? _self.validationKey : validationKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LeaseCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeaseComparisonResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $LeaseComparisonResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
