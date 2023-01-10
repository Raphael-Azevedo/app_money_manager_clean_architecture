import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const AdaptativeTextField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(labelText: label),
                                      validator: (value) {
                          if (value == "" || value == null) {
                            return 'Este campo é obrigatório!';
                          }
                          return null;
                        },
            ),
          );
  }
}
