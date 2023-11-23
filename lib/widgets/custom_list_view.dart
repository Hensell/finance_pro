import 'package:finance_pro/services/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.model,
      required this.controllers,
      required this.title});

  final List<AccountModel> model;
  final List<TextEditingController> controllers;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 18),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: model.length,
              itemBuilder: (context, index) {
                return TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(
                    labelText: model[index].accountName,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
