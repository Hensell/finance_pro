import 'package:finance_pro/screens/sub_content/debt_ratio_end.dart';
import 'package:finance_pro/screens/sub_content/debt_ratio_indpa.dart';
import 'package:finance_pro/screens/sub_content/debt_ratio_intfi.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class DebtRatioContent extends StatelessWidget {
  const DebtRatioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razónes de endeudamiento'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Índice de endeudamiento',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DebtRatioEnd()));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Razón de cargos de interés fijo',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DebtRatioIntfi()));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
          CustomOption(
            title: 'Índice de cobertura de pagos fijos',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DebtRatioIndpa()));
            },
            firstColor: ColorAssets.fifth,
            secondColor: ColorAssets.sixth,
          ),
        ],
      ),
    );
  }
}
