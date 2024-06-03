import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/context_utils.dart';
import '../provider/bar_graph_widget_model.dart';

class SideWaysBarGraphWidget extends StatelessWidget {
  ///
  const SideWaysBarGraphWidget({
    super.key,
    required this.graphModel,
  });

  ///
  // final List<BarChartGroupData>? data;

  ///
  final BarGraphModel graphModel;

  @override
  Widget build(BuildContext context) {
    double highestNo = 0;
    double intervals = 0;
    // print(data);
    // if (data!.isEmpty) {
    //   highestNo = 1000.0;
    // } else {
    //   for (int a = 0; a < data!.length; a++) {
    //     for (int b = 0; b < data![a].barRods.length; b++) {
    //       print(data![a].barRods[b].toY);
    //       if (highestNo < data![a].barRods[b].toY) {
    //         highestNo = data![a].barRods[b].toY;
    //       }
    //     }
    //   }
    // }

    for (int a = 0; a < graphModel.graphData.length; a++) {
      for (int b = 0; b < graphModel.graphData[a].barRods.length; b++) {
        // print(data![a].barRods[b].toY);
        if (highestNo < graphModel.graphData[a].barRods[b].toY) {
          highestNo = graphModel.graphData[a].barRods[b].toY;
        }
      }
    }

    if (highestNo == 0) {
      highestNo = 1000.0;
    } else if (highestNo < 15) {
      highestNo = 16;
    }

    // print("Highest No: $highestNo");
    double maxSize = 0;
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
    double resSize = 40;
    if (maxSize.toString().length > 4 && maxSize.toString().length < 6) {
      resSize = 60;
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
              graphModel.graphName!,
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
              aspectRatio: 1.2,
              child: BarChart(
                BarChartData(
                  backgroundColor: Colors.white,
                  minY: 0,
                  maxY: maxSize,
                  barGroups: graphModel.graphData,
                  borderData: FlBorderData(
                    border: Border.all(color: Colors.transparent),
                  ),
                  gridData: const FlGridData(show: false),
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
                        reservedSize: resSize,
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
          // print("Val 1 - ${value.toInt()}");

          // if (value.toInt() > graphModel.bottomNavs!.length - 1) {
          //   print("Code 1");
          //   text = "";
          // } else {
          //   print("Code 2");
          //   text = graphModel.bottomNavs![value.toInt()];
          //   print("Val 2 - ${graphModel.bottomNavs![value.toInt()]}");
          // }
          // print("Val 3 - ${value.toInt()}");

          // for (int i = 0; i < graphModel.bottomNavs!.length; i++) {
          //   text = graphModel.bottomNavs![i];
          //   print(object)
          // }
          if (graphModel.isDynamic!) {
            switch (value.toInt()) {
              case 0:
                text = graphModel.bottomNavs![value.toInt() - 1];
                break;
              case 1:
                text = graphModel.bottomNavs![value.toInt() - 1];
                break;
              case 2:
                text = graphModel.bottomNavs![value.toInt() - 1];
                break;
              case 3:
                text = graphModel.bottomNavs![value.toInt() - 1];
                break;
              case 4:
                text = graphModel.bottomNavs![value.toInt() - 1];
                break;
              case 5:
                text = graphModel.bottomNavs![value.toInt() - 1];
                break;
              case 6:
                text = graphModel.bottomNavs![value.toInt()];
                break;
            }
          } else {
            switch (value.toInt()) {
              case 0:
                text = graphModel.bottomNavs![value.toInt()];
                break;
              case 1:
                text = graphModel.bottomNavs![value.toInt()];
                break;
              case 2:
                text = graphModel.bottomNavs![value.toInt()];
                break;
              case 3:
                text = graphModel.bottomNavs![value.toInt()];
                break;
              case 4:
                text = graphModel.bottomNavs![value.toInt()];
                break;
              case 5:
                text = graphModel.bottomNavs![value.toInt()];
                break;
              case 6:
                text = graphModel.bottomNavs![value.toInt()];
                break;
            }
          }

          return Text(
            text,
            style: const TextStyle(fontSize: 12),
          );
        },
      );
}
