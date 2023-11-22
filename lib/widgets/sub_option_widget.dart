import 'package:finance_pro/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../utils/colors_assets.dart';

class SubOptionWidget extends StatelessWidget {
  const SubOptionWidget(
      {super.key,
      required this.buttonTitle,
      this.onPressed,
      required this.definition,
      required this.appBarTitle});

  final String buttonTitle;
  final String appBarTitle;
  final VoidCallback? onPressed;
  final String definition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: '$appBarTitle - Definición'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              definition,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorAssets.fourth,
              shape: const RoundedRectangleBorder()),
          onPressed: onPressed,
          icon: const Icon(
            Icons.list,
            color: ColorAssets.textBlack,
          ),
          label: Text(
            buttonTitle,
            style: const TextStyle(color: ColorAssets.textBlack),
          )),
    );
  }
}
