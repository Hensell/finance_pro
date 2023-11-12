import 'package:finance_pro/utils/colors_assets.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.image,
      required this.title,
      this.light = true,
      required this.backgroundColor,
      this.onTap,
      this.margin = EdgeInsets.zero});

  final VoidCallback? onTap;
  final String image;
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
          width: MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width / 5
              : MediaQuery.of(context).size.width - 50,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundColor: ColorAssets.white.withOpacity(0.6),
                  child: Image.asset(
                    image,
                    width: 50,
                    height: 50,
                  )),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: light ? ColorAssets.white : ColorAssets.textBlack),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          )),
    );
  }
}
