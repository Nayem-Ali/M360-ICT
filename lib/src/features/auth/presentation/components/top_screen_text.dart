import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class TopScreenText extends StatelessWidget {
  const TopScreenText({super.key, required this.titleText, required this.helperText});

  final String titleText;
  final String helperText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: context.displaySmall?.copyWith(
              fontFamily: AppFonts.poppins,
              // fontWeight: FontWeight.w100,
            ),
          ),
          Text(helperText)
        ],
      ),
    );
  }
}
