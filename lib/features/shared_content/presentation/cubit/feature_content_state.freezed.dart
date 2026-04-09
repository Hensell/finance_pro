// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeatureContentState {

 AppLoadStatus get status; FeatureContent? get content; String? get errorMessage;
/// Create a copy of FeatureContentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureContentStateCopyWith<FeatureContentState> get copyWith => _$FeatureContentStateCopyWithImpl<FeatureContentState>(this as FeatureContentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureContentState&&(identical(other.status, status) || other.status == status)&&(identical(other.content, content) || other.content == content)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,content,errorMessage);

@override
String toString() {
  return 'FeatureContentState(status: $status, content: $content, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FeatureContentStateCopyWith<$Res>  {
  factory $FeatureContentStateCopyWith(FeatureContentState value, $Res Function(FeatureContentState) _then) = _$FeatureContentStateCopyWithImpl;
@useResult
$Res call({
 AppLoadStatus status, FeatureContent? content, String? errorMessage
});


$FeatureContentCopyWith<$Res>? get content;

}
/// @nodoc
class _$FeatureContentStateCopyWithImpl<$Res>
    implements $FeatureContentStateCopyWith<$Res> {
  _$FeatureContentStateCopyWithImpl(this._self, this._then);

  final FeatureContentState _self;
  final $Res Function(FeatureContentState) _then;

/// Create a copy of FeatureContentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? content = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppLoadStatus,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as FeatureContent?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FeatureContentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeatureContentCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $FeatureContentCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeatureContentState].
extension FeatureContentStatePatterns on FeatureContentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureContentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureContentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureContentState value)  $default,){
final _that = this;
switch (_that) {
case _FeatureContentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureContentState value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureContentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLoadStatus status,  FeatureContent? content,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureContentState() when $default != null:
return $default(_that.status,_that.content,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLoadStatus status,  FeatureContent? content,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FeatureContentState():
return $default(_that.status,_that.content,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLoadStatus status,  FeatureContent? content,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FeatureContentState() when $default != null:
return $default(_that.status,_that.content,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FeatureContentState implements FeatureContentState {
  const _FeatureContentState({this.status = AppLoadStatus.initial, this.content, this.errorMessage});
  

@override@JsonKey() final  AppLoadStatus status;
@override final  FeatureContent? content;
@override final  String? errorMessage;

/// Create a copy of FeatureContentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureContentStateCopyWith<_FeatureContentState> get copyWith => __$FeatureContentStateCopyWithImpl<_FeatureContentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureContentState&&(identical(other.status, status) || other.status == status)&&(identical(other.content, content) || other.content == content)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,content,errorMessage);

@override
String toString() {
  return 'FeatureContentState(status: $status, content: $content, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FeatureContentStateCopyWith<$Res> implements $FeatureContentStateCopyWith<$Res> {
  factory _$FeatureContentStateCopyWith(_FeatureContentState value, $Res Function(_FeatureContentState) _then) = __$FeatureContentStateCopyWithImpl;
@override @useResult
$Res call({
 AppLoadStatus status, FeatureContent? content, String? errorMessage
});


@override $FeatureContentCopyWith<$Res>? get content;

}
/// @nodoc
class __$FeatureContentStateCopyWithImpl<$Res>
    implements _$FeatureContentStateCopyWith<$Res> {
  __$FeatureContentStateCopyWithImpl(this._self, this._then);

  final _FeatureContentState _self;
  final $Res Function(_FeatureContentState) _then;

/// Create a copy of FeatureContentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? content = freezed,Object? errorMessage = freezed,}) {
  return _then(_FeatureContentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppLoadStatus,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as FeatureContent?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FeatureContentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeatureContentCopyWith<$Res>? get content {
    if (_self.content == null) {
    return null;
  }

  return $FeatureContentCopyWith<$Res>(_self.content!, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on
