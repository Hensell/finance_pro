import 'package:finance_pro/screens/calculator_option/laverage_calc_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';

class LeverageScreen extends StatelessWidget {
  const LeverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Apalancamiento'),
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
                  'El apalancamiento se refiere a los efectos que tienen los costos fijos sobre el rendimiento que ganan los accionistas. Por “costos fijos” queremos decir costos que no aumentan ni disminuyen con los cambios en las ventas de la compañía. Las empresas tienen que pagar estos costos fijos independientemente de que las condiciones del negocio sean buenas o malas. Estos costos fijos pueden ser operativos, como los derivados de la compra y la operación de la planta y el equipo, o financieros, como los costos fijos derivados de los pagos de deuda. Por lo general, el apalancamiento incrementa tanto los rendimientos como el riesgo. Una empresa con más apalancamiento gana mayores rendimientos, en promedio, que aquellas que tienen menos apalancamiento, pero los rendimientos de la empresa con mayor apalancamiento también son más volátiles.',
                  textAlign: TextAlign.justify,
                ),
              ),
              const Gap(40),
              const Text(
                'Tipos de Apalancamiento',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              const Gap(20),
              operativo(),
              const Divider(),
              const Gap(20),
              financiera()
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorAssets.fourth,
                shape: const RoundedRectangleBorder()),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LaverageCalcOptionScreen()));
            },
            icon: const Icon(
              Icons.calculate,
              color: ColorAssets.textBlack,
            ),
            label: const Text(
              'Calculadora',
              style: TextStyle(color: ColorAssets.textBlack),
            )));
  }

  Column financiera() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Apalancamiento financiero',
            subTitle:
                'El apalancamiento financiero se debe a la presencia de los costos financieros fijos que la empresa debe pagar.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\begin{cases} \\  \text{GAF al nivel base UAII} = \frac{\text{UAII}}{  \text{UAII} - I - (\text{DP} \times 1/(1 - T)) } \\\\ \text{donde:} \\ I = \text{Interes anual} \\ DP = \text{Dividendos de acciones preferentes} \\ T = \text{Impuestos} \\ UAII = \text{Utilidad antes de intereses e impuestos} \end{cases}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Si sustituimos UAII = \$10,000, I = \$2,000, DP = \$2,400, y la tasa impositiva (T =0.40):'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{GAF de UAII} = \frac{\$10,000}{\$10,000 - \$2,000 - (\$2,400 \times  (1/ 1 - 0.40))} = 2.5  ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column operativo() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Apalancamiento operativo',
            subTitle:
                'El apalancamiento operativo se debe a la existencia de costos fijos que la compañía debe pagar para operar.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\begin{cases} \\  \text{GAO al nivel base de ventas Q} = \frac{Q \times ( P - CV )}{Q \times (P - CV) - CF} \\\\ \text{donde:} \\ Q = \text{Ventas} \\ P = \text{Precio de venta} \\ CV = \text{Costo variable} \\ CF = \text{Costo fijo} \end{cases}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Con base en los datos de Cheryl’s Posters (precio de venta, P = \$10 por unidad; costo operativo variable, CV = \$5 por unidad; costo operativo fijo, CF = \$2,500, Q = 1,000):'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$1,000 \times (\$10 - \$5)}{\$1,000 \times (\$10 - \$5) - \$2,500}= \frac{\$5,000}{\$2,500} = 2',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
