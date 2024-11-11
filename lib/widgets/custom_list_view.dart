import 'package:finance_pro/services/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.model,
      required this.controllers,
      required this.title,
      this.onTap});

  final List<AccountModel> model;
  final List<TextEditingController> controllers;
  final String title;
  final VoidCallback? onTap;
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
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controllers[index],
                        decoration: InputDecoration(
                          labelText: model[index].accountName,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          model[index].value = double.parse(value);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          model.removeWhere((account) =>
                              account.accountName == model[index].accountName);
                          onTap;
                        },
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              }),
        ],
      ),
    );
  }
}
