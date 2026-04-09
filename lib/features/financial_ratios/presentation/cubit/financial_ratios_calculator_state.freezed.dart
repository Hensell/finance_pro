// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financial_ratios_calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FinancialRatiosCalculatorState {

 FinancialRatiosBuilderStep get currentStep; FinancialStatementsDraft get draft; DerivedStatements get derivedStatements; List<FinancialStatementsValidationIssue> get incomeStatementIssues; List<FinancialStatementsValidationIssue> get balanceSheetIssues; List<FinancialStatementsValidationIssue> get analysisIssues; String get selectedGroupId; FinancialRatiosResult? get result; String? get validationKey;
/// Create a copy of FinancialRatiosCalculatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinancialRatiosCalculatorStateCopyWith<FinancialRatiosCalculatorState> get copyWith => _$FinancialRatiosCalculatorStateCopyWithImpl<FinancialRatiosCalculatorState>(this as FinancialRatiosCalculatorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinancialRatiosCalculatorState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.derivedStatements, derivedStatements) || other.derivedStatements == derivedStatements)&&const DeepCollectionEquality().equals(other.incomeStatementIssues, incomeStatementIssues)&&const DeepCollectionEquality().equals(other.balanceSheetIssues, balanceSheetIssues)&&const DeepCollectionEquality().equals(other.analysisIssues, analysisIssues)&&(identical(other.selectedGroupId, selectedGroupId) || other.selectedGroupId == selectedGroupId)&&(identical(other.result, result) || other.result == result)&&(identical(other.validationKey, validationKey) || other.validationKey == validationKey));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,draft,derivedStatements,const DeepCollectionEquality().hash(incomeStatementIssues),const DeepCollectionEquality().hash(balanceSheetIssues),const DeepCollectionEquality().hash(analysisIssues),selectedGroupId,result,validationKey);

@override
String toString() {
  return 'FinancialRatiosCalculatorState(currentStep: $currentStep, draft: $draft, derivedStatements: $derivedStatements, incomeStatementIssues: $incomeStatementIssues, balanceSheetIssues: $balanceSheetIssues, analysisIssues: $analysisIssues, selectedGroupId: $selectedGroupId, result: $result, validationKey: $validationKey)';
}


}

/// @nodoc
abstract mixin class $FinancialRatiosCalculatorStateCopyWith<$Res>  {
  factory $FinancialRatiosCalculatorStateCopyWith(FinancialRatiosCalculatorState value, $Res Function(FinancialRatiosCalculatorState) _then) = _$FinancialRatiosCalculatorStateCopyWithImpl;
@useResult
$Res call({
 FinancialRatiosBuilderStep currentStep, FinancialStatementsDraft draft, DerivedStatements derivedStatements, List<FinancialStatementsValidationIssue> incomeStatementIssues, List<FinancialStatementsValidationIssue> balanceSheetIssues, List<FinancialStatementsValidationIssue> analysisIssues, String selectedGroupId, FinancialRatiosResult? result, String? validationKey
});




}
/// @nodoc
class _$FinancialRatiosCalculatorStateCopyWithImpl<$Res>
    implements $FinancialRatiosCalculatorStateCopyWith<$Res> {
  _$FinancialRatiosCalculatorStateCopyWithImpl(this._self, this._then);

  final FinancialRatiosCalculatorState _self;
  final $Res Function(FinancialRatiosCalculatorState) _then;

/// Create a copy of FinancialRatiosCalculatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? draft = null,Object? derivedStatements = null,Object? incomeStatementIssues = null,Object? balanceSheetIssues = null,Object? analysisIssues = null,Object? selectedGroupId = null,Object? result = freezed,Object? validationKey = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as FinancialRatiosBuilderStep,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as FinancialStatementsDraft,derivedStatements: null == derivedStatements ? _self.derivedStatements : derivedStatements // ignore: cast_nullable_to_non_nullable
as DerivedStatements,incomeStatementIssues: null == incomeStatementIssues ? _self.incomeStatementIssues : incomeStatementIssues // ignore: cast_nullable_to_non_nullable
as List<FinancialStatementsValidationIssue>,balanceSheetIssues: null == balanceSheetIssues ? _self.balanceSheetIssues : balanceSheetIssues // ignore: cast_nullable_to_non_nullable
as List<FinancialStatementsValidationIssue>,analysisIssues: null == analysisIssues ? _self.analysisIssues : analysisIssues // ignore: cast_nullable_to_non_nullable
as List<FinancialStatementsValidationIssue>,selectedGroupId: null == selectedGroupId ? _self.selectedGroupId : selectedGroupId // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as FinancialRatiosResult?,validationKey: freezed == validationKey ? _self.validationKey : validationKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FinancialRatiosCalculatorState].
extension FinancialRatiosCalculatorStatePatterns on FinancialRatiosCalculatorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinancialRatiosCalculatorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinancialRatiosCalculatorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinancialRatiosCalculatorState value)  $default,){
final _that = this;
switch (_that) {
case _FinancialRatiosCalculatorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinancialRatiosCalculatorState value)?  $default,){
final _that = this;
switch (_that) {
case _FinancialRatiosCalculatorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FinancialRatiosBuilderStep currentStep,  FinancialStatementsDraft draft,  DerivedStatements derivedStatements,  List<FinancialStatementsValidationIssue> incomeStatementIssues,  List<FinancialStatementsValidationIssue> balanceSheetIssues,  List<FinancialStatementsValidationIssue> analysisIssues,  String selectedGroupId,  FinancialRatiosResult? result,  String? validationKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinancialRatiosCalculatorState() when $default != null:
return $default(_that.currentStep,_that.draft,_that.derivedStatements,_that.incomeStatementIssues,_that.balanceSheetIssues,_that.analysisIssues,_that.selectedGroupId,_that.result,_that.validationKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FinancialRatiosBuilderStep currentStep,  FinancialStatementsDraft draft,  DerivedStatements derivedStatements,  List<FinancialStatementsValidationIssue> incomeStatementIssues,  List<FinancialStatementsValidationIssue> balanceSheetIssues,  List<FinancialStatementsValidationIssue> analysisIssues,  String selectedGroupId,  FinancialRatiosResult? result,  String? validationKey)  $default,) {final _that = this;
switch (_that) {
case _FinancialRatiosCalculatorState():
return $default(_that.currentStep,_that.draft,_that.derivedStatements,_that.incomeStatementIssues,_that.balanceSheetIssues,_that.analysisIssues,_that.selectedGroupId,_that.result,_that.validationKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FinancialRatiosBuilderStep currentStep,  FinancialStatementsDraft draft,  DerivedStatements derivedStatements,  List<FinancialStatementsValidationIssue> incomeStatementIssues,  List<FinancialStatementsValidationIssue> balanceSheetIssues,  List<FinancialStatementsValidationIssue> analysisIssues,  String selectedGroupId,  FinancialRatiosResult? result,  String? validationKey)?  $default,) {final _that = this;
switch (_that) {
case _FinancialRatiosCalculatorState() when $default != null:
return $default(_that.currentStep,_that.draft,_that.derivedStatements,_that.incomeStatementIssues,_that.balanceSheetIssues,_that.analysisIssues,_that.selectedGroupId,_that.result,_that.validationKey);case _:
  return null;

}
}

}

/// @nodoc


class _FinancialRatiosCalculatorState implements FinancialRatiosCalculatorState {
  const _FinancialRatiosCalculatorState({this.currentStep = FinancialRatiosBuilderStep.incomeStatement, this.draft = const FinancialStatementsDraft(), this.derivedStatements = const DerivedStatements.zero(), final  List<FinancialStatementsValidationIssue> incomeStatementIssues = const <FinancialStatementsValidationIssue>[], final  List<FinancialStatementsValidationIssue> balanceSheetIssues = const <FinancialStatementsValidationIssue>[], final  List<FinancialStatementsValidationIssue> analysisIssues = const <FinancialStatementsValidationIssue>[], this.selectedGroupId = 'liquidity', this.result, this.validationKey}): _incomeStatementIssues = incomeStatementIssues,_balanceSheetIssues = balanceSheetIssues,_analysisIssues = analysisIssues;
  

@override@JsonKey() final  FinancialRatiosBuilderStep currentStep;
@override@JsonKey() final  FinancialStatementsDraft draft;
@override@JsonKey() final  DerivedStatements derivedStatements;
 final  List<FinancialStatementsValidationIssue> _incomeStatementIssues;
@override@JsonKey() List<FinancialStatementsValidationIssue> get incomeStatementIssues {
  if (_incomeStatementIssues is EqualUnmodifiableListView) return _incomeStatementIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomeStatementIssues);
}

 final  List<FinancialStatementsValidationIssue> _balanceSheetIssues;
@override@JsonKey() List<FinancialStatementsValidationIssue> get balanceSheetIssues {
  if (_balanceSheetIssues is EqualUnmodifiableListView) return _balanceSheetIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_balanceSheetIssues);
}

 final  List<FinancialStatementsValidationIssue> _analysisIssues;
@override@JsonKey() List<FinancialStatementsValidationIssue> get analysisIssues {
  if (_analysisIssues is EqualUnmodifiableListView) return _analysisIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_analysisIssues);
}

@override@JsonKey() final  String selectedGroupId;
@override final  FinancialRatiosResult? result;
@override final  String? validationKey;

/// Create a copy of FinancialRatiosCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinancialRatiosCalculatorStateCopyWith<_FinancialRatiosCalculatorState> get copyWith => __$FinancialRatiosCalculatorStateCopyWithImpl<_FinancialRatiosCalculatorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinancialRatiosCalculatorState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.derivedStatements, derivedStatements) || other.derivedStatements == derivedStatements)&&const DeepCollectionEquality().equals(other._incomeStatementIssues, _incomeStatementIssues)&&const DeepCollectionEquality().equals(other._balanceSheetIssues, _balanceSheetIssues)&&const DeepCollectionEquality().equals(other._analysisIssues, _analysisIssues)&&(identical(other.selectedGroupId, selectedGroupId) || other.selectedGroupId == selectedGroupId)&&(identical(other.result, result) || other.result == result)&&(identical(other.validationKey, validationKey) || other.validationKey == validationKey));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,draft,derivedStatements,const DeepCollectionEquality().hash(_incomeStatementIssues),const DeepCollectionEquality().hash(_balanceSheetIssues),const DeepCollectionEquality().hash(_analysisIssues),selectedGroupId,result,validationKey);

@override
String toString() {
  return 'FinancialRatiosCalculatorState(currentStep: $currentStep, draft: $draft, derivedStatements: $derivedStatements, incomeStatementIssues: $incomeStatementIssues, balanceSheetIssues: $balanceSheetIssues, analysisIssues: $analysisIssues, selectedGroupId: $selectedGroupId, result: $result, validationKey: $validationKey)';
}


}

/// @nodoc
abstract mixin class _$FinancialRatiosCalculatorStateCopyWith<$Res> implements $FinancialRatiosCalculatorStateCopyWith<$Res> {
  factory _$FinancialRatiosCalculatorStateCopyWith(_FinancialRatiosCalculatorState value, $Res Function(_FinancialRatiosCalculatorState) _then) = __$FinancialRatiosCalculatorStateCopyWithImpl;
@override @useResult
$Res call({
 FinancialRatiosBuilderStep currentStep, FinancialStatementsDraft draft, DerivedStatements derivedStatements, List<FinancialStatementsValidationIssue> incomeStatementIssues, List<FinancialStatementsValidationIssue> balanceSheetIssues, List<FinancialStatementsValidationIssue> analysisIssues, String selectedGroupId, FinancialRatiosResult? result, String? validationKey
});




}
/// @nodoc
class __$FinancialRatiosCalculatorStateCopyWithImpl<$Res>
    implements _$FinancialRatiosCalculatorStateCopyWith<$Res> {
  __$FinancialRatiosCalculatorStateCopyWithImpl(this._self, this._then);

  final _FinancialRatiosCalculatorState _self;
  final $Res Function(_FinancialRatiosCalculatorState) _then;

/// Create a copy of FinancialRatiosCalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? draft = null,Object? derivedStatements = null,Object? incomeStatementIssues = null,Object? balanceSheetIssues = null,Object? analysisIssues = null,Object? selectedGroupId = null,Object? result = freezed,Object? validationKey = freezed,}) {
  return _then(_FinancialRatiosCalculatorState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as FinancialRatiosBuilderStep,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as FinancialStatementsDraft,derivedStatements: null == derivedStatements ? _self.derivedStatements : derivedStatements // ignore: cast_nullable_to_non_nullable
as DerivedStatements,incomeStatementIssues: null == incomeStatementIssues ? _self._incomeStatementIssues : incomeStatementIssues // ignore: cast_nullable_to_non_nullable
as List<FinancialStatementsValidationIssue>,balanceSheetIssues: null == balanceSheetIssues ? _self._balanceSheetIssues : balanceSheetIssues // ignore: cast_nullable_to_non_nullable
as List<FinancialStatementsValidationIssue>,analysisIssues: null == analysisIssues ? _self._analysisIssues : analysisIssues // ignore: cast_nullable_to_non_nullable
as List<FinancialStatementsValidationIssue>,selectedGroupId: null == selectedGroupId ? _self.selectedGroupId : selectedGroupId // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as FinancialRatiosResult?,validationKey: freezed == validationKey ? _self.validationKey : validationKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
