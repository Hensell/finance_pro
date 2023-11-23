import 'package:finance_pro/screens/sub_content/profatibility_ratio_ga.dart';
import 'package:finance_pro/screens/sub_content/profatibility_ratio_ne.dart';
import 'package:finance_pro/screens/sub_content/profatibility_ratio_pa.dart';
import 'package:finance_pro/screens/sub_content/profatibility_ratio_ub.dart';
import 'package:finance_pro/screens/sub_content/profatibility_ratio_uo.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';
import '../sub_content/profatibility_ratio_at.dart';

class ProfatibilityRatioContent extends StatelessWidget {
  const ProfatibilityRatioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razones de rentabilidad'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Margen de utilidad bruta',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfatibilityRatioUb()));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Margen de utilidad operativa',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfatibilityRatioUo()));
            },
            firstColor: ColorAssets.second,
            secondColor: ColorAssets.third,
          ),
          CustomOption(
            title: 'Margen de utilidad neta',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfatibilityRatioNe()));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
          CustomOption(
            title: 'Ganancias por acción',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfatibilityRatioGa()));
            },
            firstColor: ColorAssets.fourth,
            secondColor: ColorAssets.fifth,
          ),
          CustomOption(
            title: 'Rendimiento sobre los activos totales',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfatibilityRatioAt()));
            },
            firstColor: ColorAssets.sixth,
            secondColor: ColorAssets.seventh,
          ),
          CustomOption(
            title: 'Rendimiento sobre el patrimonio',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfatibilityRatioPa()));
            },
            firstColor: ColorAssets.seventh,
            secondColor: ColorAssets.eighth,
          ),
        ],
      ),
    );
  }
}
