import 'package:flutter/material.dart';
import '../utils/colors_assets.dart';

class CustomOption extends StatelessWidget {
  const CustomOption(
      {super.key,
      required this.title,
      this.onTap,
      required this.firstColor,
      required this.secondColor});
  final String title;
  final VoidCallback? onTap;
  final Color firstColor;
  final Color secondColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsetsDirectional.only(start: 15),
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [firstColor, secondColor]),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 1,
                color: firstColor.withOpacity(0.5))
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: ColorAssets.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
