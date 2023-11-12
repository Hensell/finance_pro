import 'package:finance_pro/screens/calculator_option/bond_calc_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';

class BondScreen extends StatefulWidget {
  const BondScreen({super.key});

  @override
  State<BondScreen> createState() => _BondScreenState();
}

class _BondScreenState extends State<BondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bonos'),
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
                'Los bonos son instrumentos de deuda a largo plazo que usan las empresas y los gobiernos para recaudar grandes sumas de dinero, generalmente de un grupo diverso de prestamistas. La mayoría de los bonos corporativos pagan intereses semestralmente (esto es, cada 6 meses) a una tasa cupón establecida, tienen vencimiento inicial de 10 a 30 años',
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
            const CustomTitle(
                title: 'Valuación basica',
                subTitle:
                    'El valor de un bono es el valor presente de los pagos que contractualmente está obligado a pagar su emisor, desde el momento actual hasta el vencimiento del bono.'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Math.tex(
                r'\begin{cases} \\ B_0 = I \times \begin{bmatrix} {\underset{t=1}{\sum^N}} \frac{1}{(1 + k_d)^t} \end{bmatrix} + M \times \begin{bmatrix}  \frac{1}{(1 + k_d)^n} \end{bmatrix} \\\\ \text{donde:} \\ B_0 = \text{Valor del bono en tiempo cero} \\ I = \text{Interes anual} \\ n = \text{numero de años al vencimiento} \\ M = \text{Valor a la par} \\ k_d = \text{Rendimiento requerido del bono}\end{cases}',
                mathStyle: MathStyle.display,
                textStyle: const TextStyle(fontSize: 24),
              ),
            ),
            const CustomTitle(
                title: 'Ejemplo',
                subTitle:
                    'Tim Sánchez desea determinar el valor actual de los bonos de Mills Company. Suponiendo que el interés sobre la emisión de bonos de Mills Company se paga anualmente y que el rendimiento requerido es igual a la tasa cupón del bono, I = \$100, kd = 10%, M \$1,000 y n = 10 años.'),
            Math.tex(
              r'B_0 = \$ 1,000',
              mathStyle: MathStyle.display,
              textStyle: const TextStyle(fontSize: 24),
            ),
          ],
        )),
        bottomNavigationBar: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BondCalcOptionScreen()));
            },
            icon: const Icon(Icons.calculate),
            label: const Text('Calculadora')));
  }
}
