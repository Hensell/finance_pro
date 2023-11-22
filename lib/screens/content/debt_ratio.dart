import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../widgets/custom_title.dart';

class DebtRatio extends StatelessWidget {
  const DebtRatio({super.key});

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
              'La posición de endeudamiento de una empresa indica el monto del dinero de otras personas que se usa para generar utilidades. En general, un analista financiero se interesa más en las deudas a largo plazo porque estas comprometen a la empresa con un flujo de pagos contractuales a largo plazo. Cuanto mayor es la deuda de una empresa, mayor es el riesgo de que no cumpla con los pagos contractuales de sus pasivos. Debido a que los compromisos con los acreedores se deben cumplir antes de distribuir las ganancias entre los accionistas, tanto los accionistas actuales como los futuros deben prestar mucha atención a la capacidad de la empresa de saldar sus deudas',
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
          endeudamiento(),
          const Divider(),
          const Gap(20),
          interesFijo(),
          const Divider(),
          const Gap(20),
          pagosFijos()
        ],
      )),
    );
  }

  Column pagosFijos() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Índice de cobertura de pagos fijos',
            subTitle:
                'El índice de cobertura de pagos fijos mide la capacidad de la empresa para cumplir con todas sus obligaciones de pagos fijos, como los intereses y el principal de los préstamos, pagos de arrendamiento, y dividendos de acciones preferentes.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{índice de cobertura de pagos fijos} =  \frac{\text{UAII + pagos de arrendamiento}}{\text{Intereses + Pagos de arrendamiento}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'+ (\text{pagos del principal + Dividendos de acciones preferentes}) \times \text{1/(1 - T)} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Text(
            'donde T es la tasa impositiva corporativa aplicable al ingreso de la empresa.'),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Al aplicar la fórmula a los datos de 2012 de Bartlett Company se obtiene'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$418,000 + \$35,000}{\$93,000 + \$35,000 + \lbrace (\$71,000 + \$10,000) \times \lbrack 1(1 - 0.29)\rbrack \rbrace}= 1.9 ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column interesFijo() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Índice de endeudamiento',
            subTitle:
                'El índice de endeudamiento mide la proporción de los activos totales que financian los acreedores de la empresa. Cuanto mayor es el índice, mayor es el monto del dinero de otras personas que se usa para generar utilidades. El índice se calcula de la siguiente manera:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Razón de cargos de ínteres fijo} =  \frac{\text{UAII}}{\text{Intereses}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Aplicando esta razón a Bartlett Company se obtiene el siguiente valor para 2012:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$418,000}{\$93,000}= 4.5 ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Column endeudamiento() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Índice de endeudamiento',
            subTitle:
                'El índice de endeudamiento mide la proporción de los activos totales que financian los acreedores de la empresa. Cuanto mayor es el índice, mayor es el monto del dinero de otras personas que se usa para generar utilidades. El índice se calcula de la siguiente manera:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\text{Índice de endeudamiento} =  \frac{\text{Total de pasivos}}{\text{Total de activos}} ',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        const Gap(20),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'El índice de endeudamiento de Bartlett Company en 2012 es:'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\frac{\$1,643,000}{\$3,597,000}= 0.457 = \%45.7',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
