import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class BottomText extends StatelessWidget {
  const BottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: "Powered by ", style: context.labelLarge),
            TextSpan(
              text: "M360 ICT",
              style: context.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
