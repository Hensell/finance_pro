import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class DebtRatioIntfi extends StatelessWidget {
  const DebtRatioIntfi({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Razón de cargos de interés fijo',
      definition:
          'La razón de cargos de interés fijo, denominada en ocasiones razón de cobertura de intereses, mide la capacidad de la empresa para realizar pagos de intereses contractuales.',
      equation: Math.tex(
        r'\text{Razón de cargos de ínteres fijo} =  \frac{\text{UAII}}{\text{Intereses}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example:
          'El razón de cargos de interés fijo de Bartlett Company en 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$418,000}{\$93,000}= 4.5 ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
