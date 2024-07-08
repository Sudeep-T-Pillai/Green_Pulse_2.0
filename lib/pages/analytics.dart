import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:greenpulse/Data/BarGraph/bargraph.dart';
import 'package:greenpulse/Data/bargraph_data_fetch.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    BargraphDataFetch dataFetch = BargraphDataFetch();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),

      body:  SingleChildScrollView(
        child: Column(
          children: [
                  const SizedBox(height: 30,),
                  Container(
                    color: const Color.fromARGB(255, 255, 242, 244),
                    height: 400,
                    width: 500,    
                    child:GrBarGraph(weeklySummary: dataFetch.weeklySummary,)
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color.fromARGB(255, 208, 224, 87),
                    height: 150,
                    width: 500
                  ),
          ],
        ),
      ),
    );
  }
}