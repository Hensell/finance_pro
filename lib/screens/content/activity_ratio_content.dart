import 'package:finance_pro/screens/sub_content/actitivy_ratio_proco.dart';
import 'package:finance_pro/screens/sub_content/activity_ratio_propa.dart';
import 'package:finance_pro/screens/sub_content/activity_ratio_rotac.dart';
import 'package:finance_pro/screens/sub_content/activity_ratio_rotinv.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class ActivityRatioContent extends StatelessWidget {
  const ActivityRatioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razón de actividad'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Rotación de inventario',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivityRatioRotinv()));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Periodo promedio de cobro',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivityRatioProco()));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
          CustomOption(
            title: 'Periodo promedio de pago',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivityRatioPropa()));
            },
            firstColor: ColorAssets.fifth,
            secondColor: ColorAssets.sixth,
          ),
          CustomOption(
            title: 'Rotación de los activos totales',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivityRatioRotac()));
            },
            firstColor: ColorAssets.seventh,
            secondColor: ColorAssets.eighth,
          ),
        ],
      ),
    );
  }
}
