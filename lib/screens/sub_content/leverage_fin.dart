import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';
import '../calculator_option/laverage_calc_option_screen.dart';

class LeverageFin extends StatelessWidget {
  const LeverageFin({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Apalancamiento financiero',
      definition:
          'El apalancamiento financiero se debe a la presencia de los costos financieros fijos que la empresa debe pagar.',
      equation: Math.tex(
        r'\begin{cases} \\  \text{GAF al nivel base UAII} = \frac{\text{UAII}}{  \text{UAII} - I - (\text{DP} \times 1/(1 - T)) } \\\\ \text{donde:} \\ I = \text{Interes anual} \\ DP = \text{Dividendos de acciones preferentes} \\ T = \text{Impuestos} \\ UAII = \text{Utilidad antes de intereses e impuestos} \end{cases}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      example:
          'Si sustituimos UAII = \$10,000, I = \$2,000, DP = \$2,400, y la tasa impositiva (T =0.40):',
      exampleEquation: Math.tex(
        r'\text{GAF de UAII} = \frac{\$10,000}{\$10,000 - \$2,000 - (\$2,400 \times  (1/ 1 - 0.40))} = 2.5  ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LaverageCalcOptionScreen()));
      },
    );
  }
}
