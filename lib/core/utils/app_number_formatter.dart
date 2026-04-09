import 'package:intl/intl.dart';

class AppNumberFormatter {
  const AppNumberFormatter._();

  static String decimal(double value, {int digits = 2}) {
    final NumberFormat format = NumberFormat.decimalPattern()
      ..minimumFractionDigits = digits
      ..maximumFractionDigits = digits;
    return format.format(value);
  }

  static String compact(double value, {int digits = 2}) {
    final NumberFormat format = NumberFormat.compact()
      ..minimumFractionDigits = digits
      ..maximumFractionDigits = digits;
    return format.format(value);
  }
}
