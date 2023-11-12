import 'package:finance_pro/screens/content/common_share.dart';
import 'package:finance_pro/screens/content/preference_share.dart';
import 'package:finance_pro/utils/colors_assets.dart';
import 'package:finance_pro/widgets/custom_option.dart';
import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acciones'),
        backgroundColor: ColorAssets.first,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Acciones comunes',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const CommonShare())));
            },
            firstColor: ColorAssets.fourth,
            secondColor: ColorAssets.second,
          ),
          CustomOption(
            title: 'Acciones preferenciales',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const PreferenceShare())));
            },
            firstColor: ColorAssets.fourth,
            secondColor: ColorAssets.fifth,
          ),
        ],
      ),
    );
  }
}
