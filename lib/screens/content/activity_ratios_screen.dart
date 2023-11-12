import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';

class ActivityRatiosScreen extends StatelessWidget {
  const ActivityRatiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razón de actividad'),
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
                'La razón de actividad o los índices de actividad miden la rapidez con la que diversas cuentas se convierten en ventas o efectivo, es decir, en entradas o salidas. ',
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
            rotacionInventario(),
            const Divider(),
            periodoCobro(),
            const Divider(),
            const Gap(20),
            periodoPago(),
            const Divider(),
            const Gap(20),
            rotacionActivos()
          ],
        ),
      ),
    );
  }

  Column rotacionActivos() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Rotación de los activos totales',
            subTitle:
                'La rotación de los activos totales indica la eficiencia con la que la empresa utiliza sus activos para generar ventas. La rotación de activos totales se calcula de la siguiente forma:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Rotación de activos totales} =  \frac{\text{Ventas}} {\text{Total de activos}}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'El valor de la rotación de los activos totales de Bartlett Company en 2012 es: '),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r' \cfrac{ \$3,074,000}{\$3,597,000}= 0.85',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
      ],
    );
  }

  Column periodoPago() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Periodo promedio de pago',
            subTitle:
                'El periodo promedio de pago, o antigüedad promedio de las cuentas por pagar, se calcula de la misma manera que el periodo promedio de cobro.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Periodo promedio de pago} =  \frac{\text{Cuentas por pagar}} {\text{Compras diarias promedio}}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Text('ó'),
        const Gap(15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Periodo promedio de pago} =  \frac{\text{Cuentas por pagar}} {\text{Compras anuales}/365}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Si suponemos que las compras de Bartlett Company correspondieron a: '),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r' \cfrac{ \$382,000}{\cfrac{ \$1,461,000}{365}}=95.4 \text{días}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column periodoCobro() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Periodo promedio de cobro',
            subTitle:
                'El periodo promedio de cobro, o antigüedad promedio de las cuentas por cobrar, es útil para evaluar las políticas de crédito y cobro.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Periodo promedio de cobro} =  \frac{\text{Cuentas por cobrar}} {\text{Ventas diarias promedio}}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Text('ó'),
        const Gap(15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Periodo promedio de cobro} =  \frac{\text{Cuentas por cobrar}} {\text{Ventas anuales}/365}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'El periodo promedio de cobro de Bartlett Company en 2012 es: '),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r' \cfrac{ \$503,000}{\cfrac{ \$3,074,000}{365}}=59.7 \text{días}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column rotacionInventario() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Rotación de inventario',
            subTitle:
                'La rotación de inventarios mide comúnmente la actividad, o liquidez, del inventario de una empresa. Se calcula de la siguiente manera:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Rotación de inventarios} =  \frac{\text{Costo de bienes vendidos}}{\text{Inventario}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Al aplicar la formula anterior a Bartlett Company en 2012 tenemos:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$2,088,000}{\$289,000}=7.2',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
