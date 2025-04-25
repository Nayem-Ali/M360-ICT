import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class KPasswordField extends StatelessWidget {
  KPasswordField({super.key, required this.controller, required this.hint, required this.label});

  final TextEditingController controller;
  final String hint;
  final String label;
  final ValueNotifier<bool> obscure = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          ValueListenableBuilder(
            valueListenable: obscure,
            builder: (context, value, child) {
              return TextFormField(
                controller: controller,
                obscureText: obscure.value,
                decoration: InputDecoration(
                  hintText: hint,
                  // labelText: label,
                  // labelStyle: context.titleMedium,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscure.value = !obscure.value;
                    },
                    icon: Icon(value ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
