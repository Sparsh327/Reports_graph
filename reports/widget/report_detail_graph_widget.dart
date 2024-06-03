import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/constant.dart';

class ReportDetailGraphWidget extends StatelessWidget {
  const ReportDetailGraphWidget({
    super.key,
    required this.data,
    required this.title,
  });
  final Map<String, int> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 320,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            title: ChartTitle(text: title),
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
              labelFormat: '{value}',
              majorTickLines: MajorTickLines(size: 0),
            ),
            series: [
              ColumnSeries<ChartSampleData, String>(
                dataSource: <ChartSampleData>[
                  for (final key in data.keys)
                    ChartSampleData(
                      key,
                      data[key] ?? 0,
                    ),
                ],
                xValueMapper: (datum, index) => datum.x,
                yValueMapper: (datum, index) => datum.y,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                color: AppColors.logoColor,
              ),
            ],
            tooltipBehavior: TooltipBehavior(
              enable: true,
              header: '',
              canShowMarker: false,
            ),
          ),
        ),
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(this.x, this.y);
  final String x;
  final int y;
}
