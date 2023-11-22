import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class MarketRatioMl extends SubContentWidget {
  MarketRatioMl({super.key})
      : super(
          appBarTitle: 'Relación Mercado / Libro (M/L)',
          definition:
              'La razón mercado/libro (M/L) permite hacer una evaluación de cómo los inversionistas ven el desempeño de la empresa. Relaciona el valor de mercado de las acciones de la empresa con su valor en libros (estrictamente contable).',
          equation: Math.tex(
            r'\text{Valor en los libros por acción comun} =  \frac{\text{Capital en acciones comunes}}{\text{Número de acciones comunes en circulación}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
          example:
              'sustituyendo los valores correspondientes para Bartlett Company incluidos en el balance general de 2012, obtenemos:',
          exampleEquation: Math.tex(
            r'\frac{\$1,754,000}{\$76,262}= \$23',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        );
}
