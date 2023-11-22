import 'package:finance_pro/screens/sub_options/financial_ratio_sub_options.dart';
import 'package:flutter/material.dart';
import '../../widgets/sub_option_widget.dart';

class FinancialRatiosScreen extends StatelessWidget {
  const FinancialRatiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SubOptionWidget(
      appBarTitle: 'Razones financieras \n',
      definition:
          'consiste en "determinar las relaciones existentes entre los diferentes rubros de los estados financieros, para que mediante una correcta interpretación, puedas obtener información acerca del desempeño anterior de la empresa y su postura financiera para el futuro cercano".',
      buttonTitle: 'Razones financieras',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FinancialRatiosSubOptions()));
      },
    );
  }
}
