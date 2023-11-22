import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ProfatibilityRatioUo extends StatelessWidget {
  const ProfatibilityRatioUo({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Margen de utilidad operativa',
      definition:
          'El margen de utilidad operativa mide el porcentaje que queda de cada dólar de ventas después de que se dedujeron todos los costos y gastos, excluyendo los intereses, impuestos y dividendos de acciones preferentes. Representa las “utilidades puras” ganadas por cada dólar de venta.',
      equation: Math.tex(
        r'\text{Margen de utilidad operativa} =  \frac{\text{Utilidad operativa}}{\text{Ventas}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example:
          'El margen de utilidad operativa de Bartlett Company de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$418,000}{\$3,074,000}= \%13.6',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
