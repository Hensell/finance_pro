import 'package:flutter/material.dart';

class LaverageCalcOptionScreen extends StatefulWidget {
  const LaverageCalcOptionScreen({super.key});

  @override
  State<LaverageCalcOptionScreen> createState() =>
      _LaverageCalcOptionScreenState();
}

class _LaverageCalcOptionScreenState extends State<LaverageCalcOptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Tab1(),
          Tab2(),
        ],
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contenido de la pestaña 1'),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contenido de la pestaña 2'),
    );
  }
}
