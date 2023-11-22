import 'package:finance_pro/screens/sub_options/leverage_sub_option.dart';
import 'package:flutter/material.dart';
import '../../widgets/sub_option_widget.dart';

class LeverageScreen extends StatelessWidget {
  const LeverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SubOptionWidget(
      appBarTitle: 'Apalancamiento',
      definition:
          'El apalancamiento se refiere a los efectos que tienen los costos fijos sobre el rendimiento que ganan los accionistas. Por “costos fijos” queremos decir costos que no aumentan ni disminuyen con los cambios en las ventas de la compañía. Las empresas tienen que pagar estos costos fijos independientemente de que las condiciones del negocio sean buenas o malas. Estos costos fijos pueden ser operativos, como los derivados de la compra y la operación de la planta y el equipo, o financieros, como los costos fijos derivados de los pagos de deuda. Por lo general, el apalancamiento incrementa tanto los rendimientos como el riesgo. Una empresa con más apalancamiento gana mayores rendimientos, en promedio, que aquellas que tienen menos apalancamiento, pero los rendimientos de la empresa con mayor apalancamiento también son más volátiles.',
      buttonTitle: 'Tipos de apalacamiento',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LeverageSubOption()));
      },
    );
  }
}
