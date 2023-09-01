import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

class RecommendationProgressGraph extends StatefulWidget {
  const RecommendationProgressGraph({Key? key}) : super(key: key);

  @override
  _RecommendationProgressGraph createState() => _RecommendationProgressGraph();
}

class _RecommendationProgressGraph extends State<RecommendationProgressGraph> {
  List<Color> get gradientColors => [Color(0xff5EA4E3), Color(0xffE6F1FA)];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.1,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AutoSizeText(
                    'Total Cholesterol Monthly Tracker',
                    maxLines: 3,
                    style: TextStyle(
                      color: cl1A1A1A,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '1 July - 31 July 2021',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(child: LineChart(lineChartData())),
              ],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData lineChartData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
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
      //   rightTitles: SideTitles(showTitles: false),
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
            show: true,
            // colors:
            //     gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
