import 'package:finance_pro/screens/sub_content/liquidity_aci.dart';
import 'package:finance_pro/screens/sub_content/liquidity_cor.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class LiquidityRatioContent extends StatelessWidget {
  const LiquidityRatioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de liquidez'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Liquidez corriente',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LiquidityCor()));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Prueba del acido',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LiquidityAci()));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          )
        ],
      ),
    );
  }
}
