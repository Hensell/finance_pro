import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';
import '../calculator_option/share_calc_option_screen.dart';

class CommonShareConstant extends StatelessWidget {
  const CommonShareConstant({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Crecimiento constante',
      definition:
          'El método más difundido para la valuación de dividendos es el modelo de crecimiento constante, el cual supone que los dividendos crecerán a una tasa constante, pero a una tasa menor que el rendimiento requerido.',
      equation: Math.tex(
        r'\begin{cases} \\ P_0 = {D_1 \over k_s - g} \\\\ \text{donde:} \\ P_0 = \text{Precio actual de la accion} \\ D_1 = \text{Dividendo por accion} \\ k_s = \text{Rendimiento requerido de acciones comunes} \\ g = \text{Tasa de crecimiento}\end{cases}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      example:
          'Observamos que la tasa anual de crecimiento histórico de los dividendos de Lamar Company es igual al 7%. La compañía estima que su dividendo D1, en 2013, será igual a \$1.50 (aproximadamente un 7% más que el último dividendo). El rendimiento requerido, ks, es del 15%.',
      exampleEquation: Math.tex(
        r'P_0 = {\$1.50 \over 0.15 - 0.07} = \$18.75',
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
