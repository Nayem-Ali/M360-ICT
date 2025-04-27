import 'package:flutter/material.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
class EmissionMeterGauge extends StatefulWidget {
  const EmissionMeterGauge({super.key, required this.gaugeWidth, required this.pointerValue});
  final double gaugeWidth;
  final double pointerValue;
  @override
  State<EmissionMeterGauge> createState() => _EmissionMeterGaugeState();
}

class _EmissionMeterGaugeState extends State<EmissionMeterGauge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.gaugeWidth,
      padding: const EdgeInsets.only(right: 12.0),
      child: LinearGauge(
        rulers: RulerStyle(
          rulerPosition: RulerPosition.bottom,
          showLabel: false,
          showPrimaryRulers: false,
          showSecondaryRulers: false,
        ),
        linearGaugeBoxDecoration: LinearGaugeBoxDecoration(
          thickness: 8,
          backgroundColor: Colors.transparent,
        ),
        pointers: [
          Pointer(
            value: widget.pointerValue,
            shape: PointerShape.triangle,
            pointerPosition: PointerPosition.top,
            color: getPointerColor(widget.pointerValue),
            height: 8,
            width: 10,
          ),
        ],
        showLinearGaugeContainer: true,
        rangeLinearGauge: [
          RangeLinearGauge(color: Colors.deepPurple, start: 0, end: 19),
          RangeLinearGauge(color: Colors.redAccent, start: 20, end: 39),
          RangeLinearGauge(color: Colors.greenAccent, start: 40, end: 59),
          RangeLinearGauge(color: Colors.yellow, start: 60, end: 79),
          RangeLinearGauge(color: Colors.orange, start: 80, end: 100),
        ],
      ),
    );
  }
  
  Color getPointerColor(double value) {
    if(value <= 19){
      return Colors.deepPurple;
    } else if(value <=39){
      return Colors.redAccent;
    } else if(value <=59){
      return Colors.greenAccent;
    } else if(value <= 79){
      return Colors.yellow;
    } else {
      return Colors.orange;
    }
  }
}
