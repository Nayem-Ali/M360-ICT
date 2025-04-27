import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';

class HistoryChart extends StatelessWidget {
  const HistoryChart({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 16),
      height: context.height * 0.25,
      width: context.width,
      child: LineChart(
        curve: Curves.linear,
        LineChartData(
          minY: 0,
          maxY: 100,
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(width: 1, color: Theme.of(context).colorScheme.scrim.withAlpha(90)),
              bottom: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.scrim.withAlpha(90),
              ),
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                interval: 1,
                getTitlesWidget: (value, meta) {
                  String title = place.history[value.toInt() - 1].date.replaceAll(" ", "\n ");
                  return Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.scrim.withAlpha(120),
                    ),
                  );
                },
                reservedSize: 40,
                maxIncluded: true,
                minIncluded: false,
                // getTitlesWidget: getBottomTitles,
                showTitles: true,
              ),
            ),
          ),
          gridData: const FlGridData(drawHorizontalLine: true, drawVerticalLine: false),
          lineBarsData: [
            LineChartBarData(
              spots: place.history.map((e) => FlSpot(e.id.toDouble(), e.rate)).toList(),
              isCurved: true,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withAlpha(90),
                  Theme.of(context).primaryColor.withAlpha(100),
                ],
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter: (p0, p1, p2, p3) {
                  if (place.history.first.id == p0.x) {
                    return FlDotSquarePainter(size: 0);
                  }
                  return FlDotCirclePainter(
                    radius: 5,
                    color: Colors.white,
                    strokeColor: Theme.of(context).primaryColor,
                    strokeWidth: 2,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                spotsLine: BarAreaSpotsLine(
                  show: true,
                  flLineStyle: FlLine(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor.withAlpha(90),
                        Theme.of(context).primaryColor.withAlpha(100),
                      ],
                    ),
                  ),
                ),
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
