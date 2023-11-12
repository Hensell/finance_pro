import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              text: '$title \n',
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              children: [
                TextSpan(
                    text: '$subTitle \n',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal))
              ])),
    );
  }
}
