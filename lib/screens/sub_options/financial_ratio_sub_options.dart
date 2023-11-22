import 'package:flutter/material.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';
import '../content/activity_ratios_screen.dart';
import '../content/debt_ratio.dart';
import '../sub_content/liquidity_ratios_screen.dart';
import '../content/market_ratio.dart';
import '../content/profatibility_ratio.dart';

class FinancialRatiosSubOptions extends StatelessWidget {
  const FinancialRatiosSubOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razones financieras'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Razones de liquidez',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LiquidityRatiosScreen())));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Razones de actividad',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ActivityRatiosScreen())));
            },
            firstColor: ColorAssets.second,
            secondColor: ColorAssets.third,
          ),
          CustomOption(
            title: 'Razones de endeudamiento',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const DebtRatio())));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
          CustomOption(
            title: 'Razones de rentabilidad',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const ProfatibilityRatio())));
            },
            firstColor: ColorAssets.fourth,
            secondColor: ColorAssets.fifth,
          ),
          CustomOption(
            title: 'Razones de mercado',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const MarketRatio())));
            },
            firstColor: ColorAssets.fifth,
            secondColor: ColorAssets.sixth,
          ),
        ],
      ),
    );
  }
}
