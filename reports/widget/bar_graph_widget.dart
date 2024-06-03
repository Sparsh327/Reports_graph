import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/context_utils.dart';

class BarGraphWidget extends StatelessWidget {
  ///
  const BarGraphWidget(
      {super.key, required this.data, required this.barGraphName});

  ///
  final List<BarChartGroupData>? data;

  ///
  final String barGraphName;

  @override
  Widget build(BuildContext context) {
    double highestNo = 0;
    double intervals = 0;
    for (int a = 0; a < data!.length; a++) {
      for (int b = 0; b < data![a].barRods.length; b++) {
        // print(data![a].barRods[b].toY);
        if (highestNo < data![a].barRods[b].toY) {
          highestNo = data![a].barRods[b].toY;
        }
      }
    }
    // print("Highest No: $highestNo");
    double maxSize = 0;
    if (highestNo == 0) {
      highestNo = 1000.0;
    } else if (highestNo < 10) {
      highestNo = 20;
    }
    if (highestNo % 2 == 0) {
      maxSize = (highestNo + (highestNo / 8)).roundToDouble();
    } else {
      maxSize = (highestNo + (highestNo / 9)).roundToDouble();
    }
    if (maxSize % 2 == 0) {
      intervals = (maxSize / 2).roundToDouble();
    } else {
      intervals = (maxSize / 3).roundToDouble();
    }

    // print(MediaQuery.of(context).devicePixelRatio);
    // final ratio = context.isMobile
    //     ? 2.0
    //     : context.isMiniTab
    //         ? 1.0
    //         : 3.0;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              barGraphName,
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // const SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.only(left: 30),
          //   child: Text(
          //     "In a week",
          //     style: context.textTheme.bodySmall,
          //   ),
          // ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 0),
            child: AspectRatio(
              aspectRatio: 1.4,
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: maxSize,
                  barGroups: data,
                  borderData: FlBorderData(
                    border: Border.all(color: Colors.transparent),
                  ),
                  gridData: const FlGridData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: _bottomTitles,
                      axisNameSize: 20,
                      drawBelowEverything: false,
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: intervals,
                        getTitlesWidget: (value, _) {
                          return Text(
                            value.toString(),
                            style: const TextStyle(fontSize: 14),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'D1';
              break;
            case 1:
              text = 'D2';
              break;
            case 2:
              text = 'D3';
              break;
            case 3:
              text = 'D4';
              break;
            case 4:
              text = 'D5';
              break;
            case 5:
              text = 'D6';
              break;
            case 6:
              text = 'D7';
              break;
          }

          return Text(
            text,
            style: const TextStyle(fontSize: 12),
          );
        },
      );
}
