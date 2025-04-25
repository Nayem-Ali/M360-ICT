import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class KRichText extends StatelessWidget {
  const KRichText({super.key, required this.leadingText, required this.trailingText});

  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$leadingText ",
              style: context.titleSmall
            ),
            TextSpan(
              text: trailingText,
              style: context.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
