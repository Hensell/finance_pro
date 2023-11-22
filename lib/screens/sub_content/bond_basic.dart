import 'package:finance_pro/screens/calculator_option/bond_calc_option_screen.dart';
import 'package:finance_pro/widgets/sub_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class BondBasic extends StatelessWidget {
  const BondBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Valuación basica',
      definition:
          'El valor de un bono es el valor presente de los pagos que contractualmente está obligado a pagar su emisor, desde el momento actual hasta el vencimiento del bono.',
      equation: Math.tex(
        r'\begin{cases} \\ B_0 = I \times \begin{bmatrix} {\underset{t=1}{\sum^N}} \frac{1}{(1 + k_d)^t} \end{bmatrix} + M \times \begin{bmatrix}  \frac{1}{(1 + k_d)^n} \end{bmatrix} \\\\ \text{donde:} \\ B_0 = \text{Valor del bono en tiempo cero} \\ I = \text{Interes anual} \\ n = \text{numero de años al vencimiento} \\ M = \text{Valor a la par} \\ k_d = \text{Rendimiento requerido del bono}\end{cases}',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      example:
          'Tim Sánchez desea determinar el valor actual de los bonos de Mills Company. Suponiendo que el interés sobre la emisión de bonos de Mills Company se paga anualmente y que el rendimiento requerido es igual a la tasa cupón del bono, I = \$100, kd = 10%, M \$1,000 y n = 10 años.',
      exampleEquation: Math.tex(
        r'B_0 = \$ 1,000',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 24),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const BondCalcOptionScreen()));
      },
    );
  }
}
