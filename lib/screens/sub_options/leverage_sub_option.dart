import 'package:finance_pro/screens/sub_content/leverage_fin.dart';
import 'package:finance_pro/screens/sub_content/leverage_opt.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class LeverageSubOption extends StatelessWidget {
  const LeverageSubOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apalancamiento'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Apalancamiento operativo',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LeverageOpt())));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Apalancamiento financiero',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LeverageFin())));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
        ],
      ),
    );
  }
}
