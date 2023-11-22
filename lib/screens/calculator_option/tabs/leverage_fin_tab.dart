import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../services/functions/number_utils.dart';

class LeverageFinTab extends StatefulWidget {
  const LeverageFinTab({super.key});

  @override
  State<LeverageFinTab> createState() => _LeverageFinTabState();
}

class _LeverageFinTabState extends State<LeverageFinTab> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  double formattedResult = 0.0;

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    super.dispose();
  }

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
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('I Interes anual'),
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
                      label: Text('DP Dividendos de acciones preferentes'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _thirdController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('T Impuestos (en %)'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _fourthController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('UAII Utilidad antes de impuestos'),
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
    double third = parseDouble(_thirdController.text) / 100;
    double fourth = parseDouble(_fourthController.text);

    double result = 0;

    result = fourth / (fourth - first - (second * (1 / (1 - third))));
    setState(() {
      formattedResult = NumberUtils.formatAndRound(result);
    });
  }

  double parseDouble(String value) {
    return value.isEmpty ? 0.0 : double.parse(value);
  }
}
