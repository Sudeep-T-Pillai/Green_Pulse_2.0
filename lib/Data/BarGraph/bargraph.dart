import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:greenpulse/Data/BarGraph/data_b.dart';

class GrBarGraph extends StatelessWidget {
  final List<double> weeklySummary;
   const GrBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarGraphData myBarData = BarGraphData(
      Mon: weeklySummary[0], 
      Tue: weeklySummary[1], 
      Wed: weeklySummary[2], 
      Thu: weeklySummary[3], 
      Fri: weeklySummary[4], 
      Sat: weeklySummary[5], 
      Sun: weeklySummary[6]
      );

      myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: F),
        titlesData: const FlTitlesData(
          show: T,
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: F)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: F)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: F)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: T,
            getTitlesWidget: getBottomTitles,
            )
          )
        ),
        maxY:100,
        minY:0,
        barGroups: myBarData.bardata.map((data) => BarChartGroupData(
          x: data.x,
          barRods: [BarChartRodData(
            toY: data.y,
            color: Colors.grey[800],
            width: 20,
            borderRadius: BorderRadius.circular(4)
          )]
        ))
        .toList()
      )
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta){
      const style = TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 14
      );


Widget text;
switch(value.toInt()){
  case 0:
    text= const Text('Mn',style: style);
    break;
case 1:
    text= const Text('Tu',style: style);
    break;
case 2:
    text= const Text('We',style: style);
    break;
case 3:
    text= const Text('Th',style: style);
    break;
case 4:
    text= const Text('Fr',style: style);
    break;
case 5:
    text= const Text('Sa',style: style);
    break;
case 6:
    text= const Text('Su',style: style);
    break;                        
default:
     text = const Text('',style: style);
     break;
}

return SideTitleWidget(child:text,axisSide: meta.axisSide);
}