import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_title.dart';
import '../calculator_option/share_calc_option_screen.dart';

class CommonShareVariable extends StatelessWidget {
  const CommonShareVariable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crecimiento variable'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Los modelos de crecimiento cero y constante para la valuación de acciones comunes no permiten ningún cambio en las tasas de crecimiento esperadas. Como las tasas de crecimiento futuras podrían aumentar o disminuir en respuesta a las condiciones variables del negocio, resulta útil considerar un modelo de crecimiento variable que permita un cambio en la tasa de crecimiento de los dividendos.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              const Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      ColorAssets.seventh.withOpacity(0.7),
                      ColorAssets.tenth.withOpacity(0.7)
                    ])),
                child: const Text(
                  'Ecuación',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
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
              const Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      ColorAssets.seventh.withOpacity(0.7),
                      ColorAssets.tenth.withOpacity(0.7)
                    ])),
                child: const Text(
                  'Ejemplo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Victoria Robb está considerando la compra de acciones comunes de Warren Industries, un fabricante de lanchas en rápido crecimiento. Ella se entera de que el pago anual más reciente (2012) de dividendos fue de \$1.50 por acción. Victoria estima que estos dividendos se incrementarán a una tasa g1 del 10% anual durante los próximos tres años (2013, 2014 y 2015) debido al lanzamiento de una novedosa lancha. Al final de los tres años (fines de 2015), espera que la consolidación del producto de la empresa dé por resultado una disminución de la tasa de crecimiento del dividendo, g2, del 5% anual en el futuro inmediato. El rendimiento requerido, ks, por Victoria es del 15%. Para calcular el valor actual (finales de 2012) de las acciones comunes de Warren, P0 = P2012, Victoria aplica el procedimiento de cuatro pasos con estos datos.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
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
          ),
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
                    builder: (context) => const ShareCalcOptionScreen()));
          },
          icon: const Icon(
            Icons.calculate,
            color: ColorAssets.textBlack,
          ),
          label: const Text(
            'Calculadora',
            style: TextStyle(color: ColorAssets.textBlack),
          )),
    );
  }
}
