import 'package:finance_pro/screens/calculator_option/tabs/leverage_fin_screen.dart';
import 'package:finance_pro/screens/calculator_option/tabs/leverage_opt_screen.dart';
import 'package:flutter/material.dart';

class LaverageCalcOptionScreen extends StatefulWidget {
  const LaverageCalcOptionScreen({super.key});

  @override
  State<LaverageCalcOptionScreen> createState() =>
      _LaverageCalcOptionScreenState();
}

class _LaverageCalcOptionScreenState extends State<LaverageCalcOptionScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apalancamiento'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Operativo'),
            Tab(text: 'Financiero'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [LeverageOptScreen(), LeverageFinScreen()],
      ),
    );
  }
}
