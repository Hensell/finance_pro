import 'package:flutter/material.dart';

import '../utils/colors_assets.dart';

class CalculatorOption extends StatelessWidget {
  const CalculatorOption(
      {super.key,
      this.onTap,
      required this.title,
      required this.light,
      required this.backgroundColor,
      required this.margin});
  final VoidCallback? onTap;

  final String title;
  final bool light;
  final Color backgroundColor;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
          margin: margin,
          height: 160,
          width: 160,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [backgroundColor, backgroundColor.withOpacity(0.7)]),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: backgroundColor.withOpacity(0.5))
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: light ? ColorAssets.white : ColorAssets.textBlack),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )),
    );
  }
}
