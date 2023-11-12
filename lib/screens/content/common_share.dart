import 'package:finance_pro/screens/calculator_option/share_calc_option_screen.dart';
import 'package:finance_pro/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../utils/colors_assets.dart';

class CommonShare extends StatelessWidget {
  const CommonShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Acciones comunes'),
          backgroundColor: ColorAssets.first,
        ),
        bottomNavigationBar: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShareCalcOptionScreen()));
            },
            icon: const Icon(Icons.calculate),
            label: const Text('Calculadora')),
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
                  'Las acciones comunes, también conocidas como acciones ordinarias, representan la propiedad de una parte proporcional de una empresa. Cuando posees acciones comunes de una empresa, te conviertes en accionista y, por lo tanto, tienes derechos a una parte de los beneficios de la empresa y a participar en las decisiones importantes de la misma, como votar en asambleas de accionistas.',
                  textAlign: TextAlign.justify,
                ),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Los verdaderos dueños de las empresas son los accionistas comunes, los cuales a veces se denominan propietarios residuales porque reciben lo que queda (el residuo) después de satisfacer todos los demás derechos sobre el ingreso y los activos de la empresa. Tienen la certeza de algo: no pueden perder más de lo que invirtieron en la empresa. Como consecuencia de esta posición, por lo general incierta, los accionistas comunes esperan recibir una compensación consistente en dividendos adecuados y, en última instancia, en ganancias de capita',
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
              const Divider(),
              const Gap(40),
              crecimientoConstante(),
              const Divider(),
              const Gap(40),
              Column(
                children: [
                  const CustomTitle(
                      title: 'Modelo de crecimiento variable',
                      subTitle:
                          'Los modelos de crecimiento cero y constante para la valuación de acciones comunes no permiten ningún cambio en las tasas de crecimiento esperadas. Como las tasas de crecimiento futuras podrían aumentar o disminuir en respuesta a las condiciones variables del negocio, resulta útil considerar un modelo de crecimiento variable que permita un cambio en la tasa de crecimiento de los dividendos.'),
                  const CustomTitle(
                      title: 'Paso 1:',
                      subTitle:
                          'Calcule el valor de los dividendos Dt en efectivo al final de cada año durante el periodo de crecimiento inicial, de los años 1 al año N. Este paso requiere ajustar la mayoría de los dividendos recientes D0, usando la tasa de crecimiento inicial, g1, para calcular el importe de los dividendos de cada año. Por lo tanto, para los primeros N años.'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'\begin{cases} \\ D_t = {D_0 \times ( 1 - g_1 )^t} \\\\ \text{donde:} \\ D_t = \text{Precio de la accion en un periodo} \\ D_0 = \text{Dividendo por accion} \\ g_1 = \text{tasa de crecimiento inicial} \\ t = \text{periodo} \end{cases}',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const CustomTitle(
                      title: 'Paso 2:',
                      subTitle:
                          'Calcule el valor presente de los dividendos esperados durante el periodo de crecimiento inicial. Usando la notación presentada anteriormente, vemos que este valor es:'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'\begin{cases} \\ {\underset{t=1}{\sum^N}} = \frac{D_t}{(1 + k_s)^t} \\\\ \text{donde:} \\ D_t = \text{Precio de la accion en un periodo}  \\ k_s = \text{Rendimiento requerido} \\ t = \text{periodo} \\ N = \text{Cantidad de periodos}\end{cases}',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const CustomTitle(
                      title: 'Paso 3:',
                      subTitle:
                          'Calcule el valor de la acción al final del periodo de crecimiento inicial, PN = (DN + 1)/(ks + g2), el cual es el valor presente de todos los dividendos esperados a partir del año N + 1 al infinito, suponiendo una tasa de crecimiento constante de dividendos g2.'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'\begin{cases} \\ {1 \over (1 + k_s)^N} \times {D_{N+1} \over k_s - g_2} \\\\ \text{donde:} \\ D_N = \text{Precio de la accion en un periodo}  \\ k_s = \text{Rendimiento requerido} \\ t = \text{periodo} \\ N = \text{Cantidad de periodos} \\ g_2 = \text{tasa de crecimiento final}\end{cases}',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const CustomTitle(
                      title: 'Paso 4:',
                      subTitle:
                          'Sume los componentes de valor presente obtenidos en los pasos 2 y 3 para obtener el valor de las acciones, P0.'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r' \boxed{ {P_0 = \text{Valor presente de los dividendos en el periodo de crecimiento inicial}}+ \atop  \text{valor presente de las acciones al final del periodo de crecimiento inicial}}',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const CustomTitle(
                      title: 'Ejemplo',
                      subTitle:
                          'Victoria Robb está considerando la compra de acciones comunes de Warren Industries, un fabricante de lanchas en rápido crecimiento. Ella se entera de que el pago anual más reciente (2012) de dividendos fue de \$1.50 por acción. Victoria estima que estos dividendos se incrementarán a una tasa g1 del 10% anual durante los próximos tres años (2013, 2014 y 2015) debido al lanzamiento de una novedosa lancha. Al final de los tres años (fines de 2015), espera que la consolidación del producto de la empresa dé por resultado una disminución de la tasa de crecimiento del dividendo, g2, del 5% anual en el futuro inmediato. El rendimiento requerido, ks, por Victoria es del 15%. Para calcular el valor actual (finales de 2012) de las acciones comunes de Warren, P0 = P2012, Victoria aplica el procedimiento de cuatro pasos con estos datos.'),
                  const Text('Paso 1:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('t')),
                        DataColumn(label: Text('Año')),
                        DataColumn(label: Text('Do')),
                        DataColumn(label: Text('(1 + g1)^t')),
                        DataColumn(label: Text('Dt')),
                        DataColumn(label: Text('(1 + ks)^t')),
                        DataColumn(label: Text('Valor presente')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('2013')),
                          DataCell(Text('\$1.50')),
                          DataCell(Text('1.100')),
                          DataCell(Text('\$1.65')),
                          DataCell(Text('1.150')),
                          DataCell(Text('\$1.43')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('2')),
                          DataCell(Text('2014')),
                          DataCell(Text('\$1.50')),
                          DataCell(Text('1.210')),
                          DataCell(Text('\$1.82')),
                          DataCell(Text('1.323')),
                          DataCell(Text('\$1.37')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('3')),
                          DataCell(Text('2015')),
                          DataCell(Text('\$1.50')),
                          DataCell(Text('1.331')),
                          DataCell(Text('\$2.00')),
                          DataCell(Text('1.521')),
                          DataCell(Text('\$1.32')),
                        ]),
                      ],
                    ),
                  ),
                  const Text(
                    'Suma del valor presente: \$4.12',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const CustomTitle(
                      title: 'Paso 2:',
                      subTitle:
                          'El valor presente de los tres dividendos esperados durante el periodo de crecimiento inicial de 2013 a 2015 se calculó en las columnas de la tabla. La suma de los valores presentes de los tres dividendos es \$4.12.'),
                  const CustomTitle(
                      title: 'Paso 3:',
                      subTitle:
                          'El valor de las acciones al final del periodo de crecimiento inicial (N = 2015) se puede obtener calculando primero DN+1 = D2016:'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'D_{2016} = {D_{2015} \times ( 1 - 0.05)} = {\$2.00 \times 1.05} = \$2.10',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const Gap(20),
                  const Text(
                      'Usando D2016:  \$2.10, un rendimiento requerido del 15%, y una tasa de crecimiento del dividendo del 5%, el valor de las acciones al final de 2015 seobtiene realizando el siguiente cálculo:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Gap(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'P_{2015} = {D_{2016} \over ( k_s - g_2)} = {\$2.10 \over ( 0.15 - 0.05)} = \$21.0',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const Gap(20),
                  const Text(
                      'Por último, en el paso 3, el valor de la acción de \$21 al final de 2015 debe convertirse al valor presente (finales de 2012). Usando el 15% de rendimiento requerido, tenemos',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Gap(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'{P_{2015} \over ( 1 - k_s)^3} = {\$21 \over ( 1 - 0.15)^3} = \$13.81',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const CustomTitle(
                      title: 'Paso 4:',
                      subTitle:
                          'Sumando el valor presente de los flujos de dividendos iniciales (calculados en el paso 2) al valor presente de las acciones al final del periodo de crecimiento inicial (calculado en el paso 3), el valor actual (finales de 2012) de las acciones de Warren Industries es'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      r'{P_{2012} = \$4.12 + \$13.81 } = \$17.93',
                      mathStyle: MathStyle.display,
                      textStyle: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const Gap(20),
                ],
              )
            ],
          ),
        ));
  }

  Column crecimientoConstante() {
    return Column(
      children: [
        const CustomTitle(
            title: 'Modelo de crecimiento constante',
            subTitle:
                'El método más difundido para la valuación de dividendos es el modelo de crecimiento constante, el cual supone que los dividendos crecerán a una tasa constante, pero a una tasa menor que el rendimiento requerido.'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            r'\begin{cases} \\ P_0 = {D_1 \over k_s - g} \\\\ \text{donde:} \\ P_0 = \text{Precio actual de la accion} \\ D_1 = \text{Dividendo por accion} \\ k_s = \text{Rendimiento requerido de acciones comunes} \\ g = \text{Tasa de crecimiento}\end{cases}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const CustomTitle(
            title: 'Ejemplo',
            subTitle:
                'Observamos que la tasa anual de crecimiento histórico de los dividendos de Lamar Company es igual al 7%. La compañía estima que su dividendo D1, en 2013, será igual a \$1.50 (aproximadamente un 7% más que el último dividendo). El rendimiento requerido, ks, es del 15%.'),
        Math.tex(
          r'P_0 = {\$1.50 \over 0.15 - 0.07} = \$18.75',
          mathStyle: MathStyle.display,
          textStyle: const TextStyle(fontSize: 24),
        ),
      ],
    );
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
