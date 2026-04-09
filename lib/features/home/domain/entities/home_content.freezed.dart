// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeContent {

 String get eyebrow; String get title; String get summary; List<HomeHighlight> get highlights; List<HomeModuleSummary> get modules;
/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeContentCopyWith<HomeContent> get copyWith => _$HomeContentCopyWithImpl<HomeContent>(this as HomeContent, _$identity);

  /// Serializes this HomeContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeContent&&(identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.highlights, highlights)&&const DeepCollectionEquality().equals(other.modules, modules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eyebrow,title,summary,const DeepCollectionEquality().hash(highlights),const DeepCollectionEquality().hash(modules));

@override
String toString() {
  return 'HomeContent(eyebrow: $eyebrow, title: $title, summary: $summary, highlights: $highlights, modules: $modules)';
}


}

/// @nodoc
abstract mixin class $HomeContentCopyWith<$Res>  {
  factory $HomeContentCopyWith(HomeContent value, $Res Function(HomeContent) _then) = _$HomeContentCopyWithImpl;
@useResult
$Res call({
 String eyebrow, String title, String summary, List<HomeHighlight> highlights, List<HomeModuleSummary> modules
});




}
/// @nodoc
class _$HomeContentCopyWithImpl<$Res>
    implements $HomeContentCopyWith<$Res> {
  _$HomeContentCopyWithImpl(this._self, this._then);

  final HomeContent _self;
  final $Res Function(HomeContent) _then;

/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eyebrow = null,Object? title = null,Object? summary = null,Object? highlights = null,Object? modules = null,}) {
  return _then(_self.copyWith(
eyebrow: null == eyebrow ? _self.eyebrow : eyebrow // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,highlights: null == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<HomeHighlight>,modules: null == modules ? _self.modules : modules // ignore: cast_nullable_to_non_nullable
as List<HomeModuleSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeContent].
extension HomeContentPatterns on HomeContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeContent value)  $default,){
final _that = this;
switch (_that) {
case _HomeContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeContent value)?  $default,){
final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String eyebrow,  String title,  String summary,  List<HomeHighlight> highlights,  List<HomeModuleSummary> modules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
return $default(_that.eyebrow,_that.title,_that.summary,_that.highlights,_that.modules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String eyebrow,  String title,  String summary,  List<HomeHighlight> highlights,  List<HomeModuleSummary> modules)  $default,) {final _that = this;
switch (_that) {
case _HomeContent():
return $default(_that.eyebrow,_that.title,_that.summary,_that.highlights,_that.modules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String eyebrow,  String title,  String summary,  List<HomeHighlight> highlights,  List<HomeModuleSummary> modules)?  $default,) {final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
return $default(_that.eyebrow,_that.title,_that.summary,_that.highlights,_that.modules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeContent implements HomeContent {
  const _HomeContent({required this.eyebrow, required this.title, required this.summary, final  List<HomeHighlight> highlights = const <HomeHighlight>[], final  List<HomeModuleSummary> modules = const <HomeModuleSummary>[]}): _highlights = highlights,_modules = modules;
  factory _HomeContent.fromJson(Map<String, dynamic> json) => _$HomeContentFromJson(json);

@override final  String eyebrow;
@override final  String title;
@override final  String summary;
 final  List<HomeHighlight> _highlights;
@override@JsonKey() List<HomeHighlight> get highlights {
  if (_highlights is EqualUnmodifiableListView) return _highlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlights);
}

 final  List<HomeModuleSummary> _modules;
@override@JsonKey() List<HomeModuleSummary> get modules {
  if (_modules is EqualUnmodifiableListView) return _modules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modules);
}


/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeContentCopyWith<_HomeContent> get copyWith => __$HomeContentCopyWithImpl<_HomeContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeContent&&(identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._highlights, _highlights)&&const DeepCollectionEquality().equals(other._modules, _modules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eyebrow,title,summary,const DeepCollectionEquality().hash(_highlights),const DeepCollectionEquality().hash(_modules));

@override
String toString() {
  return 'HomeContent(eyebrow: $eyebrow, title: $title, summary: $summary, highlights: $highlights, modules: $modules)';
}


}

/// @nodoc
abstract mixin class _$HomeContentCopyWith<$Res> implements $HomeContentCopyWith<$Res> {
  factory _$HomeContentCopyWith(_HomeContent value, $Res Function(_HomeContent) _then) = __$HomeContentCopyWithImpl;
@override @useResult
$Res call({
 String eyebrow, String title, String summary, List<HomeHighlight> highlights, List<HomeModuleSummary> modules
});




}
/// @nodoc
class __$HomeContentCopyWithImpl<$Res>
    implements _$HomeContentCopyWith<$Res> {
  __$HomeContentCopyWithImpl(this._self, this._then);

  final _HomeContent _self;
  final $Res Function(_HomeContent) _then;

/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eyebrow = null,Object? title = null,Object? summary = null,Object? highlights = null,Object? modules = null,}) {
  return _then(_HomeContent(
eyebrow: null == eyebrow ? _self.eyebrow : eyebrow // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,highlights: null == highlights ? _self._highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<HomeHighlight>,modules: null == modules ? _self._modules : modules // ignore: cast_nullable_to_non_nullable
as List<HomeModuleSummary>,
  ));
}


}


/// @nodoc
mixin _$HomeHighlight {

 String get label; String get value;
/// Create a copy of HomeHighlight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeHighlightCopyWith<HomeHighlight> get copyWith => _$HomeHighlightCopyWithImpl<HomeHighlight>(this as HomeHighlight, _$identity);

  /// Serializes this HomeHighlight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeHighlight&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'HomeHighlight(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $HomeHighlightCopyWith<$Res>  {
  factory $HomeHighlightCopyWith(HomeHighlight value, $Res Function(HomeHighlight) _then) = _$HomeHighlightCopyWithImpl;
@useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class _$HomeHighlightCopyWithImpl<$Res>
    implements $HomeHighlightCopyWith<$Res> {
  _$HomeHighlightCopyWithImpl(this._self, this._then);

  final HomeHighlight _self;
  final $Res Function(HomeHighlight) _then;

/// Create a copy of HomeHighlight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeHighlight].
extension HomeHighlightPatterns on HomeHighlight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeHighlight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeHighlight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeHighlight value)  $default,){
final _that = this;
switch (_that) {
case _HomeHighlight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeHighlight value)?  $default,){
final _that = this;
switch (_that) {
case _HomeHighlight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeHighlight() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value)  $default,) {final _that = this;
switch (_that) {
case _HomeHighlight():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value)?  $default,) {final _that = this;
switch (_that) {
case _HomeHighlight() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeHighlight implements HomeHighlight {
  const _HomeHighlight({required this.label, required this.value});
  factory _HomeHighlight.fromJson(Map<String, dynamic> json) => _$HomeHighlightFromJson(json);

@override final  String label;
@override final  String value;

/// Create a copy of HomeHighlight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeHighlightCopyWith<_HomeHighlight> get copyWith => __$HomeHighlightCopyWithImpl<_HomeHighlight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeHighlightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeHighlight&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'HomeHighlight(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$HomeHighlightCopyWith<$Res> implements $HomeHighlightCopyWith<$Res> {
  factory _$HomeHighlightCopyWith(_HomeHighlight value, $Res Function(_HomeHighlight) _then) = __$HomeHighlightCopyWithImpl;
@override @useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class __$HomeHighlightCopyWithImpl<$Res>
    implements _$HomeHighlightCopyWith<$Res> {
  __$HomeHighlightCopyWithImpl(this._self, this._then);

  final _HomeHighlight _self;
  final $Res Function(_HomeHighlight) _then;

/// Create a copy of HomeHighlight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_HomeHighlight(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeModuleSummary {

 String get id; String get accent; String get kicker; String get title; String get summary;
/// Create a copy of HomeModuleSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeModuleSummaryCopyWith<HomeModuleSummary> get copyWith => _$HomeModuleSummaryCopyWithImpl<HomeModuleSummary>(this as HomeModuleSummary, _$identity);

  /// Serializes this HomeModuleSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeModuleSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.accent, accent) || other.accent == accent)&&(identical(other.kicker, kicker) || other.kicker == kicker)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accent,kicker,title,summary);

@override
String toString() {
  return 'HomeModuleSummary(id: $id, accent: $accent, kicker: $kicker, title: $title, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $HomeModuleSummaryCopyWith<$Res>  {
  factory $HomeModuleSummaryCopyWith(HomeModuleSummary value, $Res Function(HomeModuleSummary) _then) = _$HomeModuleSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String accent, String kicker, String title, String summary
});




}
/// @nodoc
class _$HomeModuleSummaryCopyWithImpl<$Res>
    implements $HomeModuleSummaryCopyWith<$Res> {
  _$HomeModuleSummaryCopyWithImpl(this._self, this._then);

  final HomeModuleSummary _self;
  final $Res Function(HomeModuleSummary) _then;

/// Create a copy of HomeModuleSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accent = null,Object? kicker = null,Object? title = null,Object? summary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,kicker: null == kicker ? _self.kicker : kicker // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeModuleSummary].
extension HomeModuleSummaryPatterns on HomeModuleSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeModuleSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeModuleSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeModuleSummary value)  $default,){
final _that = this;
switch (_that) {
case _HomeModuleSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeModuleSummary value)?  $default,){
final _that = this;
switch (_that) {
case _HomeModuleSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String accent,  String kicker,  String title,  String summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeModuleSummary() when $default != null:
return $default(_that.id,_that.accent,_that.kicker,_that.title,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String accent,  String kicker,  String title,  String summary)  $default,) {final _that = this;
switch (_that) {
case _HomeModuleSummary():
return $default(_that.id,_that.accent,_that.kicker,_that.title,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String accent,  String kicker,  String title,  String summary)?  $default,) {final _that = this;
switch (_that) {
case _HomeModuleSummary() when $default != null:
return $default(_that.id,_that.accent,_that.kicker,_that.title,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeModuleSummary implements HomeModuleSummary {
  const _HomeModuleSummary({required this.id, required this.accent, required this.kicker, required this.title, required this.summary});
  factory _HomeModuleSummary.fromJson(Map<String, dynamic> json) => _$HomeModuleSummaryFromJson(json);

@override final  String id;
@override final  String accent;
@override final  String kicker;
@override final  String title;
@override final  String summary;

/// Create a copy of HomeModuleSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeModuleSummaryCopyWith<_HomeModuleSummary> get copyWith => __$HomeModuleSummaryCopyWithImpl<_HomeModuleSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeModuleSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeModuleSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.accent, accent) || other.accent == accent)&&(identical(other.kicker, kicker) || other.kicker == kicker)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accent,kicker,title,summary);

@override
String toString() {
  return 'HomeModuleSummary(id: $id, accent: $accent, kicker: $kicker, title: $title, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$HomeModuleSummaryCopyWith<$Res> implements $HomeModuleSummaryCopyWith<$Res> {
  factory _$HomeModuleSummaryCopyWith(_HomeModuleSummary value, $Res Function(_HomeModuleSummary) _then) = __$HomeModuleSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String accent, String kicker, String title, String summary
});




}
/// @nodoc
class __$HomeModuleSummaryCopyWithImpl<$Res>
    implements _$HomeModuleSummaryCopyWith<$Res> {
  __$HomeModuleSummaryCopyWithImpl(this._self, this._then);

  final _HomeModuleSummary _self;
  final $Res Function(_HomeModuleSummary) _then;

/// Create a copy of HomeModuleSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accent = null,Object? kicker = null,Object? title = null,Object? summary = null,}) {
  return _then(_HomeModuleSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,kicker: null == kicker ? _self.kicker : kicker // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
