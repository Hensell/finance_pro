import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../widgets/custom_title.dart';

class ProfatibilityRatio extends StatelessWidget {
  const ProfatibilityRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razónes de endeudamiento'),
        centerTitle: true,
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
              'Existen muchas medidas de rentabilidad. En conjunto, estas medidas permiten a los analistas evaluar las utilidades de la empresa respecto a un nivel determinado de ventas, cierto nivel de activos o la inversión de los propietarios. Sin utilidades, una compañía no podría atraer capital externo.',
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
          utilidadBruta(),
          const Divider(),
          const Gap(20),
          utilidadOperativa(),
          const Divider(),
          const Gap(20),
          utilidadNeta(),
          const Divider(),
          const Gap(20),
          gananciasAccion(),
          const Divider(),
          const Gap(20),
          rsa(),
          const Divider(),
          const Gap(20),
          rsp(),
          const Gap(20),
        ],
      )),
    );
  }

  Column rsp() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Rendimiento sobre el patrimonio',
            subTitle:
                'El rendimiento sobre el patrimonio (RSP) mide el rendimiento ganado sobre la inversión de los accionistas comunes en la empresa. Por lo general, cuanto más alto es este rendimiento, más ganan los propietarios.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{RSP} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Capital en acciones comunes}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle: 'La RSP de Bartlett Company de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$221,000}{\$1,754,000}= \%12.6',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column rsa() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Rendimiento sobre los activos totales',
            subTitle:
                'El rendimiento sobre activos totales (RSA), también conocido como rendimiento sobre la inversión (RSI), mide la eficacia integral de la administración para generar utilidades con sus activos disponibles.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{RSA} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Total de activos}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle: 'La RSA de Bartlett Company de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$221,000}{\$3,597,000}= \%6.1',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column gananciasAccion() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Ganancias por acción',
            subTitle:
                'En general, las ganancias por acción (GPA) de la empresa son importantes para los accionistas actuales o futuros, y para la administración.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{GPA} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Numero de acciones comunes en circulación}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle: 'La GPA de Bartlett Company de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$221,000}{\$76,262}= \$2.90',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column utilidadNeta() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Margen de utilidad operativa',
            subTitle:
                'El margen de utilidad neta mide el porcentaje que queda de cada dólar de ventas después de que se dedujeron todos los costos y gastos, incluyendo intereses, impuestos y dividendos de acciones preferentes.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Margen de utilidad neta} =  \frac{\text{Ganancias disponibles para los accionistas comunes}}{\text{Ventas}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'El margen de utilidad neta de Bartlett Company de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$221,000}{\$3,074,000}= \%7.2',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column utilidadOperativa() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Margen de utilidad operativa',
            subTitle:
                'El margen de utilidad operativa mide el porcentaje que queda de cada dólar de ventas después de que se dedujeron todos los costos y gastos, excluyendo los intereses, impuestos y dividendos de acciones preferentes. Representa las “utilidades puras” ganadas por cada dólar de venta.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Margen de utilidad operativa} =  \frac{\text{Utilidad operativa}}{\text{Ventas}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'El margen de utilidad operativa de Bartlett Company de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$418,000}{\$3,074,000}= \%13.6',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column utilidadBruta() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Margen de utilidad bruta',
            subTitle:
                'El margen de utilidad bruta mide el porcentaje que queda de cada dólar de ventas después de que la empresa pagó sus bienes.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Margen de utilidad bruta} =  \frac{\text{Utilidad Bruta}}{\text{Ventas}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'El margen de utilidad bruta de Bartlett Company de 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$986,000}{\$3,074,000}= \%32.1',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
