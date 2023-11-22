import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ProfatibilityRatioUb extends StatelessWidget {
  const ProfatibilityRatioUb({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Margen de utilidad bruta',
      definition:
          'El margen de utilidad bruta mide el porcentaje que queda de cada dólar de ventas después de que la empresa pagó sus bienes.',
      equation: Math.tex(
        r'\text{Margen de utilidad bruta} =  \frac{\text{Utilidad Bruta}}{\text{Ventas}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'El margen de utilidad bruta de Bartlett Company de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$986,000}{\$3,074,000}= \%32.1',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
