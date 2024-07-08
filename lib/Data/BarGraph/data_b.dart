import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGraphData {
  final double Mon, Tue, Wed, Thu, Fri, Sat, Sun;
  late List<IndividualBar> bardata;

  BarGraphData({
    required this.Mon,
    required this.Tue,
    required this.Wed,
    required this.Thu,
    required this.Fri,
    required this.Sat,
    required this.Sun,
  });

  void initializeBarData() {
    bardata = [
      IndividualBar(x: 0, y: Mon),
      IndividualBar(x: 1, y: Tue),
      IndividualBar(x: 2, y: Wed),
      IndividualBar(x: 3, y: Thu),
      IndividualBar(x: 4, y: Fri),
      IndividualBar(x: 5, y: Sat),
      IndividualBar(x: 6, y: Sun),
    ];
  }
}

class IndividualBar {
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y});
}
