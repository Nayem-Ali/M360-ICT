import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';

import 'overlapping_images.dart';

class CarbonEmissionRate extends StatelessWidget {
  const CarbonEmissionRate({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          place.carbonEmissionRate,
          style: context.displayLarge?.copyWith(
            color: Theme.of(context).primaryColor,
            fontFamily: AppFonts.poppins,
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  place.carbonEmissionStatus == "decreased"
                      ? "▼${place.carbonEmissionChanged}"
                      : "▲${place.carbonEmissionChanged}",
                  style: context.titleSmall?.copyWith(
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            Text(
              "ppm",
              style: context.titleLarge?.copyWith(
                fontFamily: AppFonts.poppins,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
