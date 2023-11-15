import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';

class LeaseScreen extends StatelessWidget {
  const LeaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrendamiento'),
        backgroundColor: ColorAssets.first,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Concepto',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Un arrendamiento es un contrato. Con base en éste, el propietario de un activo (el arrendador) da a otra parte (el arrendatario) el derecho exclusivo al uso del bien, en general, durante un periodo especificado, a cambio del pago de renta.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                Gap(40),
                Text(
                  'Métodos de evaluación',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Divider(),
                Gap(20),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  children: [
                    const CustomTitle(
                        title: 'Arrendamiento financiero',
                        subTitle:
                            'El arrendatario utiliza el activo con la intención de adquirir la propiedad al final del período de arrendamiento.'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Math.tex(
                        r'\begin{cases} \\ \text{PMT} = \frac{PV \times r \times  (1 + r)^n}{(1 + r)^n - 1} \\\\ \text{donde:} \\ \text{PMT} = \text{Pago periodico mensual} \\ PV = \text{Valor presente} \\ r = \text{Tasa de interes} \\ n = \text{Es el número de pagos} \end{cases}',
                        mathStyle: MathStyle.display,
                        textStyle: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const CustomTitle(
                        title: 'Ejemplo',
                        subTitle:
                            'Supongamos que una empresa decide arrendar un equipo con un valor presente (PV) de \$20,000, una tasa de interés anual del 8%, y un plazo de arrendamiento de 2 años (24 meses).'),
                    Math.tex(
                      r'PMT = \frac{\$20,000 \times (\frac{0.08}{12}  ) \times  (1 + \frac{0.08}{12} )^{24}}{(1 + \frac{0.08}{12})^{24} - 1} = \$2741.75',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
