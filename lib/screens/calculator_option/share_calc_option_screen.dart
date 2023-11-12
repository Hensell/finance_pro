import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gap/gap.dart';

import '../../services/functions/number_utils.dart';
import '../../services/models/common_share_model.dart';

class ShareCalcOptionScreen extends StatefulWidget {
  const ShareCalcOptionScreen({super.key});

  @override
  State<ShareCalcOptionScreen> createState() => _ShareCalcOptionScreenState();
}

class _ShareCalcOptionScreenState extends State<ShareCalcOptionScreen> {
  final TextEditingController _dividendoController = TextEditingController();
  final TextEditingController _rendiController = TextEditingController();
  final TextEditingController _creciController = TextEditingController();
  final TextEditingController _periodoController = TextEditingController();
  final TextEditingController _creciDosController = TextEditingController();
  double formattedResult = 0.0;

  bool variable = false;
  late CommonShareModel rowData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valuación de acciones'),
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
                    controller: _dividendoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('D₁ Dividendo'),
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
                      label: Text('ks Rendimiento'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _creciController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('g₁ Tasa de crecimiento inicial'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _periodoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      label: Text('N Numero de periodos'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _creciDosController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                      label: Text('g2 Tasa de crecimiento final'),
                      hintText: '0.0',
                      filled: true,
                    ),
                  )
                ],
              ),
              const Gap(20),
              ElevatedButton(
                  onPressed: () {
                    calculateResult();
                  },
                  child: const Text('Calcular')),
              variable
                  ? variableContainer()
                  : Text(
                      'Resultado: $formattedResult \$',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Column variableContainer() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('t')),
              DataColumn(label: Text('Do')),
              DataColumn(label: Text('(1 + g1)^t')),
              DataColumn(label: Text('Dt')),
              DataColumn(label: Text('(1 + ks)^t')),
              DataColumn(label: Text('Valor presente')),
            ],
            rows: List<DataRow>.generate(
              rowData.t,
              (index) => DataRow(
                cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Text('${rowData.doValue}')),
                  DataCell(Text('${rowData.g1Results[index]}')),
                  DataCell(Text('${rowData.dtResults[index]}')),
                  DataCell(Text('${rowData.ksResults[index]}')),
                  DataCell(Text('${rowData.presentValues[index]}')),
                ],
              ),
            ),
          ),
        ),
        Text(
          'Suma de valor presente de los Dividendos: ${rowData.sumPresentValues}',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            'D_${rowData.t + 1} = ${rowData.dtResults[rowData.t - 1]} * (1 + ${rowData.g2Value / 100}) = ${rowData.dtValue}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const Gap(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            'P_${rowData.t + 1} = ${rowData.ptValue}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const Gap(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            'VPF = ${rowData.vpf}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const Gap(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Math.tex(
            'Valor presente = ${rowData.vp}',
            mathStyle: MathStyle.display,
            textStyle: const TextStyle(fontSize: 24),
          ),
        ),
        const Gap(30)
      ],
    );
  }

  void calculateResult() {
    double dividendo = parseDouble(_dividendoController.text);
    double rendimiento = parseDouble(_rendiController.text);
    double crecimiento = parseDouble(_creciController.text);
    double periodos = parseDouble(_periodoController.text);
    double crecimientoFinal = parseDouble(_creciDosController.text);
    double result = 0;

    if (dividendo <= 0 ||
        rendimiento <= 0 ||
        crecimiento < 0 ||
        crecimientoFinal >= rendimiento ||
        crecimiento >= rendimiento ||
        (periodos < 1 && crecimientoFinal > 0)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Asegúrese de que los valores sean no negativos y que el crecimiento sea menor al rendimiento.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    if (periodos > 0 && crecimientoFinal > 0) {
      rowData = CommonShareModel(
        t: periodos.toInt(),
        doValue: dividendo,
        g1Value: crecimiento,
        g2Value: crecimientoFinal,
        ksValue: rendimiento,
      );
      variable = true;
    } else {
      result = (dividendo / (rendimiento - crecimiento)) * 100;
      variable = false;
    }

    setState(() {
      formattedResult = NumberUtils.formatAndRound(result);
    });
  }

  double parseDouble(String value) {
    return value.isEmpty ? 0.0 : double.parse(value);
  }
}
