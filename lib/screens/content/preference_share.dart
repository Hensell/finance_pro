import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';
import '../calculator_option/share_calc_option_screen.dart';

class PreferenceShare extends StatelessWidget {
  const PreferenceShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Acciones preferentes'),
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
                  'Las acciones preferentes son un tipo de valor mobiliario que combina características tanto de acciones comunes como de bonos. Los accionistas preferentes tienen prioridad sobre los accionistas comunes en términos de distribución de dividendos y liquidación de activos en caso de quiebra o liquidación de la empresa.',
                  textAlign: TextAlign.justify,
                ),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Como las acciones preferentes generalmente brindan a sus tenedores un dividendo anual fijo durante su supuesta vida infinita, se usa la valuación de crecimiento cero.',
                  textAlign: TextAlign.justify,
                ),
              ),
              const Gap(40),
              const Text(
                'Métodos de valuación',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              const Gap(20),
              crecimientoCero(),
              const Gap(20),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorAssets.fourth,
              shape: const RoundedRectangleBorder()),
          icon: const Icon(
            Icons.calculate,
            color: ColorAssets.textBlack,
          ),
          label: const Text(
            'Calculadora',
            style: TextStyle(color: ColorAssets.textBlack),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShareCalcOptionScreen()));
          },
        ));
  }

  Column crecimientoCero() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Modelo de crecimiento cero',
            subTitle:
                'El método más sencillo para la valuación de dividendos es el modelo de crecimiento cero, el cual supone un flujo constante de dividendos no crecientes.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\begin{cases} \\ P_0 = {D_1 \over k_s} \\\\ \text{donde:} \\ P_0 = \text{Precio actual de la accion} \\ D_1 = \text{Dividendo por accion} \\ k_s = \text{Rendimiento requerido de acciones comunes} \end{cases}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Chuck Swimmer espera que el dividendo de Denham Company, un productor establecido de textiles, permanezca constante indefinidamente a \$3 por acción. Si el rendimiento requerido de sus acciones es del 15%,¿Cuanto es el valor de las acciones?.'),
        Math.tex(
          r'P_0 = {\$3 \over 0.15} = \$20',
          mathStyle: MathStyle.display,
          textStyle: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
