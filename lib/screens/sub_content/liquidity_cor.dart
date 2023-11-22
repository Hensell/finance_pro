import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class LiquidityCor extends StatelessWidget {
  const LiquidityCor({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Liquidez corriente',
      definition:
          'La liquidez corriente, una de las razones financieras citadas con mayor frecuencia, mide la capacidad de la empresa para cumplir con sus obligaciones de corto plazo.',
      equation: Math.tex(
        r'\text{Liquidez corriente} =  \frac{\text{Activos corrientes}}{\text{Pasivos corrientes}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'La liquidez corriente de Bartlett Company en 2012 es de:',
      exampleEquation: Math.tex(
        r' \frac{\$1,233,000}{\$620,000}  = 1.97',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
