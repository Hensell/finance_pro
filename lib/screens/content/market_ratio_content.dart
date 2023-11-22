import 'package:finance_pro/screens/sub_content/market_ratio_ml.dart';
import 'package:finance_pro/screens/sub_content/market_ratio_pg.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class MarketRatioContent extends StatelessWidget {
  const MarketRatioContent({super.key});

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
            title: 'Relación precio / ganancias (P/G)',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MarketRatioPG()));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Relación Mercado / Libro (M/L)',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MarketRatioMl()));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          )
        ],
      ),
    );
  }
}
