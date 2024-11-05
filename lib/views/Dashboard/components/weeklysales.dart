import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:webnet_app/const/constants.dart';

//const double defaultpadding = 16.0; // Define your default padding constant or import it

class WeeklySales extends StatelessWidget {
  const WeeklySales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(defaultpadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            
            SizedBox(
              height: 250, // Set a fixed height for the BarChart
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toInt().toString(),
                              style: const TextStyle(fontSize: 12));
                        },
                        interval: 200, // Adjust based on your data
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Thu-09-2024',
                                  style: TextStyle(fontSize: 12));
                            case 1:
                              return const Text('Sun-09-2024',
                                  style: TextStyle(fontSize: 12));
                            case 2:
                              return const Text('Wed-09-2024',
                                  style: TextStyle(fontSize: 12));
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 1000,
                          color: Colors.blue,
                          width: 20,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 500,
                          color: Colors.blue,
                          width: 20,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 700,
                          color: Colors.blue,
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
