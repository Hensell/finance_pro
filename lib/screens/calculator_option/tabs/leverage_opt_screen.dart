import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../services/functions/number_utils.dart';

class LeverageOptScreen extends StatefulWidget {
  const LeverageOptScreen({super.key});

  @override
  State<LeverageOptScreen> createState() => _LeverageOptScreenState();
}

class _LeverageOptScreenState extends State<LeverageOptScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  double formattedResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).size.width > 700
            ? const EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _firstController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Q Ventas'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _secondController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('P Precio de venta'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _thirdController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('CV Costo variable'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _fourthController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('CF Costo fijo'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                ],
              ),
              const Gap(20),
              ElevatedButton(
                  onPressed: () {
                    calculateResult();
                  },
                  child: const Text('Calcular')),
              Text(
                'Resultado: $formattedResult \$',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculateResult() {
    double first = parseDouble(_firstController.text);
    double second = parseDouble(_secondController.text);
    double third = parseDouble(_thirdController.text);
    double fourth = parseDouble(_fourthController.text);

    double result = 0;

    result = (first * (second - third)) / ((first * (second - third)) - fourth);
    setState(() {
      formattedResult = NumberUtils.formatAndRound(result);
    });
  }

  double parseDouble(String value) {
    return value.isEmpty ? 0.0 : double.parse(value);
  }
}
