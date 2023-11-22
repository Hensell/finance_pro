import 'package:finance_pro/screens/sub_content/common_share_constant.dart';
import 'package:finance_pro/screens/sub_content/common_share_variable.dart';
import 'package:finance_pro/screens/sub_content/common_share_zero.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';

class CommonShareContent extends StatelessWidget {
  const CommonShareContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Métodos de valuación'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Crecimiento cero',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommonShareZero()));
            },
            firstColor: ColorAssets.first,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Crecimiento constante',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommonShareConstant()));
            },
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
          CustomOption(
            title: 'Crecimiento variable',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommonShareVariable()));
            },
            firstColor: ColorAssets.fifth,
            secondColor: ColorAssets.sixth,
          ),
        ],
      ),
    );
  }
}
