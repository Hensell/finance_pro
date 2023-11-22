import 'package:finance_pro/screens/content/common_share_content.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_assets.dart';
import '../../widgets/custom_option.dart';
import '../content/preference_share.dart';

class ShareSubOption extends StatelessWidget {
  const ShareSubOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acciones'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomOption(
            title: 'Acciones comunes',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const CommonShareContent())));
            },
            firstColor: ColorAssets.first,
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
            firstColor: ColorAssets.third,
            secondColor: ColorAssets.fourth,
          ),
        ],
      ),
    );
  }
}
