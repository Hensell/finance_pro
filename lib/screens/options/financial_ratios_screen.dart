import 'package:finance_pro/screens/content/activity_ratios_screen.dart';
import 'package:finance_pro/screens/content/debt_ratio.dart';
import 'package:finance_pro/screens/content/liquidity_ratios_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class FinancialRatiosScreen extends StatelessWidget {
  const FinancialRatiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Wrap(
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const DebtRatio())));
              },
              firstColor: ColorAssets.third,
              secondColor: ColorAssets.fourth,
            ),
            CustomOption(
              title: 'Razones de rentabilidad',
              onTap: () {},
              firstColor: ColorAssets.fourth,
              secondColor: ColorAssets.fifth,
            ),
            CustomOption(
              title: 'Razones de mercado',
              onTap: () {},
              firstColor: ColorAssets.fifth,
              secondColor: ColorAssets.sixth,
            ),
          ],
        ),
      ),
    );
  }
}
