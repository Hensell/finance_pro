import 'package:finance_pro/screens/sub_content/preference_share_zero.dart';
import 'package:flutter/material.dart';
import '../../widgets/sub_option_widget.dart';

class PreferenceShare extends StatelessWidget {
  const PreferenceShare({super.key});

  @override
  Widget build(BuildContext context) {
    return SubOptionWidget(
      appBarTitle: 'Acciones preferenciales \n',
      definition:
          'Las acciones preferentes son un tipo de valor mobiliario que combina características tanto de acciones comunes como de bonos. Los accionistas preferentes tienen prioridad sobre los accionistas comunes en términos de distribución de dividendos y liquidación de activos en caso de quiebra o liquidación de la empresa.',
      buttonTitle: 'Crecimiento cero',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PreferenceShareZero()));
      },
    );
  }
}
