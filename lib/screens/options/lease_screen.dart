import 'package:finance_pro/screens/sub_content/lease_fin.dart';
import 'package:flutter/material.dart';
import '../../widgets/sub_option_widget.dart';

class LeaseScreen extends StatelessWidget {
  const LeaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SubOptionWidget(
      appBarTitle: 'Arrendamiento',
      definition:
          'Un arrendamiento es un contrato. Con base en éste, el propietario de un activo (el arrendador) da a otra parte (el arrendatario) el derecho exclusivo al uso del bien, en general, durante un periodo especificado, a cambio del pago de renta.',
      buttonTitle: 'Arrendamiento financiero',
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LeaseFin()));
      },
    );
  }
}
