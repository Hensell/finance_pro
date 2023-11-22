import 'package:finance_pro/screens/calculator_option/laverage_calc_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class LeverageOpt extends StatelessWidget {
  const LeverageOpt({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Apalancamiento operativo',
      definition:
          'El apalancamiento operativo se debe a la existencia de costos fijos que la compañía debe pagar para operar.',
      equation: Math.tex(
        r'\begin{cases} \\  \text{GAO al nivel base de ventas Q} = \frac{Q \times ( P - CV )}{Q \times (P - CV) - CF} \\\\ \text{donde:} \\ Q = \text{Ventas} \\ P = \text{Precio de venta} \\ CV = \text{Costo variable} \\ CF = \text{Costo fijo} \end{cases}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      example:
          'Con base en los datos de Cheryl’s Posters (precio de venta, P = \$10 por unidad; costo operativo variable, CV = \$5 por unidad; costo operativo fijo, CF = \$2,500, Q = 1,000):',
      exampleEquation: Math.tex(
        r'\frac{\$1,000 \times (\$10 - \$5)}{\$1,000 \times (\$10 - \$5) - \$2,500}= \frac{\$5,000}{\$2,500} = 2',
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
