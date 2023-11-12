import 'package:flutter/material.dart';

import '../../utils/colors_assets.dart';

class DebtRatio extends StatelessWidget {
  const DebtRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razónes de endeudamiento'),
        backgroundColor: ColorAssets.first,
      ),
    );
  }
}
