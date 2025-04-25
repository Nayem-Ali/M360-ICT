import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class KElevatedButton extends StatelessWidget {
  const KElevatedButton({super.key, required this.onPressed, required this.buttonTitle});

  final Function()? onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: context.height * 0.05,
        width: context.width * 0.95,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
          child: Text(buttonTitle, style: context.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary
          ),),
        ),
      ),
    );
  }
}
