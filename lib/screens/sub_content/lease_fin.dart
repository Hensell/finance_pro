import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class LeaseFin extends StatelessWidget {
  const LeaseFin({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Arrendamiento financiero',
      definition:
          'El arrendatario utiliza el activo con la intención de adquirir la propiedad al final del período de arrendamiento.',
      equation: Math.tex(
        r'\begin{cases} \\ \text{PMT} = \frac{PV \times r \times  (1 + r)^n}{(1 + r)^n - 1} \\\\ \text{donde:} \\ \text{PMT} = \text{Pago periodico mensual} \\ PV = \text{Valor presente} \\ r = \text{Tasa de interes} \\ n = \text{Es el número de pagos} \end{cases}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      example:
          'Supongamos que una empresa decide arrendar un equipo con un valor presente (PV) de \$20,000, una tasa de interés anual del 8%, y un plazo de arrendamiento de 2 años (24 meses).',
      exampleEquation: Math.tex(
        r'PMT = \frac{\$20,000 \times (\frac{0.08}{12}  ) \times  (1 + \frac{0.08}{12} )^{24}}{(1 + \frac{0.08}{12})^{24} - 1} = \$2741.75',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      onPressed: () {},
    );
  }
}
