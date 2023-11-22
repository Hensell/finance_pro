import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class LiquidityAci extends StatelessWidget {
  const LiquidityAci({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Prueba del ácido',
      definition:
          'La razón rápida (prueba del ácido) es similar a la liquidez corriente, con la excepción de que excluye el inventario, que es comúnmente el activo corriente menos líquido.',
      equation: Math.tex(
        r'\text{Razón rápida} =  \frac{\text{Activos corrientes} - \text{Inventario}}{\text{Pasivos corrientes}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example: 'La razón rápida de Bartlett Company en 2012 es de:',
      exampleEquation: Math.tex(
        r' \frac{\$1,233,000 - \$289,000}{\$620,000}  = 1.51',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
