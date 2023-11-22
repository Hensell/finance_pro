import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ProfatibilityRatioGa extends StatelessWidget {
  const ProfatibilityRatioGa({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Ganancias por acción',
      definition:
          'En general, las ganancias por acción (GPA) de la empresa son importantes para los accionistas actuales o futuros, y para la administración.',
      equation: Math.tex(
        r'\text{GPA} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Numero de acciones comunes en circulación}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'La GPA de Bartlett Company de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$221,000}{\$76,262}= \$2.90',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
