import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';
import 'package:nutrinowapp/helper/arithmetic.dart';

class GenericDiaryPageProgressChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: goldenRatioLarge(size.width),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: lineChart(),
    );
  }

  Widget lineChart() {
    return Container(
      padding: EdgeInsets.only(right: 22.0, bottom: 20),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          // titlesData: FlTitlesData(
          //   show: true,
          //   rightTitles: SideTitles({showTitles: false),
          //   bottomTitles: SideTitles(
          //     showTitles: true,
          //     reservedSize: 22,
          //     interval: 1,
          //     getTextStyles: (context, value) => TextStyle(
          //       color: Colors.grey.shade400,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 12,
          //     ),
          //     getTitles: (value) {
          //       switch (value.toInt()) {
          //         case 2:
          //           return 'MAR';
          //         case 5:
          //           return 'JUN';
          //         case 8:
          //           return 'SEP';
          //       }
          //       return '';
          //     },
          //     margin: 8,
          //   ),
          //   topTitles: (SideTitles(showTitles: false)),
          //   leftTitles: SideTitles(
          //     showTitles: true,
          //     interval: 1,
          //     getTextStyles: (context, value) => TextStyle(
          //       color: Colors.grey.shade400,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 12,
          //     ),
          //     getTitles: (value) {
          //       switch (value.toInt()) {
          //         case 1:
          //           return '10k';
          //         case 3:
          //           return '30k';
          //         case 5:
          //           return '50k';
          //       }
          //       return '';
          //     },
          //     reservedSize: 32,
          //     margin: 12,
          //   ),
          // ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white, width: 1),
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              // colors: gradientColors,
              // gradientFrom: Offset(1.0, 1.0),
              // gradientTo: Offset(-1.0, -1.0),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: false,
                // colors: gradientColors
                //     .map((color) => color.withOpacity(0.3))
                //     .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> get gradientColors => [clF3A2A2, clF39A9A];
}
