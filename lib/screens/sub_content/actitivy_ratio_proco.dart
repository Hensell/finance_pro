import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ActivityRatioProco extends StatelessWidget {
  const ActivityRatioProco({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Periodo promedio de cobro',
      definition:
          'El periodo promedio de cobro, o antigüedad promedio de las cuentas por cobrar, es útil para evaluar las políticas de crédito y cobro.',
      equation: Math.tex(
        r'\text{Periodo promedio de cobro} =  \frac{\text{Cuentas por cobrar}} {\text{Ventas diarias promedio}}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'El periodo promedio de cobro de Bartlett Company en 2012 es:',
      exampleEquation: Math.tex(
        r' \cfrac{ \$503,000}{\cfrac{ \$3,074,000}{365}}=59.7 \text{días}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
