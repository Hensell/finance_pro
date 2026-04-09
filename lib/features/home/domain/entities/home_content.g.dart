// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeContent _$HomeContentFromJson(Map<String, dynamic> json) => _HomeContent(
  eyebrow: json['eyebrow'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
  highlights:
      (json['highlights'] as List<dynamic>?)
          ?.map((e) => HomeHighlight.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HomeHighlight>[],
  modules:
      (json['modules'] as List<dynamic>?)
          ?.map((e) => HomeModuleSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HomeModuleSummary>[],
);

Map<String, dynamic> _$HomeContentToJson(_HomeContent instance) =>
    <String, dynamic>{
      'eyebrow': instance.eyebrow,
      'title': instance.title,
      'summary': instance.summary,
      'highlights': instance.highlights,
      'modules': instance.modules,
    };

_HomeHighlight _$HomeHighlightFromJson(Map<String, dynamic> json) =>
    _HomeHighlight(
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$HomeHighlightToJson(_HomeHighlight instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};

_HomeModuleSummary _$HomeModuleSummaryFromJson(Map<String, dynamic> json) =>
    _HomeModuleSummary(
      id: json['id'] as String,
      accent: json['accent'] as String,
      kicker: json['kicker'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$HomeModuleSummaryToJson(_HomeModuleSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accent': instance.accent,
      'kicker': instance.kicker,
      'title': instance.title,
      'summary': instance.summary,
    };
