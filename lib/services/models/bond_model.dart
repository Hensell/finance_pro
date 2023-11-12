import 'dart:math';

class BondModel {
  double I;
  double n;
  double M;
  double kd;

//valores calculados abajo
  double sum = 0;
  late double bo;

  BondModel(
      {required this.I, required this.n, required this.M, required this.kd}) {
    for (int t = 1; t <= n; t++) {
      sum += 1 / pow(1 + kd / 100, t);
    }

    bo = I * sum + (M * (1 / pow(1 + kd / 100, n)));
  }
}
