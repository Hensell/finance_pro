import 'dart:math';

import '../functions/number_utils.dart';

class CommonShareModel {
  int t;
  double doValue;
  double g1Value;
  double g2Value;
  double ksValue;

//valores calculados abajo
  late List<double> g1Results;
  late List<double> dtResults;
  late List<double> ksResults;
  late List<double> presentValues;
  late double sumPresentValues;
  late double dtValue;
  late double ptValue;
  late double vpf;
  late double vp;
  CommonShareModel({
    required this.t,
    required this.doValue,
    required this.g1Value,
    required this.g2Value,
    required this.ksValue,
  }) {
    g1Results = List<double>.generate(
      t,
      (index) => NumberUtils.formatAndRound(
          pow((1 + g1Value / 100), index + 1).toDouble()),
    );
    dtResults = List<double>.generate(
        t, (index) => NumberUtils.formatAndRound(doValue * g1Results[index]));

    ksResults = List<double>.generate(
      t,
      (index) => NumberUtils.formatAndRound(
          pow(1 + ksValue / 100, index + 1).toDouble()),
    );

    presentValues = List<double>.generate(
        t,
        (index) =>
            NumberUtils.formatAndRound(dtResults[index] / ksResults[index]));
    sumPresentValues = NumberUtils.formatAndRound(
        presentValues.reduce((value, element) => value + element));
    dtValue =
        NumberUtils.formatAndRound(dtResults[t - 1] * (g2Value / 100 + 1));
    ptValue =
        NumberUtils.formatAndRound(dtValue / (ksValue / 100 - g2Value / 100));
    vpf = NumberUtils.formatAndRound(ptValue / pow(1 + ksValue / 100, t));
    vp = NumberUtils.formatAndRound(vpf + sumPresentValues);
  }
}
