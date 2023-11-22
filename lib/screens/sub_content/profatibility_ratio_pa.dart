import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ProfatibilityRatioPa extends StatelessWidget {
  const ProfatibilityRatioPa({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Rendimiento sobre el patrimonio',
      definition:
          'El rendimiento sobre el patrimonio (RSP) mide el rendimiento ganado sobre la inversión de los accionistas comunes en la empresa. Por lo general, cuanto más alto es este rendimiento, más ganan los propietarios.',
      equation: Math.tex(
        r'\text{RSP} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Capital en acciones comunes}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'La RSP de Bartlett Company de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$221,000}{\$1,754,000}= \%12.6',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
