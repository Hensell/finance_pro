import 'package:finance_pro/core/utils/input_parsers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('localized numeric input', () {
    test('accepts decimal comma and decimal point', () {
      expect(parsePositiveNumber('1,5'), 1.5);
      expect(parsePositiveNumber('1.5'), 1.5);
    });

    test('normalizes common grouped formats', () {
      expect(parsePositiveNumber('1.234,56'), 1234.56);
      expect(parsePositiveNumber('1,234.56'), 1234.56);
    });

    test('rejects non-finite values', () {
      expect(parseFiniteNumber('NaN'), isNull);
      expect(parseFiniteNumber('Infinity'), isNull);
      expect(parseFiniteNumber('-Infinity'), isNull);
    });

    test('keeps positive and non-negative contracts', () {
      expect(parsePositiveNumber('0'), isNull);
      expect(parseNonNegativeNumber('0'), 0);
      expect(parseNonNegativeNumber('-1'), isNull);
    });
  });
}
