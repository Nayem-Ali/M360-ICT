import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/constants/icons_path.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/widgets/k_elevated_button.dart';
import 'package:m360_ict/src/features/home/presentation/components/emission_meter_gauge.dart';

class CalculateEmissionView extends StatefulWidget {
  const CalculateEmissionView({super.key});

  @override
  State<CalculateEmissionView> createState() => _CalculateEmissionViewState();
}

class _CalculateEmissionViewState extends State<CalculateEmissionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "1300",
                      style: context.displayLarge?.copyWith(
                        color: Colors.redAccent,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    TextSpan(
                      text: " ppm",
                      style: context.titleLarge?.copyWith(
                        color: Colors.redAccent,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                  ],
                ),
              ),
              EmissionMeterGauge(gaugeWidth: context.width * 0.9, pointerValue: 38),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Very Unhealthy: ",
                      style: context.titleMedium?.copyWith(
                        color: Colors.redAccent,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Your office is emitting a lot of Carbon Dioxide",
                      style: context.titleMedium?.copyWith(
                        fontFamily: AppFonts.poppins,
                        color: Theme.of(context).colorScheme.scrim.withAlpha(90),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  height: context.height * 0.32,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor.withAlpha(80),
                        child: Image(image: AssetImage(IconsPath.leafIcon), width: 30, height: 30),
                      ),
                      Text(
                        "Plant",
                        style: context.titleMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontFamily: AppFonts.poppins,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "189 indoor plants",
                          style: context.titleLarge?.copyWith(fontFamily: AppFonts.poppins),
                        ),
                      ),
                      Text(
                        "Your office emits 2549ppm Carbon dioxide everyday",
                        textAlign: TextAlign.center,
                        style: context.titleSmall?.copyWith(
                          fontFamily: AppFonts.poppins,
                          color: Theme.of(context).colorScheme.scrim.withAlpha(90),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "Planted",
                              style: context.titleSmall?.copyWith(fontFamily: AppFonts.poppins),
                            ),
                            Spacer(),
                            Text(
                              "23/189",
                              style: context.titleSmall?.copyWith(
                                fontFamily: AppFonts.poppins,
                                color: Theme.of(context).colorScheme.scrim.withAlpha(90),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                        child: Stack(
                          children: [
                            // Background
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.scrim.withAlpha(90),
                              ),
                            ),
                            // Progress with gradient
                            FractionallySizedBox(
                              widthFactor: 23/189,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [Color(0xFF47BA80), Color(0xFF2DF28F)],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              KElevatedButton(onPressed: (){}, buttonTitle: "Done"),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
