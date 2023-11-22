import 'package:finance_pro/services/models/bond_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../services/functions/number_utils.dart';

class BondCalcOptionScreen extends StatefulWidget {
  const BondCalcOptionScreen({super.key});

  @override
  State<BondCalcOptionScreen> createState() => _BondCalcOptionScreenState();
}

class _BondCalcOptionScreenState extends State<BondCalcOptionScreen> {
  final TextEditingController _interesController = TextEditingController();
  final TextEditingController _numerosController = TextEditingController();
  final TextEditingController _valorParController = TextEditingController();
  final TextEditingController _rendiController = TextEditingController();
  double formattedResult = 0.0;
  late BondModel rowData;

  @override
  void dispose() {
    _interesController.dispose();
    _numerosController.dispose();
    _valorParController.dispose();
    _rendiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bonos'),
      ),
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
                    controller: _interesController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Interés anual'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _numerosController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      label: Text('Número de años al vencimiento'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _valorParController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Valor a la par'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _rendiController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Rendimiento requerido'),
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
    double interes = parseDouble(_interesController.text);
    double numeros = parseDouble(_numerosController.text);
    double valorPar = parseDouble(_valorParController.text);
    double rendi = parseDouble(_rendiController.text);

    double result = 0;
    rowData = BondModel(I: interes, n: numeros, M: valorPar, kd: rendi);
    result = rowData.bo;
    setState(() {
      formattedResult = NumberUtils.formatAndRound(result);
    });
  }

  double parseDouble(String value) {
    return value.isEmpty ? 0.0 : double.parse(value);
  }
}
