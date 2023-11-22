import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class DebtRatioEnd extends StatelessWidget {
  const DebtRatioEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Índice de endeudamiento',
      definition:
          'El índice de endeudamiento mide la proporción de los activos totales que financian los acreedores de la empresa. Cuanto mayor es el índice, mayor es el monto del dinero de otras personas que se usa para generar utilidades. El índice se calcula de la siguiente manera:',
      equation: Math.tex(
        r'\text{Índice de endeudamiento} =  \frac{\text{Total de pasivos}}{\text{Total de activos}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'El índice de endeudamiento de Bartlett Company en 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$1,643,000}{\$3,597,000}= 0.457 = \%45.7',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
