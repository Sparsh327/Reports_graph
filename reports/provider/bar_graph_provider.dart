import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/constant.dart';
import '../../_global/provider/firebase_collection.dart';
import 'bar_graph_widget_model.dart';

part 'bar_graph_provider.g.dart';

@riverpod
class BarGraph extends _$BarGraph {
  @override
  FutureOr<List<BarGraphModel>> build() {
    return _barGraphData();
  }

  Future<List<BarGraphModel>> _barGraphData() async {
    BarGraphModel last7DaysSales = BarGraphModel(
      graphData: [],
      graphName: "Last 7 Days Sales",
      bottomNavs: null,
      graphDoc: "Last7DaysSales",
      isDynamic: false,
    );
    BarGraphModel last7DaysOrders = BarGraphModel(
      graphData: [],
      graphName: "Last 7 Days Orders",
      bottomNavs: null,
      graphDoc: "Last7DaysOrders",
      isDynamic: false,
    );
    // BarGraphModel posWiseSales = BarGraphModel(
    //   graphData: [],
    //   graphName: "Sales Vs POS",
    //   bottomNavs: null,
    //   graphDoc: "PosWiseSales",
    //   isDynamic: true,
    // );
    // BarGraphModel posWiseOrders = BarGraphModel(
    //   graphData: [],
    //   graphName: "Orders Vs POS",
    //   bottomNavs: null,
    //   graphDoc: "PosWiseOrders",
    //   isDynamic: true,
    // );
    // BarGraphModel executiveWiseSales = BarGraphModel(
    //   graphData: [],
    //   graphName: "Sales Vs Executive",
    //   bottomNavs: null,
    //   graphDoc: "SalesTeamWiseSales",
    //   isDynamic: true,
    // );
    // BarGraphModel executiveWiseOrders = BarGraphModel(
    //   graphData: [],
    //   graphName: "Orders Vs Executive",
    //   bottomNavs: null,
    //   graphDoc: "SalesTeamWiseOrders",
    //   isDynamic: true,
    // );

    await _getBarGraphData(last7DaysSales);
    await _getBarGraphData(last7DaysOrders);
    // await _getBarGraphData(posWiseOrders);
    // await _getBarGraphData(posWiseSales);
    // await _getBarGraphData(executiveWiseOrders);
    // await _getBarGraphData(executiveWiseSales);

    return [
      last7DaysSales,
      last7DaysOrders,
      // posWiseOrders,
      // posWiseSales,
      // executiveWiseOrders,
      // executiveWiseSales,
    ];
  }

  Future<void> _getBarGraphData(BarGraphModel barGraphData) async {
    final doc = ref
        .read(firebaseCollectionProvider)
        .statsCollectionRef
        .doc(barGraphData.graphDoc);
    final docSnap = await doc.get();
    final data = docSnap.data()!;
    // print(data);

    if (barGraphData.isDynamic == false) {
      for (int i = 0; i < 7; i++) {
        double count = 0;
        switch (i) {
          case 0:
            count = data["today"] ?? 0;
          case 1:
            count = data["yesterday"] ?? 0;
          case 2:
            count = data["d3"] ?? 0;
          case 3:
            count = data["d4"] ?? 0;
          case 4:
            count = data["d5"] ?? 0;
          case 5:
            count = data["d6"] ?? 0;
          case 6:
            count = data["d7"] ?? 0;
        }

        barGraphData.bottomNavs = ["T", "Y", "D3", "D4", "D5", "D6", "D7"];

        barGraphData.graphData.add(
          BarChartGroupData(
            x: i,
            barsSpace: 100,
            barRods: [
              BarChartRodData(
                toY: count,
                width: 20,
                borderRadius: BorderRadius.circular(5),
                color: AppColors.logoColor,
              ),
            ],
          ),
        );
      }
    } else {
      int i = 0;
      List<String> bottomNavss = [];
      bottomNavss.clear();
      barGraphData.graphData.clear();
      data.forEach((key, value) {
        // print('Graph Key - $key');
        // print('Graph Value - $value');
        i++;
        bottomNavss.add(key);
        barGraphData.graphData.add(
          BarChartGroupData(
            x: i,
            barsSpace: 100,
            barRods: [
              BarChartRodData(
                toY: value,
                width: 20,
                borderRadius: BorderRadius.circular(5),
                color: AppColors.logoColor,
              ),
            ],
          ),
        );
      });
      barGraphData.bottomNavs = bottomNavss;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _barGraphData());
  }
}
