import 'package:finance_pro/screens/content/activity_ratio_content.dart';
import 'package:finance_pro/screens/content/debt_ratio_content.dart';
import 'package:finance_pro/screens/content/liquidity_ratio_content.dart';
import 'package:finance_pro/screens/content/market_ratio_content.dart';
import 'package:finance_pro/screens/content/profatibility_ratio_content.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

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
                      builder: ((context) => const LiquidityRatioContent())));
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
                      builder: ((context) => const ActivityRatioContent())));
            },
            firstColor: ColorAssets.second,
            secondColor: ColorAssets.third,
          ),
          CustomOption(
            title: 'Razones de endeudamiento',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const DebtRatioContent())));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
          CustomOption(
            title: 'Razones de rentabilidad',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const ProfatibilityRatioContent())));
            },
            firstColor: ColorAssets.fourth,
            secondColor: ColorAssets.fifth,
          ),
          CustomOption(
            title: 'Razones de mercado',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const MarketRatioContent())));
            },
            firstColor: ColorAssets.fifth,
            secondColor: ColorAssets.sixth,
          ),
        ],
      ),
    );
  }
}
