import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../widgets/sub_content_widget.dart';

class ProfatibilityRatioAt extends StatelessWidget {
  const ProfatibilityRatioAt({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Rendimiento sobre los activos totales',
      definition:
          'El rendimiento sobre activos totales (RSA), también conocido como rendimiento sobre la inversión (RSI), mide la eficacia integral de la administración para generar utilidades con sus activos disponibles.',
      equation: Math.tex(
        r'\text{RSA} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Total de activos}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'La RSA de Bartlett Company de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$221,000}{\$3,597,000}= \%6.1',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
