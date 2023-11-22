import 'package:flutter/material.dart';
import '../../widgets/sub_option_widget.dart';
import '../sub_content/bond_basic.dart';

class BondScreen extends StatefulWidget {
  const BondScreen({super.key});

  @override
  State<BondScreen> createState() => _BondScreenState();
}

class _BondScreenState extends State<BondScreen> {
  @override
  Widget build(BuildContext context) {
    return SubOptionWidget(
      appBarTitle: 'Bonos',
      definition:
          'Los bonos son instrumentos de deuda a largo plazo que usan las empresas y los gobiernos para recaudar grandes sumas de dinero, generalmente de un grupo diverso de prestamistas. La mayoría de los bonos corporativos pagan intereses semestralmente (esto es, cada 6 meses) a una tasa cupón establecida, tienen vencimiento inicial de 10 a 30 años',
      buttonTitle: 'Valuación basica',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BondBasic()));
      },
    );
  }
}
