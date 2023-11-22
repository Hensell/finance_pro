import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../widgets/sub_content_widget.dart';

class ActivityRatioRotac extends StatelessWidget {
  const ActivityRatioRotac({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Rotación de los activos totales',
      definition:
          'La rotación de los activos totales indica la eficiencia con la que la empresa utiliza sus activos para generar ventas. La rotación de activos totales se calcula de la siguiente forma:',
      equation: Math.tex(
        r'\text{Rotación de activos totales} =  \frac{\text{Ventas}} {\text{Total de activos}}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example:
          'El valor de la rotación de los activos totales de Bartlett Company en 2012 es:',
      exampleEquation: Math.tex(
        r' \cfrac{ \$3,074,000}{\$3,597,000}= 0.85',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
