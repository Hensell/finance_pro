import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../widgets/sub_content_widget.dart';

class MarketRatioPG extends StatelessWidget {
  const MarketRatioPG({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Relación precio / ganancias (P/G)',
      definition:
          'La relación precio/ganancias (P/G) se usa generalmente para evaluar la estimación que hacen los propietarios del valor de las acciones. La relación o razón P/G mide la cantidad que los inversionistas están dispuestos a pagar por cada dólar de las ganancias de una empresa. El nivel de esta razón indica el grado de confianza que los inversionistas tienen en el desempeño futuro de la empresa. Cuanto mayor sea la relación P/G, mayor será la confianza de los inversionistas. La relación P/G se calcula de la siguiente manera:',
      equation: Math.tex(
        r'\text{Relación P/G} =  \frac{\text{Precio de mercado por acción comun}}{\text{Ganancias por acción}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example:
          'Si las acciones comunes de Bartlett Company a finales de 2012 se vendían en \$32.25, usando una GPA de \$2.90, la relación P/G a finales de 2012 es:',
      exampleEquation: Math.tex(
        r'\frac{\$32.25}{\$2.90}= 0.457 = 11.1',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
