import 'package:fl_chart/fl_chart.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../../core/converter/timestamp_converter.dart';

// part 'bar_graph_widget_model.g.dart';

// part 'user_model.freezed.dart';
// part 'user_model.g.dart';

class BarGraphModel {
  String? graphName;
  List<BarChartGroupData> graphData;
  String? graphDoc;
  List<String>? bottomNavs;
  bool? isDynamic;

  BarGraphModel({
    required this.graphName,
    required this.graphData,
    required this.graphDoc,
    required this.bottomNavs,
    required this.isDynamic,
  });
}

// class BarGraphModel {
//   String? graphName;
//   String? graphDoc;
//   List<BarChartGroupData>? graphData;
//   List<String>? bottomNavs;

//   BarGraphModel({
//     required this.graphData,
//     required this.graphName,
//     required this.bottomNavs,
//     required this.graphDoc,
//   });
// }
