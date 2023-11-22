import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../widgets/sub_content_widget.dart';

class ProfatibilityRatioNe extends StatelessWidget {
  const ProfatibilityRatioNe({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Margen de utilidad neta',
      definition:
          'El margen de utilidad neta mide el porcentaje que queda de cada dólar de ventas después de que se dedujeron todos los costos y gastos, incluyendo intereses, impuestos y dividendos de acciones preferentes.',
      equation: Math.tex(
        r'\text{Margen de utilidad neta} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Ventas}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'El margen de utilidad neta de Bartlett Company de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$221,000}{\$3,074,000}= \%7.2',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
