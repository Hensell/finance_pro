import 'package:finance_pro/screens/sub_options/share_sub_option.dart';
import 'package:flutter/material.dart';
import '../../widgets/sub_option_widget.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SubOptionWidget(
      appBarTitle: 'Acciones',
      definition:
          'Las acciones son instrumentos financieros que representan una porción del capital social de una empresa. Al comprar una acción, nos convertimos en propietarios de una pequeña parte de la compañía y, por lo tanto, en socios de la misma.',
      buttonTitle: 'Tipos de acciones',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShareSubOption()));
      },
    );
  }
}
