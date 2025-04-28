import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class KTextField extends StatelessWidget {
  const KTextField({super.key, required this.controller, required this.hint, required this.label});

  final TextEditingController controller;
  final String hint;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.only(top: 0),
              hintStyle: context.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.scrim.withAlpha(90),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
