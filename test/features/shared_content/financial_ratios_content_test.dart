import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'financial ratios content exposes builder steps and rich result metadata',
    () async {
      final String raw = await File(
        'assets/content/es/financial_ratios.json',
      ).readAsString();
      final FeatureContent content = FeatureContent.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );

      expect(content.topics, hasLength(5));
      expect(
        content.topics.any((TopicContent topic) => topic.id == 'dupont'),
        isTrue,
      );
      expect(content.calculator, isNotNull);
      expect(content.calculator!.steps, hasLength(3));
      expect(
        content.calculator!.sections.any(
          (CalculatorSectionContent section) =>
              section.stepId == 'income_statement' && section.summary != null,
        ),
        isTrue,
      );
      expect(
        content.calculator!.results.any(
          (ResultDescriptor descriptor) =>
              descriptor.group == 'dupont' &&
              descriptor.didacticRanges.isNotEmpty == false,
        ),
        isTrue,
      );
      expect(
        content.calculator!.formulas.any(
          (FormulaContent formula) => formula.stepIds.contains('balance_sheet'),
        ),
        isTrue,
      );
    },
  );
}
