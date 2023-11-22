import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            text: '$title \n',
            style: const TextStyle(fontSize: 18),
            children: [
              TextSpan(
                  text: '$subTitle \n', style: const TextStyle(fontSize: 18))
            ]));
  }
}
