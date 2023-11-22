import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../widgets/sub_content_widget.dart';

class ActivityRatioRotinv extends StatelessWidget {
  const ActivityRatioRotinv({super.key});

  @override
  Widget build(BuildContext context) {
    return SubContentWidget(
      appBarTitle: 'Rotación de inventario',
      definition:
          'La rotación de inventarios mide comúnmente la actividad, o liquidez, del inventario de una empresa. Se calcula de la siguiente manera:',
      equation: Math.tex(
        r'\text{Rotación de inventarios} =  \frac{\text{Costo de bienes vendidos}}{\text{Inventario}} ',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
      example:
          'Al aplicar la formula anterior a Bartlett Company en 2012 tenemos:',
      exampleEquation: Math.tex(
        r'\frac{\$2,088,000}{\$289,000}=7.2',
        mathStyle: MathStyle.display,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
