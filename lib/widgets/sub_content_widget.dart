import 'package:finance_pro/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/colors_assets.dart';

class SubContentWidget extends StatelessWidget {
  const SubContentWidget(
      {super.key,
      required this.appBarTitle,
      required this.definition,
      this.onPressed,
      required this.equation,
      required this.example,
      required this.exampleEquation});

  final String appBarTitle;
  final VoidCallback? onPressed;
  final String definition;
  final Widget equation;
  final String example;
  final Widget exampleEquation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: appBarTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                definition,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18),
              ),
              const Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      ColorAssets.seventh.withOpacity(0.7),
                      ColorAssets.tenth.withOpacity(0.7)
                    ])),
                child: const Text(
                  'Ecuación',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: equation,
              ),
              const Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      ColorAssets.seventh.withOpacity(0.7),
                      ColorAssets.tenth.withOpacity(0.7)
                    ])),
                child: const Text(
                  'Ejemplo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                example,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18),
              ),
              const Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: exampleEquation,
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorAssets.fourth,
              shape: const RoundedRectangleBorder()),
          onPressed: onPressed,
          icon: const Icon(
            Icons.calculate,
            color: ColorAssets.textBlack,
          ),
          label: const Text(
            'Calculadora',
            style: TextStyle(color: ColorAssets.textBlack),
          )),
    );
  }
}
