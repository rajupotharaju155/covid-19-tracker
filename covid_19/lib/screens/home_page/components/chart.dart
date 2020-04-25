import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';


class GetChart extends StatefulWidget {
  GetChart({this.rate, this.mycolor});
  final double rate;
  final Color mycolor; 
  @override
  _GetChartState createState() => _GetChartState();
}

class _GetChartState extends State<GetChart> {

  @override
  Widget build(BuildContext context) {
    return new AnimatedCircularChart(
  //key: _chartKey,
  size:  const Size(140.0, 140.0),
  initialChartData: <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(
          widget.rate,
          widget.mycolor,
          rankKey: 'completed',
        ),
        new CircularSegmentEntry(
          100-widget.rate,
          Colors.blueGrey[100],
          rankKey: 'remaining',
        ),
      ],
      rankKey: 'progress',
    ),
  ],
  chartType: CircularChartType.Radial,
  percentageValues: true,
  holeLabel: "      " + widget.rate.toString() + "%\nof total cases",
  labelStyle: new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 11.0,
  ),
);
  }
}