import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';
import '../calculator_option/share_calc_option_screen.dart';

class CommonShareZero extends StatelessWidget {
  const CommonShareZero({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Crecimiento cero',
      definition:
          'El método más sencillo para la valuación de dividendos es el modelo de crecimiento cero, el cual supone un flujo constante de dividendos no crecientes.',
      equation: Math.tex(
        r'\begin{cases} \\ P_0 = {D_1 \over k_s} \\\\ \text{donde:} \\ P_0 = \text{Precio actual de la accion} \\ D_1 = \text{Dividendo por accion} \\ k_s = \text{Rendimiento requerido de acciones comunes} \end{cases}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      example:
          'Chuck Swimmer espera que el dividendo de Denham Company, un productor establecido de textiles, permanezca constante indefinidamente a \$3 por acción. Si el rendimiento requerido de sus acciones es del 15%,¿Cuanto es el valor de las acciones?.',
      exampleEquation: Math.tex(
        r'P_0 = {\$3 \over 0.15} = \$20',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ShareCalcOptionScreen()));
      },
    );
  }
}
