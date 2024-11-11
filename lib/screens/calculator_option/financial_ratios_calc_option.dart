import 'package:finance_pro/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../services/models/account_model.dart';
import '../../widgets/custom_list_view.dart';

class FinancialRatiosCalcOption extends StatefulWidget {
  const FinancialRatiosCalcOption({super.key});

  @override
  State<FinancialRatiosCalcOption> createState() =>
      _FinancialRatiosCalcOptionState();
}

class _FinancialRatiosCalcOptionState extends State<FinancialRatiosCalcOption> {
  List<TextEditingController> _erVentas = [];
  List<TextEditingController> _erCosto = [];
  List<TextEditingController> _erGastosVentas = [];
  List<TextEditingController> _erGastosAdmin = [];
  List<TextEditingController> _erOtrosIng = [];

  List<TextEditingController> _bgActivoC = [];
  List<TextEditingController> _bgActivoNC = [];
  List<TextEditingController> _bgPasivoC = [];
  List<TextEditingController> _bgPasivoNC = [];
  List<TextEditingController> _bgCapitalCon = [];

  bool showResult = false;

//Resultados
  double _sumAC = 0.0;
  double _sumPC = 0.0;
  double _sumANC = 0.0;
  double _sumPNC = 0.0;
  double _sumVentas = 0.0;
  double _sumCostoVentas = 0.0;
  double _sumGastosVentas = 0.0;
  double _sumGastosAdmin = 0.0;

  double _liquidezCorr = 0.0;
  double _liquidezAci = 0.0;
  double _rotacionInv = 0.0;
  double _periodoProCobro = 0.0;
  double _periodoProPago = 0.0;
  double _rotacionAct = 0.0;
  double _indiceEnd = 0.0;
  double _margenUtiBru = 0.0;
  double _margenUtiOpt = 0.0;

  @override
  void initState() {
    super.initState();
    _erVentas = List.generate(
      erVentas.length,
      (index) => TextEditingController(),
    );

    _erCosto = List.generate(
      erCosto.length,
      (index) => TextEditingController(),
    );

    _erGastosVentas = List.generate(
      erGastosVentas.length,
      (index) => TextEditingController(),
    );

    _erGastosAdmin = List.generate(
      erGastosAdmin.length,
      (index) => TextEditingController(),
    );

    _erOtrosIng = List.generate(
      erOtrosIng.length,
      (index) => TextEditingController(),
    );

    //balance general
    _bgActivoC = List.generate(
      balanceGeneralList[0].length,
      (index) => TextEditingController(),
    );

    _bgActivoNC = List.generate(
      balanceGeneralList[1].length,
      (index) => TextEditingController(),
    );

    _bgPasivoC = List.generate(
      balanceGeneralList[2].length,
      (index) => TextEditingController(),
    );

    _bgPasivoNC = List.generate(
      balanceGeneralList[3].length,
      (index) => TextEditingController(),
    );

    _bgCapitalCon = List.generate(
      balanceGeneralList[4].length,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (var controller in _erVentas) {
      controller.dispose();
    }
    for (var controller in _erCosto) {
      controller.dispose();
    }
    for (var controller in _erGastosVentas) {
      controller.dispose();
    }
    for (var controller in _erGastosAdmin) {
      controller.dispose();
    }
    for (var controller in _erOtrosIng) {
      controller.dispose();
    }
    //Balance general
    for (var controller in _bgActivoC) {
      controller.dispose();
    }
    for (var controller in _bgActivoNC) {
      controller.dispose();
    }
    for (var controller in _bgPasivoC) {
      controller.dispose();
    }
    for (var controller in _bgPasivoNC) {
      controller.dispose();
    }
    for (var controller in _bgCapitalCon) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Razones financieras'),
      body: Container(
        padding: MediaQuery.of(context).size.width > 700
            ? const EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Estado de resultado',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              CustomListView(
                title: 'Ventas',
                model: erVentas,
                controllers: _erVentas,
                onTap: () {
                  onUpdate();
                },
              ),
              CustomListView(
                title: 'Costo de articulos vendidos',
                model: erCosto,
                controllers: _erCosto,
              ),
              CustomListView(
                title: 'Gastos de ventas',
                model: erGastosVentas,
                controllers: _erGastosVentas,
              ),
              CustomListView(
                title: 'Gastos administrativos',
                model: erGastosAdmin,
                controllers: _erGastosAdmin,
              ),
              CustomListView(
                title: 'Otros ingresos',
                model: erOtrosIng,
                controllers: _erOtrosIng,
              ),
              const Text(
                'Balance general',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              CustomListView(
                title: 'Activos circulantes',
                model: balanceGeneralList[0],
                controllers: _bgActivoC,
              ),
              CustomListView(
                title: 'Activo no circulante',
                model: balanceGeneralList[1],
                controllers: _bgActivoNC,
              ),
              CustomListView(
                title: 'Pasivos circulante',
                model: balanceGeneralList[2],
                controllers: _bgPasivoC,
              ),
              CustomListView(
                title: 'Pasivo no circulante',
                model: balanceGeneralList[3],
                controllers: _bgPasivoNC,
              ),
              CustomListView(
                title: 'Capital contable',
                model: balanceGeneralList[4],
                controllers: _bgCapitalCon,
              ),
              showResult ? results() : Container()
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            setState(() {});
            //  print(erVentas[1].value);
            //calcular();
          },
          child: const Text('Calcular')),
    );
  }

  onUpdate() {
    print('uwu');
    setState(() {
      print('uwu');
    });
  }

  calcular() {
    _sumAC = calcularSumaTotal(_bgActivoC, balanceGeneralList[0]);
    _sumPC = calcularSumaTotal(_bgPasivoC, balanceGeneralList[2]);
    _sumANC = calcularSumaTotal(_bgActivoNC, balanceGeneralList[1]);
    _sumPNC = calcularSumaTotal(_bgPasivoNC, balanceGeneralList[3]);
    _sumVentas = calcularSumaTotal(_erVentas, erVentas);
    _sumCostoVentas = calcularSumaTotal(_erCosto, erCosto);
    _sumGastosAdmin = calcularSumaTotal(_erGastosAdmin, erGastosAdmin);
    _sumGastosVentas = calcularSumaTotal(_erGastosVentas, erGastosVentas);
    _liquidezCorr = _sumAC / _sumPC;

    _liquidezAci = (_sumAC - double.tryParse(_bgActivoC[4].text)!) / _sumPC;

    _rotacionInv = calcularSumaTotal(_erCosto, erCosto) /
        double.tryParse(_bgActivoC[4].text)!;

    _periodoProCobro = double.tryParse(_bgActivoC[1].text)! /
        (calcularSumaTotal(_erVentas, erVentas) / 365);

    _periodoProPago = double.tryParse(_bgPasivoC[0].text)! /
        double.tryParse(_erCosto[1].text)!;

    _rotacionAct = double.tryParse(_erVentas[0].text)! / (_sumAC + _sumANC);

    _indiceEnd = (_sumPC + _sumPNC) / (_sumAC + _sumANC);
    _margenUtiBru = double.tryParse(_erOtrosIng[1].text)! /
        double.tryParse(_erVentas[0].text)!;
    _margenUtiOpt = ((_sumVentas + _sumCostoVentas) -
            (_sumGastosAdmin + _sumGastosVentas)) /
        double.tryParse(_erVentas[0].text)!;
    showResult = true;
    setState(() {});
  }

  results() {
    return Column(
      children: [
        Text('Liquidez corriente = $_liquidezCorr'),
        Text('Prueba acida = ${_liquidezAci.toString()}'),
        Text('Rotación de inventario = ${_rotacionInv.toString()}'),
        Text('Periodo promedio de cobro = ${_periodoProCobro.toString()} días'),
        Text('Periodo promedio de pago = ${_periodoProPago.toString()} días'),
        Text('Rotación de activos totales= ${_rotacionAct.toString()} días'),
        Text('índice de endeudamiento= ${_indiceEnd.toString()} '),
        Text('Margen de utilidad bruta= ${_margenUtiBru.toString()} '),
        Text('Margen de utilidad operativa= ${_margenUtiOpt.toString()} '),
      ],
    );
  }

  double calcularSumaTotal(
      List<TextEditingController> controllers, List<AccountModel> cuentas) {
    double sumaTotal = 0.0;

    for (int i = 0; i < controllers.length; i++) {
      var valorIngresado = double.tryParse(controllers[i].text) ?? 0.0;
      var cuenta = cuentas[i];

      if (cuenta.isPositive) {
        sumaTotal += valorIngresado;
      } else {
        sumaTotal -= valorIngresado;
      }
    }

    return sumaTotal;
  }
}
