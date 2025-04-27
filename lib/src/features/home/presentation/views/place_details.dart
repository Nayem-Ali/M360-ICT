import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/constants/icons_path.dart';
import 'package:m360_ict/src/core/utils/constants/images_path.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/core/utils/logger/logger.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';
import 'package:m360_ict/src/features/home/presentation/components/carbon_emission_rate.dart';
import 'package:m360_ict/src/features/home/presentation/components/emission_meter_gauge.dart';
import 'package:m360_ict/src/features/home/presentation/components/history_chart.dart';
import 'package:m360_ict/src/features/home/presentation/components/overlapping_images.dart';
import 'package:m360_ict/src/features/home/presentation/components/place_condition.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({super.key, required this.place});

  final Place place;

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
        titleSpacing: -15,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(IconsPath.homeIcon)),
            SizedBox(width: 10),
            Text(widget.place.placeName),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: PlaceCondition(condition: widget.place.carbonEmissionCondition),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CarbonEmissionRate(place: widget.place),
                Spacer(),
                EmissionMeterGauge(gaugeWidth: context.width * 0.4, pointerValue: 58),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "History",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.scrim.withAlpha(150),
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See All \u25BA",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.scrim.withAlpha(150),
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HistoryChart(place: widget.place),
            SizedBox(height: 30),

            Row(
              children: [
                Card(
                  child: Container(
                    height: context.height * 0.2,
                    width: context.width * 0.45,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    child: Column(
                      children: [
                        Text("Persons", style: context.headlineMedium),
                        Spacer(),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            OverlappingImages(
                              images: widget.place.peopleImage,
                              imageRadius: 25,
                              overlapOffset: 19,
                              borderWidth: 3,
                            ),

                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 3, color: Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  "+${1 + widget.place.totalPeoples - widget.place.peopleImage.length}",
                                  style: context.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontFamily: AppFonts.poppins,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: context.height * 0.2,
                  width: context.width * 0.45,
                  padding: EdgeInsets.symmetric(vertical: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Color(0xFF6ABC93), Color(0xFFA1FFD0)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Rooms",
                        style: context.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "5",
                        style: context.displayLarge?.copyWith(
                          color: Colors.white,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '2 of them requires action',
                            style: context.labelSmall?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Card(
              child: Row(
                children: [
                  Container(
                    height: context.height * 0.2,
                    width: context.width * 0.45,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    child: Column(
                      children: [
                        Text(
                          "Plants",
                          style: context.headlineLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Image(image: AssetImage(IconsPath.leafIcon)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: context.height * 0.2,
                    width: context.width * 0.45,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Color(0xFF6ABC93), Color(0xFFA1FFD0)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "45",
                        style: context.displayLarge?.copyWith(
                          fontSize: 80,
                          color: Colors.white,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
