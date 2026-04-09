import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'lease content includes calculator and multiple teaching topics',
    () async {
      final String raw = await File(
        'assets/content/es/lease.json',
      ).readAsString();
      final FeatureContent content = FeatureContent.fromJson(
        json.decode(raw) as Map<String, dynamic>,
      );

      expect(content.topics, hasLength(greaterThan(2)));
      expect(content.calculator, isNotNull);
      expect(content.calculator!.sections, hasLength(2));
      expect(
        content.topics
            .expand((TopicContent topic) => topic.sections)
            .any((ContentSection section) => section.formulaLegend.isNotEmpty),
        isTrue,
      );
      expect(
        content.topics
            .expand((TopicContent topic) => topic.sections)
            .any((ContentSection section) => section.exampleTable != null),
        isTrue,
      );
    },
  );
}
