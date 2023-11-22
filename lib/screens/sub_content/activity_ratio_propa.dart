import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ActivityRatioPropa extends StatelessWidget {
  const ActivityRatioPropa({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Periodo promedio de pago',
      definition:
          'El periodo promedio de pago, o antigüedad promedio de las cuentas por pagar, se calcula de la misma manera que el periodo promedio de cobro.',
      equation: Math.tex(
        r'\text{Periodo promedio de pago} =  \frac{\text{Cuentas por pagar}} {\text{Compras diarias promedio}}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example:
          'Si suponemos que las compras de Bartlett Company correspondieron a:',
      exampleEquation: Math.tex(
        r' \cfrac{ \$382,000}{\cfrac{ \$1,461,000}{365}}=95.4 \text{días}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
