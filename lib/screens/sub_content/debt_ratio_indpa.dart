import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class DebtRatioIndpa extends StatelessWidget {
  const DebtRatioIndpa({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Índice de cobertura de pagos fijos',
      definition:
          'El índice de cobertura de pagos fijos mide la capacidad de la empresa para cumplir con todas sus obligaciones de pagos fijos, como los intereses y el principal de los préstamos, pagos de arrendamiento, y dividendos de acciones preferentes.',
      equation: Column(
        children: [
          Math.tex(
            r'\text{índice de cobertura de pagos fijos} =  \frac{\text{UAII + pagos de arrendamiento}}{\text{Intereses + Pagos de arrendamiento}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
          Math.tex(
            r'+ (\text{pagos del principal + Dividendos de acciones preferentes}) \times \text{1/(1 - T)} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          )
        ],
      ),
      example:
          'Al aplicar la fórmula a los datos de 2012 de Bartlett Company se obtiene:',
      exampleEquation: Math.tex(
        r'\frac{\$418,000 + \$35,000}{\$93,000 + \$35,000 + \lbrace (\$71,000 + \$10,000) \times \lbrack 1(1 - 0.29)\rbrack \rbrace}= 1.9 ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
