import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
class PlaceCondition extends StatelessWidget {
  const PlaceCondition({super.key, required this.condition});
  final String condition;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Color(0xFF47BA80), Color(0xFF2DF28F)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
        child: Text(
          condition,
          style: context.titleSmall?.copyWith(
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
