import 'package:intl/intl.dart';

class NumberUtils {
  static double formatAndRound(double number, [int decimals = 4]) {
    NumberFormat formatter = NumberFormat('0.${'0' * decimals}');
    return double.parse(formatter.format(number));
  }
}
