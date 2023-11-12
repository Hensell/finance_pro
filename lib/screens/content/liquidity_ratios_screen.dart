import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';

class LiquidityRatiosScreen extends StatelessWidget {
  const LiquidityRatiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razón de liquidez'),
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
                'La liquidez de una empresa se mide por su capacidad para cumplir con sus obligaciones de corto plazo a medida que estas llegan a su vencimiento.',
                textAlign: TextAlign.justify,
              ),
            ),
            const Gap(40),
            const Text(
              'Tipos de liquidez',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const Divider(),
            const Gap(20),
            Column(
              children: [
                const CustomTitle(
                    title: 'Liquidez corriente',
                    subTitle:
                        'La liquidez corriente, una de las razones financieras citadas con mayor frecuencia, mide la capacidad de la empresa para cumplir con sus obligaciones de corto plazo.'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Math.tex(
                    r'\text{Liquidez corriente} =  \frac{\text{Activos corrientes}}{\text{Pasivos corrientes}} ',
                    mathStyle: MathStyle.display,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const Gap(20),
                const CustomTitle(
                    title: 'Ejemplo',
                    subTitle:
                        'La liquidez corriente de Bartlett Company en 2012 es de:'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Math.tex(
                    r' \frac{\$1,233,000}{\$620,000}  = 1.97',
                    mathStyle: MathStyle.display,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const Gap(20),
                const CustomTitle(
                    title: 'Prueba del ácido',
                    subTitle:
                        'La razón rápida (prueba del ácido) es similar a la liquidez corriente, con la excepción de que excluye el inventario, que es comúnmente el activo corriente menos líquido.'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Math.tex(
                    r'\text{Razón rápida} =  \frac{\text{Activos corrientes} - \text{Inventario}}{\text{Pasivos corrientes}} ',
                    mathStyle: MathStyle.display,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const Gap(20),
                const CustomTitle(
                    title: 'Ejemplo',
                    subTitle:
                        'La razón rápida de Bartlett Company en 2012 es de:'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Math.tex(
                    r' \frac{\$1,233,000 - \$289,000}{\$620,000}  = 1.51',
                    mathStyle: MathStyle.display,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
