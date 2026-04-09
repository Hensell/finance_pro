import 'dart:convert';
import 'dart:io';

import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Feature content JSON parses formulas and calculator metadata',
    () async {
      final String raw = await File(
        'assets/content/es/shares.json',
      ).readAsString();
      final FeatureContent content = FeatureContent.fromJson(
        json.decode(raw) as Map<String, dynamic>,
      );

      expect(content.topics, hasLength(greaterThan(1)));
      expect(content.calculator, isNotNull);
      expect(content.calculator!.modes, hasLength(4));
      expect(content.calculator!.note, isNotEmpty);
      expect(
        content.calculator!.sections.any(
          (section) =>
              section.id == 'zero_growth_base' &&
              section.modeIds.contains('zero_growth'),
        ),
        isTrue,
      );
      expect(
        content.calculator!.results.any(
          (result) =>
              result.id == 'terminalPrice' &&
              result.modeIds.contains('variable_growth'),
        ),
        isTrue,
      );
    },
  );
}
