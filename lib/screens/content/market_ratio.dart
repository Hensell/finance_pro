import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';

class MarketRatio extends StatelessWidget {
  const MarketRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razónes de mercado'),
        backgroundColor: ColorAssets.first,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Concepto',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Las razones de mercado relacionan el valor de mercado de una empresa, medido por el precio de mercado de sus acciones, con ciertos valores contables. Estas razones dan una explicación muy clara sobre qué tan bien se desarrolla la empresa en cuanto al riesgo y rendimiento, según los inversionistas del mercado.',
                textAlign: TextAlign.justify,
              ),
            ),
            const Gap(40),
            const Text(
              'Tipos de índice',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const Divider(),
            const Gap(20),
            razonMercado(),
            const Divider(),
            const Gap(20),
            mercadoLibro(),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  Column mercadoLibro() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Relación Mercado / Libro (M/L)',
            subTitle:
                'La razón mercado/libro (M/L) permite hacer una evaluación de cómo los inversionistas ven el desempeño de la empresa. Relaciona el valor de mercado de las acciones de la empresa con su valor en libros (estrictamente contable).'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Valor en los libros por acción comun} =  \frac{\text{Capital en acciones comunes}}{\text{Número de acciones comunes en circulación}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'stituyendo los valores correspondientes para Bartlett Company incluidos en el balance general de 2012, obtenemos:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$1,754,000}{\$76,262}= \$23',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column razonMercado() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Relación precio / ganancias (P/G)',
            subTitle:
                'La relación precio/ganancias (P/G) se usa generalmente para evaluar la estimación que hacen los propietarios del valor de las acciones. La relación o razón P/G mide la cantidad que los inversionistas están dispuestos a pagar por cada dólar de las ganancias de una empresa. El nivel de esta razón indica el grado de confianza que los inversionistas tienen en el desempeño futuro de la empresa. Cuanto mayor sea la relación P/G, mayor será la confianza de los inversionistas. La relación P/G se calcula de la siguiente manera:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Relación P/G} =  \frac{\text{Precio de mercado por acción comun}}{\text{Ganancias por acción}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Si las acciones comunes de Bartlett Company a finales de 2012 se vendían en \$32.25, usando una GPA de \$2.90, la relación P/G a finales de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$32.25}{\$2.90}= 0.457 = 11.1',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
