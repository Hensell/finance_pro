// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureContent {

 String get id; String get accent; String get eyebrow; String get title; String get summary; List<String> get heroPoints; List<TopicContent> get topics; CalculatorDescriptor? get calculator;
/// Create a copy of FeatureContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureContentCopyWith<FeatureContent> get copyWith => _$FeatureContentCopyWithImpl<FeatureContent>(this as FeatureContent, _$identity);

  /// Serializes this FeatureContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureContent&&(identical(other.id, id) || other.id == id)&&(identical(other.accent, accent) || other.accent == accent)&&(identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.heroPoints, heroPoints)&&const DeepCollectionEquality().equals(other.topics, topics)&&(identical(other.calculator, calculator) || other.calculator == calculator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accent,eyebrow,title,summary,const DeepCollectionEquality().hash(heroPoints),const DeepCollectionEquality().hash(topics),calculator);

@override
String toString() {
  return 'FeatureContent(id: $id, accent: $accent, eyebrow: $eyebrow, title: $title, summary: $summary, heroPoints: $heroPoints, topics: $topics, calculator: $calculator)';
}


}

/// @nodoc
abstract mixin class $FeatureContentCopyWith<$Res>  {
  factory $FeatureContentCopyWith(FeatureContent value, $Res Function(FeatureContent) _then) = _$FeatureContentCopyWithImpl;
@useResult
$Res call({
 String id, String accent, String eyebrow, String title, String summary, List<String> heroPoints, List<TopicContent> topics, CalculatorDescriptor? calculator
});


$CalculatorDescriptorCopyWith<$Res>? get calculator;

}
/// @nodoc
class _$FeatureContentCopyWithImpl<$Res>
    implements $FeatureContentCopyWith<$Res> {
  _$FeatureContentCopyWithImpl(this._self, this._then);

  final FeatureContent _self;
  final $Res Function(FeatureContent) _then;

/// Create a copy of FeatureContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accent = null,Object? eyebrow = null,Object? title = null,Object? summary = null,Object? heroPoints = null,Object? topics = null,Object? calculator = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,eyebrow: null == eyebrow ? _self.eyebrow : eyebrow // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,heroPoints: null == heroPoints ? _self.heroPoints : heroPoints // ignore: cast_nullable_to_non_nullable
as List<String>,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicContent>,calculator: freezed == calculator ? _self.calculator : calculator // ignore: cast_nullable_to_non_nullable
as CalculatorDescriptor?,
  ));
}
/// Create a copy of FeatureContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculatorDescriptorCopyWith<$Res>? get calculator {
    if (_self.calculator == null) {
    return null;
  }

  return $CalculatorDescriptorCopyWith<$Res>(_self.calculator!, (value) {
    return _then(_self.copyWith(calculator: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeatureContent].
extension FeatureContentPatterns on FeatureContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureContent value)  $default,){
final _that = this;
switch (_that) {
case _FeatureContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureContent value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String accent,  String eyebrow,  String title,  String summary,  List<String> heroPoints,  List<TopicContent> topics,  CalculatorDescriptor? calculator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureContent() when $default != null:
return $default(_that.id,_that.accent,_that.eyebrow,_that.title,_that.summary,_that.heroPoints,_that.topics,_that.calculator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String accent,  String eyebrow,  String title,  String summary,  List<String> heroPoints,  List<TopicContent> topics,  CalculatorDescriptor? calculator)  $default,) {final _that = this;
switch (_that) {
case _FeatureContent():
return $default(_that.id,_that.accent,_that.eyebrow,_that.title,_that.summary,_that.heroPoints,_that.topics,_that.calculator);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String accent,  String eyebrow,  String title,  String summary,  List<String> heroPoints,  List<TopicContent> topics,  CalculatorDescriptor? calculator)?  $default,) {final _that = this;
switch (_that) {
case _FeatureContent() when $default != null:
return $default(_that.id,_that.accent,_that.eyebrow,_that.title,_that.summary,_that.heroPoints,_that.topics,_that.calculator);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeatureContent implements FeatureContent {
  const _FeatureContent({required this.id, required this.accent, required this.eyebrow, required this.title, required this.summary, final  List<String> heroPoints = const <String>[], final  List<TopicContent> topics = const <TopicContent>[], this.calculator}): _heroPoints = heroPoints,_topics = topics;
  factory _FeatureContent.fromJson(Map<String, dynamic> json) => _$FeatureContentFromJson(json);

@override final  String id;
@override final  String accent;
@override final  String eyebrow;
@override final  String title;
@override final  String summary;
 final  List<String> _heroPoints;
@override@JsonKey() List<String> get heroPoints {
  if (_heroPoints is EqualUnmodifiableListView) return _heroPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heroPoints);
}

 final  List<TopicContent> _topics;
@override@JsonKey() List<TopicContent> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}

@override final  CalculatorDescriptor? calculator;

/// Create a copy of FeatureContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureContentCopyWith<_FeatureContent> get copyWith => __$FeatureContentCopyWithImpl<_FeatureContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureContent&&(identical(other.id, id) || other.id == id)&&(identical(other.accent, accent) || other.accent == accent)&&(identical(other.eyebrow, eyebrow) || other.eyebrow == eyebrow)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._heroPoints, _heroPoints)&&const DeepCollectionEquality().equals(other._topics, _topics)&&(identical(other.calculator, calculator) || other.calculator == calculator));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accent,eyebrow,title,summary,const DeepCollectionEquality().hash(_heroPoints),const DeepCollectionEquality().hash(_topics),calculator);

@override
String toString() {
  return 'FeatureContent(id: $id, accent: $accent, eyebrow: $eyebrow, title: $title, summary: $summary, heroPoints: $heroPoints, topics: $topics, calculator: $calculator)';
}


}

/// @nodoc
abstract mixin class _$FeatureContentCopyWith<$Res> implements $FeatureContentCopyWith<$Res> {
  factory _$FeatureContentCopyWith(_FeatureContent value, $Res Function(_FeatureContent) _then) = __$FeatureContentCopyWithImpl;
@override @useResult
$Res call({
 String id, String accent, String eyebrow, String title, String summary, List<String> heroPoints, List<TopicContent> topics, CalculatorDescriptor? calculator
});


@override $CalculatorDescriptorCopyWith<$Res>? get calculator;

}
/// @nodoc
class __$FeatureContentCopyWithImpl<$Res>
    implements _$FeatureContentCopyWith<$Res> {
  __$FeatureContentCopyWithImpl(this._self, this._then);

  final _FeatureContent _self;
  final $Res Function(_FeatureContent) _then;

/// Create a copy of FeatureContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accent = null,Object? eyebrow = null,Object? title = null,Object? summary = null,Object? heroPoints = null,Object? topics = null,Object? calculator = freezed,}) {
  return _then(_FeatureContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,eyebrow: null == eyebrow ? _self.eyebrow : eyebrow // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,heroPoints: null == heroPoints ? _self._heroPoints : heroPoints // ignore: cast_nullable_to_non_nullable
as List<String>,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicContent>,calculator: freezed == calculator ? _self.calculator : calculator // ignore: cast_nullable_to_non_nullable
as CalculatorDescriptor?,
  ));
}

/// Create a copy of FeatureContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculatorDescriptorCopyWith<$Res>? get calculator {
    if (_self.calculator == null) {
    return null;
  }

  return $CalculatorDescriptorCopyWith<$Res>(_self.calculator!, (value) {
    return _then(_self.copyWith(calculator: value));
  });
}
}


/// @nodoc
mixin _$TopicContent {

 String get id; String get title; String get summary; List<ContentSection> get sections;
/// Create a copy of TopicContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicContentCopyWith<TopicContent> get copyWith => _$TopicContentCopyWithImpl<TopicContent>(this as TopicContent, _$identity);

  /// Serializes this TopicContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'TopicContent(id: $id, title: $title, summary: $summary, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $TopicContentCopyWith<$Res>  {
  factory $TopicContentCopyWith(TopicContent value, $Res Function(TopicContent) _then) = _$TopicContentCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, List<ContentSection> sections
});




}
/// @nodoc
class _$TopicContentCopyWithImpl<$Res>
    implements $TopicContentCopyWith<$Res> {
  _$TopicContentCopyWithImpl(this._self, this._then);

  final TopicContent _self;
  final $Res Function(TopicContent) _then;

/// Create a copy of TopicContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? sections = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<ContentSection>,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicContent].
extension TopicContentPatterns on TopicContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicContent value)  $default,){
final _that = this;
switch (_that) {
case _TopicContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicContent value)?  $default,){
final _that = this;
switch (_that) {
case _TopicContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  List<ContentSection> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicContent() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  List<ContentSection> sections)  $default,) {final _that = this;
switch (_that) {
case _TopicContent():
return $default(_that.id,_that.title,_that.summary,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  List<ContentSection> sections)?  $default,) {final _that = this;
switch (_that) {
case _TopicContent() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicContent implements TopicContent {
  const _TopicContent({required this.id, required this.title, required this.summary, final  List<ContentSection> sections = const <ContentSection>[]}): _sections = sections;
  factory _TopicContent.fromJson(Map<String, dynamic> json) => _$TopicContentFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;
 final  List<ContentSection> _sections;
@override@JsonKey() List<ContentSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of TopicContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicContentCopyWith<_TopicContent> get copyWith => __$TopicContentCopyWithImpl<_TopicContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'TopicContent(id: $id, title: $title, summary: $summary, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$TopicContentCopyWith<$Res> implements $TopicContentCopyWith<$Res> {
  factory _$TopicContentCopyWith(_TopicContent value, $Res Function(_TopicContent) _then) = __$TopicContentCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, List<ContentSection> sections
});




}
/// @nodoc
class __$TopicContentCopyWithImpl<$Res>
    implements _$TopicContentCopyWith<$Res> {
  __$TopicContentCopyWithImpl(this._self, this._then);

  final _TopicContent _self;
  final $Res Function(_TopicContent) _then;

/// Create a copy of TopicContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? sections = null,}) {
  return _then(_TopicContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<ContentSection>,
  ));
}


}


/// @nodoc
mixin _$ContentSection {

 String get id; String get title; String get body; List<String> get bullets; List<FormulaContent> get formulas; List<FormulaLegendItem> get formulaLegend; ExampleTable? get exampleTable;
/// Create a copy of ContentSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentSectionCopyWith<ContentSection> get copyWith => _$ContentSectionCopyWithImpl<ContentSection>(this as ContentSection, _$identity);

  /// Serializes this ContentSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.bullets, bullets)&&const DeepCollectionEquality().equals(other.formulas, formulas)&&const DeepCollectionEquality().equals(other.formulaLegend, formulaLegend)&&(identical(other.exampleTable, exampleTable) || other.exampleTable == exampleTable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,const DeepCollectionEquality().hash(bullets),const DeepCollectionEquality().hash(formulas),const DeepCollectionEquality().hash(formulaLegend),exampleTable);

@override
String toString() {
  return 'ContentSection(id: $id, title: $title, body: $body, bullets: $bullets, formulas: $formulas, formulaLegend: $formulaLegend, exampleTable: $exampleTable)';
}


}

/// @nodoc
abstract mixin class $ContentSectionCopyWith<$Res>  {
  factory $ContentSectionCopyWith(ContentSection value, $Res Function(ContentSection) _then) = _$ContentSectionCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, List<String> bullets, List<FormulaContent> formulas, List<FormulaLegendItem> formulaLegend, ExampleTable? exampleTable
});


$ExampleTableCopyWith<$Res>? get exampleTable;

}
/// @nodoc
class _$ContentSectionCopyWithImpl<$Res>
    implements $ContentSectionCopyWith<$Res> {
  _$ContentSectionCopyWithImpl(this._self, this._then);

  final ContentSection _self;
  final $Res Function(ContentSection) _then;

/// Create a copy of ContentSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? bullets = null,Object? formulas = null,Object? formulaLegend = null,Object? exampleTable = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,bullets: null == bullets ? _self.bullets : bullets // ignore: cast_nullable_to_non_nullable
as List<String>,formulas: null == formulas ? _self.formulas : formulas // ignore: cast_nullable_to_non_nullable
as List<FormulaContent>,formulaLegend: null == formulaLegend ? _self.formulaLegend : formulaLegend // ignore: cast_nullable_to_non_nullable
as List<FormulaLegendItem>,exampleTable: freezed == exampleTable ? _self.exampleTable : exampleTable // ignore: cast_nullable_to_non_nullable
as ExampleTable?,
  ));
}
/// Create a copy of ContentSection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleTableCopyWith<$Res>? get exampleTable {
    if (_self.exampleTable == null) {
    return null;
  }

  return $ExampleTableCopyWith<$Res>(_self.exampleTable!, (value) {
    return _then(_self.copyWith(exampleTable: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContentSection].
extension ContentSectionPatterns on ContentSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentSection value)  $default,){
final _that = this;
switch (_that) {
case _ContentSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentSection value)?  $default,){
final _that = this;
switch (_that) {
case _ContentSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  List<String> bullets,  List<FormulaContent> formulas,  List<FormulaLegendItem> formulaLegend,  ExampleTable? exampleTable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentSection() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.bullets,_that.formulas,_that.formulaLegend,_that.exampleTable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  List<String> bullets,  List<FormulaContent> formulas,  List<FormulaLegendItem> formulaLegend,  ExampleTable? exampleTable)  $default,) {final _that = this;
switch (_that) {
case _ContentSection():
return $default(_that.id,_that.title,_that.body,_that.bullets,_that.formulas,_that.formulaLegend,_that.exampleTable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  List<String> bullets,  List<FormulaContent> formulas,  List<FormulaLegendItem> formulaLegend,  ExampleTable? exampleTable)?  $default,) {final _that = this;
switch (_that) {
case _ContentSection() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.bullets,_that.formulas,_that.formulaLegend,_that.exampleTable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentSection implements ContentSection {
  const _ContentSection({required this.id, required this.title, required this.body, final  List<String> bullets = const <String>[], final  List<FormulaContent> formulas = const <FormulaContent>[], final  List<FormulaLegendItem> formulaLegend = const <FormulaLegendItem>[], this.exampleTable}): _bullets = bullets,_formulas = formulas,_formulaLegend = formulaLegend;
  factory _ContentSection.fromJson(Map<String, dynamic> json) => _$ContentSectionFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
 final  List<String> _bullets;
@override@JsonKey() List<String> get bullets {
  if (_bullets is EqualUnmodifiableListView) return _bullets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bullets);
}

 final  List<FormulaContent> _formulas;
@override@JsonKey() List<FormulaContent> get formulas {
  if (_formulas is EqualUnmodifiableListView) return _formulas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulas);
}

 final  List<FormulaLegendItem> _formulaLegend;
@override@JsonKey() List<FormulaLegendItem> get formulaLegend {
  if (_formulaLegend is EqualUnmodifiableListView) return _formulaLegend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulaLegend);
}

@override final  ExampleTable? exampleTable;

/// Create a copy of ContentSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentSectionCopyWith<_ContentSection> get copyWith => __$ContentSectionCopyWithImpl<_ContentSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._bullets, _bullets)&&const DeepCollectionEquality().equals(other._formulas, _formulas)&&const DeepCollectionEquality().equals(other._formulaLegend, _formulaLegend)&&(identical(other.exampleTable, exampleTable) || other.exampleTable == exampleTable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,const DeepCollectionEquality().hash(_bullets),const DeepCollectionEquality().hash(_formulas),const DeepCollectionEquality().hash(_formulaLegend),exampleTable);

@override
String toString() {
  return 'ContentSection(id: $id, title: $title, body: $body, bullets: $bullets, formulas: $formulas, formulaLegend: $formulaLegend, exampleTable: $exampleTable)';
}


}

/// @nodoc
abstract mixin class _$ContentSectionCopyWith<$Res> implements $ContentSectionCopyWith<$Res> {
  factory _$ContentSectionCopyWith(_ContentSection value, $Res Function(_ContentSection) _then) = __$ContentSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, List<String> bullets, List<FormulaContent> formulas, List<FormulaLegendItem> formulaLegend, ExampleTable? exampleTable
});


@override $ExampleTableCopyWith<$Res>? get exampleTable;

}
/// @nodoc
class __$ContentSectionCopyWithImpl<$Res>
    implements _$ContentSectionCopyWith<$Res> {
  __$ContentSectionCopyWithImpl(this._self, this._then);

  final _ContentSection _self;
  final $Res Function(_ContentSection) _then;

/// Create a copy of ContentSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? bullets = null,Object? formulas = null,Object? formulaLegend = null,Object? exampleTable = freezed,}) {
  return _then(_ContentSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,bullets: null == bullets ? _self._bullets : bullets // ignore: cast_nullable_to_non_nullable
as List<String>,formulas: null == formulas ? _self._formulas : formulas // ignore: cast_nullable_to_non_nullable
as List<FormulaContent>,formulaLegend: null == formulaLegend ? _self._formulaLegend : formulaLegend // ignore: cast_nullable_to_non_nullable
as List<FormulaLegendItem>,exampleTable: freezed == exampleTable ? _self.exampleTable : exampleTable // ignore: cast_nullable_to_non_nullable
as ExampleTable?,
  ));
}

/// Create a copy of ContentSection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleTableCopyWith<$Res>? get exampleTable {
    if (_self.exampleTable == null) {
    return null;
  }

  return $ExampleTableCopyWith<$Res>(_self.exampleTable!, (value) {
    return _then(_self.copyWith(exampleTable: value));
  });
}
}


/// @nodoc
mixin _$FormulaContent {

 String get label; String get tex; List<String> get stepIds; List<String> get groupIds;
/// Create a copy of FormulaContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaContentCopyWith<FormulaContent> get copyWith => _$FormulaContentCopyWithImpl<FormulaContent>(this as FormulaContent, _$identity);

  /// Serializes this FormulaContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaContent&&(identical(other.label, label) || other.label == label)&&(identical(other.tex, tex) || other.tex == tex)&&const DeepCollectionEquality().equals(other.stepIds, stepIds)&&const DeepCollectionEquality().equals(other.groupIds, groupIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,tex,const DeepCollectionEquality().hash(stepIds),const DeepCollectionEquality().hash(groupIds));

@override
String toString() {
  return 'FormulaContent(label: $label, tex: $tex, stepIds: $stepIds, groupIds: $groupIds)';
}


}

/// @nodoc
abstract mixin class $FormulaContentCopyWith<$Res>  {
  factory $FormulaContentCopyWith(FormulaContent value, $Res Function(FormulaContent) _then) = _$FormulaContentCopyWithImpl;
@useResult
$Res call({
 String label, String tex, List<String> stepIds, List<String> groupIds
});




}
/// @nodoc
class _$FormulaContentCopyWithImpl<$Res>
    implements $FormulaContentCopyWith<$Res> {
  _$FormulaContentCopyWithImpl(this._self, this._then);

  final FormulaContent _self;
  final $Res Function(FormulaContent) _then;

/// Create a copy of FormulaContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? tex = null,Object? stepIds = null,Object? groupIds = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,tex: null == tex ? _self.tex : tex // ignore: cast_nullable_to_non_nullable
as String,stepIds: null == stepIds ? _self.stepIds : stepIds // ignore: cast_nullable_to_non_nullable
as List<String>,groupIds: null == groupIds ? _self.groupIds : groupIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaContent].
extension FormulaContentPatterns on FormulaContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaContent value)  $default,){
final _that = this;
switch (_that) {
case _FormulaContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaContent value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String tex,  List<String> stepIds,  List<String> groupIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaContent() when $default != null:
return $default(_that.label,_that.tex,_that.stepIds,_that.groupIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String tex,  List<String> stepIds,  List<String> groupIds)  $default,) {final _that = this;
switch (_that) {
case _FormulaContent():
return $default(_that.label,_that.tex,_that.stepIds,_that.groupIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String tex,  List<String> stepIds,  List<String> groupIds)?  $default,) {final _that = this;
switch (_that) {
case _FormulaContent() when $default != null:
return $default(_that.label,_that.tex,_that.stepIds,_that.groupIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaContent implements FormulaContent {
  const _FormulaContent({required this.label, required this.tex, final  List<String> stepIds = const <String>[], final  List<String> groupIds = const <String>[]}): _stepIds = stepIds,_groupIds = groupIds;
  factory _FormulaContent.fromJson(Map<String, dynamic> json) => _$FormulaContentFromJson(json);

@override final  String label;
@override final  String tex;
 final  List<String> _stepIds;
@override@JsonKey() List<String> get stepIds {
  if (_stepIds is EqualUnmodifiableListView) return _stepIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stepIds);
}

 final  List<String> _groupIds;
@override@JsonKey() List<String> get groupIds {
  if (_groupIds is EqualUnmodifiableListView) return _groupIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupIds);
}


/// Create a copy of FormulaContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaContentCopyWith<_FormulaContent> get copyWith => __$FormulaContentCopyWithImpl<_FormulaContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaContent&&(identical(other.label, label) || other.label == label)&&(identical(other.tex, tex) || other.tex == tex)&&const DeepCollectionEquality().equals(other._stepIds, _stepIds)&&const DeepCollectionEquality().equals(other._groupIds, _groupIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,tex,const DeepCollectionEquality().hash(_stepIds),const DeepCollectionEquality().hash(_groupIds));

@override
String toString() {
  return 'FormulaContent(label: $label, tex: $tex, stepIds: $stepIds, groupIds: $groupIds)';
}


}

/// @nodoc
abstract mixin class _$FormulaContentCopyWith<$Res> implements $FormulaContentCopyWith<$Res> {
  factory _$FormulaContentCopyWith(_FormulaContent value, $Res Function(_FormulaContent) _then) = __$FormulaContentCopyWithImpl;
@override @useResult
$Res call({
 String label, String tex, List<String> stepIds, List<String> groupIds
});




}
/// @nodoc
class __$FormulaContentCopyWithImpl<$Res>
    implements _$FormulaContentCopyWith<$Res> {
  __$FormulaContentCopyWithImpl(this._self, this._then);

  final _FormulaContent _self;
  final $Res Function(_FormulaContent) _then;

/// Create a copy of FormulaContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? tex = null,Object? stepIds = null,Object? groupIds = null,}) {
  return _then(_FormulaContent(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,tex: null == tex ? _self.tex : tex // ignore: cast_nullable_to_non_nullable
as String,stepIds: null == stepIds ? _self._stepIds : stepIds // ignore: cast_nullable_to_non_nullable
as List<String>,groupIds: null == groupIds ? _self._groupIds : groupIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$FormulaLegendItem {

 String get symbol; String get meaning;
/// Create a copy of FormulaLegendItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaLegendItemCopyWith<FormulaLegendItem> get copyWith => _$FormulaLegendItemCopyWithImpl<FormulaLegendItem>(this as FormulaLegendItem, _$identity);

  /// Serializes this FormulaLegendItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaLegendItem&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,meaning);

@override
String toString() {
  return 'FormulaLegendItem(symbol: $symbol, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class $FormulaLegendItemCopyWith<$Res>  {
  factory $FormulaLegendItemCopyWith(FormulaLegendItem value, $Res Function(FormulaLegendItem) _then) = _$FormulaLegendItemCopyWithImpl;
@useResult
$Res call({
 String symbol, String meaning
});




}
/// @nodoc
class _$FormulaLegendItemCopyWithImpl<$Res>
    implements $FormulaLegendItemCopyWith<$Res> {
  _$FormulaLegendItemCopyWithImpl(this._self, this._then);

  final FormulaLegendItem _self;
  final $Res Function(FormulaLegendItem) _then;

/// Create a copy of FormulaLegendItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? meaning = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaLegendItem].
extension FormulaLegendItemPatterns on FormulaLegendItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaLegendItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaLegendItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaLegendItem value)  $default,){
final _that = this;
switch (_that) {
case _FormulaLegendItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaLegendItem value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaLegendItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String meaning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaLegendItem() when $default != null:
return $default(_that.symbol,_that.meaning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String meaning)  $default,) {final _that = this;
switch (_that) {
case _FormulaLegendItem():
return $default(_that.symbol,_that.meaning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String meaning)?  $default,) {final _that = this;
switch (_that) {
case _FormulaLegendItem() when $default != null:
return $default(_that.symbol,_that.meaning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaLegendItem implements FormulaLegendItem {
  const _FormulaLegendItem({required this.symbol, required this.meaning});
  factory _FormulaLegendItem.fromJson(Map<String, dynamic> json) => _$FormulaLegendItemFromJson(json);

@override final  String symbol;
@override final  String meaning;

/// Create a copy of FormulaLegendItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaLegendItemCopyWith<_FormulaLegendItem> get copyWith => __$FormulaLegendItemCopyWithImpl<_FormulaLegendItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaLegendItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaLegendItem&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,meaning);

@override
String toString() {
  return 'FormulaLegendItem(symbol: $symbol, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class _$FormulaLegendItemCopyWith<$Res> implements $FormulaLegendItemCopyWith<$Res> {
  factory _$FormulaLegendItemCopyWith(_FormulaLegendItem value, $Res Function(_FormulaLegendItem) _then) = __$FormulaLegendItemCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String meaning
});




}
/// @nodoc
class __$FormulaLegendItemCopyWithImpl<$Res>
    implements _$FormulaLegendItemCopyWith<$Res> {
  __$FormulaLegendItemCopyWithImpl(this._self, this._then);

  final _FormulaLegendItem _self;
  final $Res Function(_FormulaLegendItem) _then;

/// Create a copy of FormulaLegendItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? meaning = null,}) {
  return _then(_FormulaLegendItem(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ExampleTable {

 String get title; List<String> get columns; List<ExampleRow> get rows; String? get footnote;
/// Create a copy of ExampleTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleTableCopyWith<ExampleTable> get copyWith => _$ExampleTableCopyWithImpl<ExampleTable>(this as ExampleTable, _$identity);

  /// Serializes this ExampleTable to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleTable&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.columns, columns)&&const DeepCollectionEquality().equals(other.rows, rows)&&(identical(other.footnote, footnote) || other.footnote == footnote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(columns),const DeepCollectionEquality().hash(rows),footnote);

@override
String toString() {
  return 'ExampleTable(title: $title, columns: $columns, rows: $rows, footnote: $footnote)';
}


}

/// @nodoc
abstract mixin class $ExampleTableCopyWith<$Res>  {
  factory $ExampleTableCopyWith(ExampleTable value, $Res Function(ExampleTable) _then) = _$ExampleTableCopyWithImpl;
@useResult
$Res call({
 String title, List<String> columns, List<ExampleRow> rows, String? footnote
});




}
/// @nodoc
class _$ExampleTableCopyWithImpl<$Res>
    implements $ExampleTableCopyWith<$Res> {
  _$ExampleTableCopyWithImpl(this._self, this._then);

  final ExampleTable _self;
  final $Res Function(ExampleTable) _then;

/// Create a copy of ExampleTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? columns = null,Object? rows = null,Object? footnote = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as List<String>,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<ExampleRow>,footnote: freezed == footnote ? _self.footnote : footnote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleTable].
extension ExampleTablePatterns on ExampleTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleTable value)  $default,){
final _that = this;
switch (_that) {
case _ExampleTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleTable value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<String> columns,  List<ExampleRow> rows,  String? footnote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleTable() when $default != null:
return $default(_that.title,_that.columns,_that.rows,_that.footnote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<String> columns,  List<ExampleRow> rows,  String? footnote)  $default,) {final _that = this;
switch (_that) {
case _ExampleTable():
return $default(_that.title,_that.columns,_that.rows,_that.footnote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<String> columns,  List<ExampleRow> rows,  String? footnote)?  $default,) {final _that = this;
switch (_that) {
case _ExampleTable() when $default != null:
return $default(_that.title,_that.columns,_that.rows,_that.footnote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExampleTable implements ExampleTable {
  const _ExampleTable({required this.title, final  List<String> columns = const <String>[], final  List<ExampleRow> rows = const <ExampleRow>[], this.footnote}): _columns = columns,_rows = rows;
  factory _ExampleTable.fromJson(Map<String, dynamic> json) => _$ExampleTableFromJson(json);

@override final  String title;
 final  List<String> _columns;
@override@JsonKey() List<String> get columns {
  if (_columns is EqualUnmodifiableListView) return _columns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_columns);
}

 final  List<ExampleRow> _rows;
@override@JsonKey() List<ExampleRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

@override final  String? footnote;

/// Create a copy of ExampleTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleTableCopyWith<_ExampleTable> get copyWith => __$ExampleTableCopyWithImpl<_ExampleTable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleTableToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleTable&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._columns, _columns)&&const DeepCollectionEquality().equals(other._rows, _rows)&&(identical(other.footnote, footnote) || other.footnote == footnote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_columns),const DeepCollectionEquality().hash(_rows),footnote);

@override
String toString() {
  return 'ExampleTable(title: $title, columns: $columns, rows: $rows, footnote: $footnote)';
}


}

/// @nodoc
abstract mixin class _$ExampleTableCopyWith<$Res> implements $ExampleTableCopyWith<$Res> {
  factory _$ExampleTableCopyWith(_ExampleTable value, $Res Function(_ExampleTable) _then) = __$ExampleTableCopyWithImpl;
@override @useResult
$Res call({
 String title, List<String> columns, List<ExampleRow> rows, String? footnote
});




}
/// @nodoc
class __$ExampleTableCopyWithImpl<$Res>
    implements _$ExampleTableCopyWith<$Res> {
  __$ExampleTableCopyWithImpl(this._self, this._then);

  final _ExampleTable _self;
  final $Res Function(_ExampleTable) _then;

/// Create a copy of ExampleTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? columns = null,Object? rows = null,Object? footnote = freezed,}) {
  return _then(_ExampleTable(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,columns: null == columns ? _self._columns : columns // ignore: cast_nullable_to_non_nullable
as List<String>,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<ExampleRow>,footnote: freezed == footnote ? _self.footnote : footnote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ExampleRow {

 List<String> get cells;
/// Create a copy of ExampleRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleRowCopyWith<ExampleRow> get copyWith => _$ExampleRowCopyWithImpl<ExampleRow>(this as ExampleRow, _$identity);

  /// Serializes this ExampleRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleRow&&const DeepCollectionEquality().equals(other.cells, cells));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cells));

@override
String toString() {
  return 'ExampleRow(cells: $cells)';
}


}

/// @nodoc
abstract mixin class $ExampleRowCopyWith<$Res>  {
  factory $ExampleRowCopyWith(ExampleRow value, $Res Function(ExampleRow) _then) = _$ExampleRowCopyWithImpl;
@useResult
$Res call({
 List<String> cells
});




}
/// @nodoc
class _$ExampleRowCopyWithImpl<$Res>
    implements $ExampleRowCopyWith<$Res> {
  _$ExampleRowCopyWithImpl(this._self, this._then);

  final ExampleRow _self;
  final $Res Function(ExampleRow) _then;

/// Create a copy of ExampleRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cells = null,}) {
  return _then(_self.copyWith(
cells: null == cells ? _self.cells : cells // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleRow].
extension ExampleRowPatterns on ExampleRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleRow value)  $default,){
final _that = this;
switch (_that) {
case _ExampleRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleRow value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> cells)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleRow() when $default != null:
return $default(_that.cells);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> cells)  $default,) {final _that = this;
switch (_that) {
case _ExampleRow():
return $default(_that.cells);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> cells)?  $default,) {final _that = this;
switch (_that) {
case _ExampleRow() when $default != null:
return $default(_that.cells);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExampleRow implements ExampleRow {
  const _ExampleRow({final  List<String> cells = const <String>[]}): _cells = cells;
  factory _ExampleRow.fromJson(Map<String, dynamic> json) => _$ExampleRowFromJson(json);

 final  List<String> _cells;
@override@JsonKey() List<String> get cells {
  if (_cells is EqualUnmodifiableListView) return _cells;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cells);
}


/// Create a copy of ExampleRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleRowCopyWith<_ExampleRow> get copyWith => __$ExampleRowCopyWithImpl<_ExampleRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleRow&&const DeepCollectionEquality().equals(other._cells, _cells));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cells));

@override
String toString() {
  return 'ExampleRow(cells: $cells)';
}


}

/// @nodoc
abstract mixin class _$ExampleRowCopyWith<$Res> implements $ExampleRowCopyWith<$Res> {
  factory _$ExampleRowCopyWith(_ExampleRow value, $Res Function(_ExampleRow) _then) = __$ExampleRowCopyWithImpl;
@override @useResult
$Res call({
 List<String> cells
});




}
/// @nodoc
class __$ExampleRowCopyWithImpl<$Res>
    implements _$ExampleRowCopyWith<$Res> {
  __$ExampleRowCopyWithImpl(this._self, this._then);

  final _ExampleRow _self;
  final $Res Function(_ExampleRow) _then;

/// Create a copy of ExampleRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cells = null,}) {
  return _then(_ExampleRow(
cells: null == cells ? _self._cells : cells // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$CalculatorDescriptor {

 String get id; String get title; String get summary; String get submitLabel; String? get note; List<CalculatorStepContent> get steps; List<FormulaContent> get formulas; List<CalculatorModeContent> get modes; List<CalculatorSectionContent> get sections; List<ResultDescriptor> get results;
/// Create a copy of CalculatorDescriptor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorDescriptorCopyWith<CalculatorDescriptor> get copyWith => _$CalculatorDescriptorCopyWithImpl<CalculatorDescriptor>(this as CalculatorDescriptor, _$identity);

  /// Serializes this CalculatorDescriptor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorDescriptor&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.submitLabel, submitLabel) || other.submitLabel == submitLabel)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.formulas, formulas)&&const DeepCollectionEquality().equals(other.modes, modes)&&const DeepCollectionEquality().equals(other.sections, sections)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,submitLabel,note,const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(formulas),const DeepCollectionEquality().hash(modes),const DeepCollectionEquality().hash(sections),const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CalculatorDescriptor(id: $id, title: $title, summary: $summary, submitLabel: $submitLabel, note: $note, steps: $steps, formulas: $formulas, modes: $modes, sections: $sections, results: $results)';
}


}

/// @nodoc
abstract mixin class $CalculatorDescriptorCopyWith<$Res>  {
  factory $CalculatorDescriptorCopyWith(CalculatorDescriptor value, $Res Function(CalculatorDescriptor) _then) = _$CalculatorDescriptorCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, String submitLabel, String? note, List<CalculatorStepContent> steps, List<FormulaContent> formulas, List<CalculatorModeContent> modes, List<CalculatorSectionContent> sections, List<ResultDescriptor> results
});




}
/// @nodoc
class _$CalculatorDescriptorCopyWithImpl<$Res>
    implements $CalculatorDescriptorCopyWith<$Res> {
  _$CalculatorDescriptorCopyWithImpl(this._self, this._then);

  final CalculatorDescriptor _self;
  final $Res Function(CalculatorDescriptor) _then;

/// Create a copy of CalculatorDescriptor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? submitLabel = null,Object? note = freezed,Object? steps = null,Object? formulas = null,Object? modes = null,Object? sections = null,Object? results = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,submitLabel: null == submitLabel ? _self.submitLabel : submitLabel // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<CalculatorStepContent>,formulas: null == formulas ? _self.formulas : formulas // ignore: cast_nullable_to_non_nullable
as List<FormulaContent>,modes: null == modes ? _self.modes : modes // ignore: cast_nullable_to_non_nullable
as List<CalculatorModeContent>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<CalculatorSectionContent>,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ResultDescriptor>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorDescriptor].
extension CalculatorDescriptorPatterns on CalculatorDescriptor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatorDescriptor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatorDescriptor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatorDescriptor value)  $default,){
final _that = this;
switch (_that) {
case _CalculatorDescriptor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatorDescriptor value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatorDescriptor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String submitLabel,  String? note,  List<CalculatorStepContent> steps,  List<FormulaContent> formulas,  List<CalculatorModeContent> modes,  List<CalculatorSectionContent> sections,  List<ResultDescriptor> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatorDescriptor() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.submitLabel,_that.note,_that.steps,_that.formulas,_that.modes,_that.sections,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String submitLabel,  String? note,  List<CalculatorStepContent> steps,  List<FormulaContent> formulas,  List<CalculatorModeContent> modes,  List<CalculatorSectionContent> sections,  List<ResultDescriptor> results)  $default,) {final _that = this;
switch (_that) {
case _CalculatorDescriptor():
return $default(_that.id,_that.title,_that.summary,_that.submitLabel,_that.note,_that.steps,_that.formulas,_that.modes,_that.sections,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  String submitLabel,  String? note,  List<CalculatorStepContent> steps,  List<FormulaContent> formulas,  List<CalculatorModeContent> modes,  List<CalculatorSectionContent> sections,  List<ResultDescriptor> results)?  $default,) {final _that = this;
switch (_that) {
case _CalculatorDescriptor() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.submitLabel,_that.note,_that.steps,_that.formulas,_that.modes,_that.sections,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatorDescriptor implements CalculatorDescriptor {
  const _CalculatorDescriptor({required this.id, required this.title, required this.summary, required this.submitLabel, this.note, final  List<CalculatorStepContent> steps = const <CalculatorStepContent>[], final  List<FormulaContent> formulas = const <FormulaContent>[], final  List<CalculatorModeContent> modes = const <CalculatorModeContent>[], final  List<CalculatorSectionContent> sections = const <CalculatorSectionContent>[], final  List<ResultDescriptor> results = const <ResultDescriptor>[]}): _steps = steps,_formulas = formulas,_modes = modes,_sections = sections,_results = results;
  factory _CalculatorDescriptor.fromJson(Map<String, dynamic> json) => _$CalculatorDescriptorFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;
@override final  String submitLabel;
@override final  String? note;
 final  List<CalculatorStepContent> _steps;
@override@JsonKey() List<CalculatorStepContent> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

 final  List<FormulaContent> _formulas;
@override@JsonKey() List<FormulaContent> get formulas {
  if (_formulas is EqualUnmodifiableListView) return _formulas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulas);
}

 final  List<CalculatorModeContent> _modes;
@override@JsonKey() List<CalculatorModeContent> get modes {
  if (_modes is EqualUnmodifiableListView) return _modes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modes);
}

 final  List<CalculatorSectionContent> _sections;
@override@JsonKey() List<CalculatorSectionContent> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

 final  List<ResultDescriptor> _results;
@override@JsonKey() List<ResultDescriptor> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of CalculatorDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatorDescriptorCopyWith<_CalculatorDescriptor> get copyWith => __$CalculatorDescriptorCopyWithImpl<_CalculatorDescriptor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatorDescriptorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatorDescriptor&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.submitLabel, submitLabel) || other.submitLabel == submitLabel)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._formulas, _formulas)&&const DeepCollectionEquality().equals(other._modes, _modes)&&const DeepCollectionEquality().equals(other._sections, _sections)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,submitLabel,note,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_formulas),const DeepCollectionEquality().hash(_modes),const DeepCollectionEquality().hash(_sections),const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'CalculatorDescriptor(id: $id, title: $title, summary: $summary, submitLabel: $submitLabel, note: $note, steps: $steps, formulas: $formulas, modes: $modes, sections: $sections, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CalculatorDescriptorCopyWith<$Res> implements $CalculatorDescriptorCopyWith<$Res> {
  factory _$CalculatorDescriptorCopyWith(_CalculatorDescriptor value, $Res Function(_CalculatorDescriptor) _then) = __$CalculatorDescriptorCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, String submitLabel, String? note, List<CalculatorStepContent> steps, List<FormulaContent> formulas, List<CalculatorModeContent> modes, List<CalculatorSectionContent> sections, List<ResultDescriptor> results
});




}
/// @nodoc
class __$CalculatorDescriptorCopyWithImpl<$Res>
    implements _$CalculatorDescriptorCopyWith<$Res> {
  __$CalculatorDescriptorCopyWithImpl(this._self, this._then);

  final _CalculatorDescriptor _self;
  final $Res Function(_CalculatorDescriptor) _then;

/// Create a copy of CalculatorDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? submitLabel = null,Object? note = freezed,Object? steps = null,Object? formulas = null,Object? modes = null,Object? sections = null,Object? results = null,}) {
  return _then(_CalculatorDescriptor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,submitLabel: null == submitLabel ? _self.submitLabel : submitLabel // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<CalculatorStepContent>,formulas: null == formulas ? _self._formulas : formulas // ignore: cast_nullable_to_non_nullable
as List<FormulaContent>,modes: null == modes ? _self._modes : modes // ignore: cast_nullable_to_non_nullable
as List<CalculatorModeContent>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<CalculatorSectionContent>,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ResultDescriptor>,
  ));
}


}


/// @nodoc
mixin _$CalculatorModeContent {

 String get id; String get label; String get summary;
/// Create a copy of CalculatorModeContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorModeContentCopyWith<CalculatorModeContent> get copyWith => _$CalculatorModeContentCopyWithImpl<CalculatorModeContent>(this as CalculatorModeContent, _$identity);

  /// Serializes this CalculatorModeContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorModeContent&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,summary);

@override
String toString() {
  return 'CalculatorModeContent(id: $id, label: $label, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $CalculatorModeContentCopyWith<$Res>  {
  factory $CalculatorModeContentCopyWith(CalculatorModeContent value, $Res Function(CalculatorModeContent) _then) = _$CalculatorModeContentCopyWithImpl;
@useResult
$Res call({
 String id, String label, String summary
});




}
/// @nodoc
class _$CalculatorModeContentCopyWithImpl<$Res>
    implements $CalculatorModeContentCopyWith<$Res> {
  _$CalculatorModeContentCopyWithImpl(this._self, this._then);

  final CalculatorModeContent _self;
  final $Res Function(CalculatorModeContent) _then;

/// Create a copy of CalculatorModeContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? summary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorModeContent].
extension CalculatorModeContentPatterns on CalculatorModeContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatorModeContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatorModeContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatorModeContent value)  $default,){
final _that = this;
switch (_that) {
case _CalculatorModeContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatorModeContent value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatorModeContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatorModeContent() when $default != null:
return $default(_that.id,_that.label,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String summary)  $default,) {final _that = this;
switch (_that) {
case _CalculatorModeContent():
return $default(_that.id,_that.label,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String summary)?  $default,) {final _that = this;
switch (_that) {
case _CalculatorModeContent() when $default != null:
return $default(_that.id,_that.label,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatorModeContent implements CalculatorModeContent {
  const _CalculatorModeContent({required this.id, required this.label, required this.summary});
  factory _CalculatorModeContent.fromJson(Map<String, dynamic> json) => _$CalculatorModeContentFromJson(json);

@override final  String id;
@override final  String label;
@override final  String summary;

/// Create a copy of CalculatorModeContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatorModeContentCopyWith<_CalculatorModeContent> get copyWith => __$CalculatorModeContentCopyWithImpl<_CalculatorModeContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatorModeContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatorModeContent&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,summary);

@override
String toString() {
  return 'CalculatorModeContent(id: $id, label: $label, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$CalculatorModeContentCopyWith<$Res> implements $CalculatorModeContentCopyWith<$Res> {
  factory _$CalculatorModeContentCopyWith(_CalculatorModeContent value, $Res Function(_CalculatorModeContent) _then) = __$CalculatorModeContentCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String summary
});




}
/// @nodoc
class __$CalculatorModeContentCopyWithImpl<$Res>
    implements _$CalculatorModeContentCopyWith<$Res> {
  __$CalculatorModeContentCopyWithImpl(this._self, this._then);

  final _CalculatorModeContent _self;
  final $Res Function(_CalculatorModeContent) _then;

/// Create a copy of CalculatorModeContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? summary = null,}) {
  return _then(_CalculatorModeContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CalculatorStepContent {

 String get id; String get title; String get summary;
/// Create a copy of CalculatorStepContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorStepContentCopyWith<CalculatorStepContent> get copyWith => _$CalculatorStepContentCopyWithImpl<CalculatorStepContent>(this as CalculatorStepContent, _$identity);

  /// Serializes this CalculatorStepContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorStepContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary);

@override
String toString() {
  return 'CalculatorStepContent(id: $id, title: $title, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $CalculatorStepContentCopyWith<$Res>  {
  factory $CalculatorStepContentCopyWith(CalculatorStepContent value, $Res Function(CalculatorStepContent) _then) = _$CalculatorStepContentCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary
});




}
/// @nodoc
class _$CalculatorStepContentCopyWithImpl<$Res>
    implements $CalculatorStepContentCopyWith<$Res> {
  _$CalculatorStepContentCopyWithImpl(this._self, this._then);

  final CalculatorStepContent _self;
  final $Res Function(CalculatorStepContent) _then;

/// Create a copy of CalculatorStepContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorStepContent].
extension CalculatorStepContentPatterns on CalculatorStepContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatorStepContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatorStepContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatorStepContent value)  $default,){
final _that = this;
switch (_that) {
case _CalculatorStepContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatorStepContent value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatorStepContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatorStepContent() when $default != null:
return $default(_that.id,_that.title,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary)  $default,) {final _that = this;
switch (_that) {
case _CalculatorStepContent():
return $default(_that.id,_that.title,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary)?  $default,) {final _that = this;
switch (_that) {
case _CalculatorStepContent() when $default != null:
return $default(_that.id,_that.title,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatorStepContent implements CalculatorStepContent {
  const _CalculatorStepContent({required this.id, required this.title, required this.summary});
  factory _CalculatorStepContent.fromJson(Map<String, dynamic> json) => _$CalculatorStepContentFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;

/// Create a copy of CalculatorStepContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatorStepContentCopyWith<_CalculatorStepContent> get copyWith => __$CalculatorStepContentCopyWithImpl<_CalculatorStepContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatorStepContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatorStepContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary);

@override
String toString() {
  return 'CalculatorStepContent(id: $id, title: $title, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$CalculatorStepContentCopyWith<$Res> implements $CalculatorStepContentCopyWith<$Res> {
  factory _$CalculatorStepContentCopyWith(_CalculatorStepContent value, $Res Function(_CalculatorStepContent) _then) = __$CalculatorStepContentCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary
});




}
/// @nodoc
class __$CalculatorStepContentCopyWithImpl<$Res>
    implements _$CalculatorStepContentCopyWith<$Res> {
  __$CalculatorStepContentCopyWithImpl(this._self, this._then);

  final _CalculatorStepContent _self;
  final $Res Function(_CalculatorStepContent) _then;

/// Create a copy of CalculatorStepContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,}) {
  return _then(_CalculatorStepContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CalculatorSectionContent {

 String get id; String get title; String? get summary; String? get stepId; List<String> get modeIds; List<CalculatorFieldContent> get fields;
/// Create a copy of CalculatorSectionContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorSectionContentCopyWith<CalculatorSectionContent> get copyWith => _$CalculatorSectionContentCopyWithImpl<CalculatorSectionContent>(this as CalculatorSectionContent, _$identity);

  /// Serializes this CalculatorSectionContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorSectionContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.stepId, stepId) || other.stepId == stepId)&&const DeepCollectionEquality().equals(other.modeIds, modeIds)&&const DeepCollectionEquality().equals(other.fields, fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,stepId,const DeepCollectionEquality().hash(modeIds),const DeepCollectionEquality().hash(fields));

@override
String toString() {
  return 'CalculatorSectionContent(id: $id, title: $title, summary: $summary, stepId: $stepId, modeIds: $modeIds, fields: $fields)';
}


}

/// @nodoc
abstract mixin class $CalculatorSectionContentCopyWith<$Res>  {
  factory $CalculatorSectionContentCopyWith(CalculatorSectionContent value, $Res Function(CalculatorSectionContent) _then) = _$CalculatorSectionContentCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? summary, String? stepId, List<String> modeIds, List<CalculatorFieldContent> fields
});




}
/// @nodoc
class _$CalculatorSectionContentCopyWithImpl<$Res>
    implements $CalculatorSectionContentCopyWith<$Res> {
  _$CalculatorSectionContentCopyWithImpl(this._self, this._then);

  final CalculatorSectionContent _self;
  final $Res Function(CalculatorSectionContent) _then;

/// Create a copy of CalculatorSectionContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = freezed,Object? stepId = freezed,Object? modeIds = null,Object? fields = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,stepId: freezed == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String?,modeIds: null == modeIds ? _self.modeIds : modeIds // ignore: cast_nullable_to_non_nullable
as List<String>,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<CalculatorFieldContent>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorSectionContent].
extension CalculatorSectionContentPatterns on CalculatorSectionContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatorSectionContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatorSectionContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatorSectionContent value)  $default,){
final _that = this;
switch (_that) {
case _CalculatorSectionContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatorSectionContent value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatorSectionContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? summary,  String? stepId,  List<String> modeIds,  List<CalculatorFieldContent> fields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatorSectionContent() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.stepId,_that.modeIds,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? summary,  String? stepId,  List<String> modeIds,  List<CalculatorFieldContent> fields)  $default,) {final _that = this;
switch (_that) {
case _CalculatorSectionContent():
return $default(_that.id,_that.title,_that.summary,_that.stepId,_that.modeIds,_that.fields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? summary,  String? stepId,  List<String> modeIds,  List<CalculatorFieldContent> fields)?  $default,) {final _that = this;
switch (_that) {
case _CalculatorSectionContent() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.stepId,_that.modeIds,_that.fields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatorSectionContent implements CalculatorSectionContent {
  const _CalculatorSectionContent({required this.id, required this.title, this.summary, this.stepId, final  List<String> modeIds = const <String>[], final  List<CalculatorFieldContent> fields = const <CalculatorFieldContent>[]}): _modeIds = modeIds,_fields = fields;
  factory _CalculatorSectionContent.fromJson(Map<String, dynamic> json) => _$CalculatorSectionContentFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? summary;
@override final  String? stepId;
 final  List<String> _modeIds;
@override@JsonKey() List<String> get modeIds {
  if (_modeIds is EqualUnmodifiableListView) return _modeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modeIds);
}

 final  List<CalculatorFieldContent> _fields;
@override@JsonKey() List<CalculatorFieldContent> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}


/// Create a copy of CalculatorSectionContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatorSectionContentCopyWith<_CalculatorSectionContent> get copyWith => __$CalculatorSectionContentCopyWithImpl<_CalculatorSectionContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatorSectionContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatorSectionContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.stepId, stepId) || other.stepId == stepId)&&const DeepCollectionEquality().equals(other._modeIds, _modeIds)&&const DeepCollectionEquality().equals(other._fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,stepId,const DeepCollectionEquality().hash(_modeIds),const DeepCollectionEquality().hash(_fields));

@override
String toString() {
  return 'CalculatorSectionContent(id: $id, title: $title, summary: $summary, stepId: $stepId, modeIds: $modeIds, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$CalculatorSectionContentCopyWith<$Res> implements $CalculatorSectionContentCopyWith<$Res> {
  factory _$CalculatorSectionContentCopyWith(_CalculatorSectionContent value, $Res Function(_CalculatorSectionContent) _then) = __$CalculatorSectionContentCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? summary, String? stepId, List<String> modeIds, List<CalculatorFieldContent> fields
});




}
/// @nodoc
class __$CalculatorSectionContentCopyWithImpl<$Res>
    implements _$CalculatorSectionContentCopyWith<$Res> {
  __$CalculatorSectionContentCopyWithImpl(this._self, this._then);

  final _CalculatorSectionContent _self;
  final $Res Function(_CalculatorSectionContent) _then;

/// Create a copy of CalculatorSectionContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = freezed,Object? stepId = freezed,Object? modeIds = null,Object? fields = null,}) {
  return _then(_CalculatorSectionContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,stepId: freezed == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String?,modeIds: null == modeIds ? _self._modeIds : modeIds // ignore: cast_nullable_to_non_nullable
as List<String>,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<CalculatorFieldContent>,
  ));
}


}


/// @nodoc
mixin _$CalculatorFieldContent {

 String get id; String get label; String get hint; bool get acceptsDecimal; String? get suffix; String? get helperText;
/// Create a copy of CalculatorFieldContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorFieldContentCopyWith<CalculatorFieldContent> get copyWith => _$CalculatorFieldContentCopyWithImpl<CalculatorFieldContent>(this as CalculatorFieldContent, _$identity);

  /// Serializes this CalculatorFieldContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorFieldContent&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.acceptsDecimal, acceptsDecimal) || other.acceptsDecimal == acceptsDecimal)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.helperText, helperText) || other.helperText == helperText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,hint,acceptsDecimal,suffix,helperText);

@override
String toString() {
  return 'CalculatorFieldContent(id: $id, label: $label, hint: $hint, acceptsDecimal: $acceptsDecimal, suffix: $suffix, helperText: $helperText)';
}


}

/// @nodoc
abstract mixin class $CalculatorFieldContentCopyWith<$Res>  {
  factory $CalculatorFieldContentCopyWith(CalculatorFieldContent value, $Res Function(CalculatorFieldContent) _then) = _$CalculatorFieldContentCopyWithImpl;
@useResult
$Res call({
 String id, String label, String hint, bool acceptsDecimal, String? suffix, String? helperText
});




}
/// @nodoc
class _$CalculatorFieldContentCopyWithImpl<$Res>
    implements $CalculatorFieldContentCopyWith<$Res> {
  _$CalculatorFieldContentCopyWithImpl(this._self, this._then);

  final CalculatorFieldContent _self;
  final $Res Function(CalculatorFieldContent) _then;

/// Create a copy of CalculatorFieldContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? hint = null,Object? acceptsDecimal = null,Object? suffix = freezed,Object? helperText = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,acceptsDecimal: null == acceptsDecimal ? _self.acceptsDecimal : acceptsDecimal // ignore: cast_nullable_to_non_nullable
as bool,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,helperText: freezed == helperText ? _self.helperText : helperText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorFieldContent].
extension CalculatorFieldContentPatterns on CalculatorFieldContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatorFieldContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatorFieldContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatorFieldContent value)  $default,){
final _that = this;
switch (_that) {
case _CalculatorFieldContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatorFieldContent value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatorFieldContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String hint,  bool acceptsDecimal,  String? suffix,  String? helperText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatorFieldContent() when $default != null:
return $default(_that.id,_that.label,_that.hint,_that.acceptsDecimal,_that.suffix,_that.helperText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String hint,  bool acceptsDecimal,  String? suffix,  String? helperText)  $default,) {final _that = this;
switch (_that) {
case _CalculatorFieldContent():
return $default(_that.id,_that.label,_that.hint,_that.acceptsDecimal,_that.suffix,_that.helperText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String hint,  bool acceptsDecimal,  String? suffix,  String? helperText)?  $default,) {final _that = this;
switch (_that) {
case _CalculatorFieldContent() when $default != null:
return $default(_that.id,_that.label,_that.hint,_that.acceptsDecimal,_that.suffix,_that.helperText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatorFieldContent implements CalculatorFieldContent {
  const _CalculatorFieldContent({required this.id, required this.label, required this.hint, this.acceptsDecimal = true, this.suffix, this.helperText});
  factory _CalculatorFieldContent.fromJson(Map<String, dynamic> json) => _$CalculatorFieldContentFromJson(json);

@override final  String id;
@override final  String label;
@override final  String hint;
@override@JsonKey() final  bool acceptsDecimal;
@override final  String? suffix;
@override final  String? helperText;

/// Create a copy of CalculatorFieldContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatorFieldContentCopyWith<_CalculatorFieldContent> get copyWith => __$CalculatorFieldContentCopyWithImpl<_CalculatorFieldContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatorFieldContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatorFieldContent&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.acceptsDecimal, acceptsDecimal) || other.acceptsDecimal == acceptsDecimal)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.helperText, helperText) || other.helperText == helperText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,hint,acceptsDecimal,suffix,helperText);

@override
String toString() {
  return 'CalculatorFieldContent(id: $id, label: $label, hint: $hint, acceptsDecimal: $acceptsDecimal, suffix: $suffix, helperText: $helperText)';
}


}

/// @nodoc
abstract mixin class _$CalculatorFieldContentCopyWith<$Res> implements $CalculatorFieldContentCopyWith<$Res> {
  factory _$CalculatorFieldContentCopyWith(_CalculatorFieldContent value, $Res Function(_CalculatorFieldContent) _then) = __$CalculatorFieldContentCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String hint, bool acceptsDecimal, String? suffix, String? helperText
});




}
/// @nodoc
class __$CalculatorFieldContentCopyWithImpl<$Res>
    implements _$CalculatorFieldContentCopyWith<$Res> {
  __$CalculatorFieldContentCopyWithImpl(this._self, this._then);

  final _CalculatorFieldContent _self;
  final $Res Function(_CalculatorFieldContent) _then;

/// Create a copy of CalculatorFieldContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? hint = null,Object? acceptsDecimal = null,Object? suffix = freezed,Object? helperText = freezed,}) {
  return _then(_CalculatorFieldContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,acceptsDecimal: null == acceptsDecimal ? _self.acceptsDecimal : acceptsDecimal // ignore: cast_nullable_to_non_nullable
as bool,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,helperText: freezed == helperText ? _self.helperText : helperText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ResultDescriptor {

 String get id; String get label; String? get group; String? get formula; String? get summary; String? get format; List<String> get modeIds; List<DidacticRangeContent> get didacticRanges;
/// Create a copy of ResultDescriptor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultDescriptorCopyWith<ResultDescriptor> get copyWith => _$ResultDescriptorCopyWithImpl<ResultDescriptor>(this as ResultDescriptor, _$identity);

  /// Serializes this ResultDescriptor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultDescriptor&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.group, group) || other.group == group)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.format, format) || other.format == format)&&const DeepCollectionEquality().equals(other.modeIds, modeIds)&&const DeepCollectionEquality().equals(other.didacticRanges, didacticRanges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,group,formula,summary,format,const DeepCollectionEquality().hash(modeIds),const DeepCollectionEquality().hash(didacticRanges));

@override
String toString() {
  return 'ResultDescriptor(id: $id, label: $label, group: $group, formula: $formula, summary: $summary, format: $format, modeIds: $modeIds, didacticRanges: $didacticRanges)';
}


}

/// @nodoc
abstract mixin class $ResultDescriptorCopyWith<$Res>  {
  factory $ResultDescriptorCopyWith(ResultDescriptor value, $Res Function(ResultDescriptor) _then) = _$ResultDescriptorCopyWithImpl;
@useResult
$Res call({
 String id, String label, String? group, String? formula, String? summary, String? format, List<String> modeIds, List<DidacticRangeContent> didacticRanges
});




}
/// @nodoc
class _$ResultDescriptorCopyWithImpl<$Res>
    implements $ResultDescriptorCopyWith<$Res> {
  _$ResultDescriptorCopyWithImpl(this._self, this._then);

  final ResultDescriptor _self;
  final $Res Function(ResultDescriptor) _then;

/// Create a copy of ResultDescriptor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? group = freezed,Object? formula = freezed,Object? summary = freezed,Object? format = freezed,Object? modeIds = null,Object? didacticRanges = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,formula: freezed == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,modeIds: null == modeIds ? _self.modeIds : modeIds // ignore: cast_nullable_to_non_nullable
as List<String>,didacticRanges: null == didacticRanges ? _self.didacticRanges : didacticRanges // ignore: cast_nullable_to_non_nullable
as List<DidacticRangeContent>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultDescriptor].
extension ResultDescriptorPatterns on ResultDescriptor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultDescriptor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultDescriptor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultDescriptor value)  $default,){
final _that = this;
switch (_that) {
case _ResultDescriptor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultDescriptor value)?  $default,){
final _that = this;
switch (_that) {
case _ResultDescriptor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String? group,  String? formula,  String? summary,  String? format,  List<String> modeIds,  List<DidacticRangeContent> didacticRanges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultDescriptor() when $default != null:
return $default(_that.id,_that.label,_that.group,_that.formula,_that.summary,_that.format,_that.modeIds,_that.didacticRanges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String? group,  String? formula,  String? summary,  String? format,  List<String> modeIds,  List<DidacticRangeContent> didacticRanges)  $default,) {final _that = this;
switch (_that) {
case _ResultDescriptor():
return $default(_that.id,_that.label,_that.group,_that.formula,_that.summary,_that.format,_that.modeIds,_that.didacticRanges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String? group,  String? formula,  String? summary,  String? format,  List<String> modeIds,  List<DidacticRangeContent> didacticRanges)?  $default,) {final _that = this;
switch (_that) {
case _ResultDescriptor() when $default != null:
return $default(_that.id,_that.label,_that.group,_that.formula,_that.summary,_that.format,_that.modeIds,_that.didacticRanges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultDescriptor implements ResultDescriptor {
  const _ResultDescriptor({required this.id, required this.label, this.group, this.formula, this.summary, this.format, final  List<String> modeIds = const <String>[], final  List<DidacticRangeContent> didacticRanges = const <DidacticRangeContent>[]}): _modeIds = modeIds,_didacticRanges = didacticRanges;
  factory _ResultDescriptor.fromJson(Map<String, dynamic> json) => _$ResultDescriptorFromJson(json);

@override final  String id;
@override final  String label;
@override final  String? group;
@override final  String? formula;
@override final  String? summary;
@override final  String? format;
 final  List<String> _modeIds;
@override@JsonKey() List<String> get modeIds {
  if (_modeIds is EqualUnmodifiableListView) return _modeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modeIds);
}

 final  List<DidacticRangeContent> _didacticRanges;
@override@JsonKey() List<DidacticRangeContent> get didacticRanges {
  if (_didacticRanges is EqualUnmodifiableListView) return _didacticRanges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_didacticRanges);
}


/// Create a copy of ResultDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultDescriptorCopyWith<_ResultDescriptor> get copyWith => __$ResultDescriptorCopyWithImpl<_ResultDescriptor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultDescriptorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultDescriptor&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.group, group) || other.group == group)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.format, format) || other.format == format)&&const DeepCollectionEquality().equals(other._modeIds, _modeIds)&&const DeepCollectionEquality().equals(other._didacticRanges, _didacticRanges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,group,formula,summary,format,const DeepCollectionEquality().hash(_modeIds),const DeepCollectionEquality().hash(_didacticRanges));

@override
String toString() {
  return 'ResultDescriptor(id: $id, label: $label, group: $group, formula: $formula, summary: $summary, format: $format, modeIds: $modeIds, didacticRanges: $didacticRanges)';
}


}

/// @nodoc
abstract mixin class _$ResultDescriptorCopyWith<$Res> implements $ResultDescriptorCopyWith<$Res> {
  factory _$ResultDescriptorCopyWith(_ResultDescriptor value, $Res Function(_ResultDescriptor) _then) = __$ResultDescriptorCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String? group, String? formula, String? summary, String? format, List<String> modeIds, List<DidacticRangeContent> didacticRanges
});




}
/// @nodoc
class __$ResultDescriptorCopyWithImpl<$Res>
    implements _$ResultDescriptorCopyWith<$Res> {
  __$ResultDescriptorCopyWithImpl(this._self, this._then);

  final _ResultDescriptor _self;
  final $Res Function(_ResultDescriptor) _then;

/// Create a copy of ResultDescriptor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? group = freezed,Object? formula = freezed,Object? summary = freezed,Object? format = freezed,Object? modeIds = null,Object? didacticRanges = null,}) {
  return _then(_ResultDescriptor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,formula: freezed == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,modeIds: null == modeIds ? _self._modeIds : modeIds // ignore: cast_nullable_to_non_nullable
as List<String>,didacticRanges: null == didacticRanges ? _self._didacticRanges : didacticRanges // ignore: cast_nullable_to_non_nullable
as List<DidacticRangeContent>,
  ));
}


}


/// @nodoc
mixin _$DidacticRangeContent {

 String get label; String get summary; double? get min; double? get max;
/// Create a copy of DidacticRangeContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DidacticRangeContentCopyWith<DidacticRangeContent> get copyWith => _$DidacticRangeContentCopyWithImpl<DidacticRangeContent>(this as DidacticRangeContent, _$identity);

  /// Serializes this DidacticRangeContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DidacticRangeContent&&(identical(other.label, label) || other.label == label)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,summary,min,max);

@override
String toString() {
  return 'DidacticRangeContent(label: $label, summary: $summary, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class $DidacticRangeContentCopyWith<$Res>  {
  factory $DidacticRangeContentCopyWith(DidacticRangeContent value, $Res Function(DidacticRangeContent) _then) = _$DidacticRangeContentCopyWithImpl;
@useResult
$Res call({
 String label, String summary, double? min, double? max
});




}
/// @nodoc
class _$DidacticRangeContentCopyWithImpl<$Res>
    implements $DidacticRangeContentCopyWith<$Res> {
  _$DidacticRangeContentCopyWithImpl(this._self, this._then);

  final DidacticRangeContent _self;
  final $Res Function(DidacticRangeContent) _then;

/// Create a copy of DidacticRangeContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? summary = null,Object? min = freezed,Object? max = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DidacticRangeContent].
extension DidacticRangeContentPatterns on DidacticRangeContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DidacticRangeContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DidacticRangeContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DidacticRangeContent value)  $default,){
final _that = this;
switch (_that) {
case _DidacticRangeContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DidacticRangeContent value)?  $default,){
final _that = this;
switch (_that) {
case _DidacticRangeContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String summary,  double? min,  double? max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DidacticRangeContent() when $default != null:
return $default(_that.label,_that.summary,_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String summary,  double? min,  double? max)  $default,) {final _that = this;
switch (_that) {
case _DidacticRangeContent():
return $default(_that.label,_that.summary,_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String summary,  double? min,  double? max)?  $default,) {final _that = this;
switch (_that) {
case _DidacticRangeContent() when $default != null:
return $default(_that.label,_that.summary,_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DidacticRangeContent implements DidacticRangeContent {
  const _DidacticRangeContent({required this.label, required this.summary, this.min, this.max});
  factory _DidacticRangeContent.fromJson(Map<String, dynamic> json) => _$DidacticRangeContentFromJson(json);

@override final  String label;
@override final  String summary;
@override final  double? min;
@override final  double? max;

/// Create a copy of DidacticRangeContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DidacticRangeContentCopyWith<_DidacticRangeContent> get copyWith => __$DidacticRangeContentCopyWithImpl<_DidacticRangeContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DidacticRangeContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DidacticRangeContent&&(identical(other.label, label) || other.label == label)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,summary,min,max);

@override
String toString() {
  return 'DidacticRangeContent(label: $label, summary: $summary, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$DidacticRangeContentCopyWith<$Res> implements $DidacticRangeContentCopyWith<$Res> {
  factory _$DidacticRangeContentCopyWith(_DidacticRangeContent value, $Res Function(_DidacticRangeContent) _then) = __$DidacticRangeContentCopyWithImpl;
@override @useResult
$Res call({
 String label, String summary, double? min, double? max
});




}
/// @nodoc
class __$DidacticRangeContentCopyWithImpl<$Res>
    implements _$DidacticRangeContentCopyWith<$Res> {
  __$DidacticRangeContentCopyWithImpl(this._self, this._then);

  final _DidacticRangeContent _self;
  final $Res Function(_DidacticRangeContent) _then;

/// Create a copy of DidacticRangeContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? summary = null,Object? min = freezed,Object? max = freezed,}) {
  return _then(_DidacticRangeContent(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
