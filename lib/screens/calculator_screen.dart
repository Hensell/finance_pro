import 'package:finance_pro/screens/calculator_option/bond_calc_option_screen.dart';
import 'package:finance_pro/screens/calculator_option/financial_ratios_calc_option.dart';
import 'package:finance_pro/screens/calculator_option/laverage_calc_option_screen.dart';
import 'package:finance_pro/screens/calculator_option/share_calc_option_screen.dart';
import 'package:finance_pro/widgets/calculator_option.dart';
import 'package:flutter/material.dart';

import '../utils/colors_assets.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Wrap(
          children: [
            CalculatorOption(
              title: 'Acciones',
              backgroundColor: ColorAssets.first,
              light: false,
              margin: const EdgeInsets.all(5),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShareCalcOptionScreen()));
              },
            ),
            CalculatorOption(
              title: 'Bonos',
              backgroundColor: ColorAssets.second,
              light: false,
              margin: const EdgeInsets.all(5),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BondCalcOptionScreen()));
              },
            ),
            CalculatorOption(
              title: 'Apalancamiento',
              backgroundColor: ColorAssets.third,
              light: false,
              margin: const EdgeInsets.all(5),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LaverageCalcOptionScreen()));
              },
            ),
            CalculatorOption(
              title: 'Razones financieras',
              backgroundColor: ColorAssets.fourth,
              light: false,
              margin: const EdgeInsets.all(5),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const FinancialRatiosCalcOption()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
