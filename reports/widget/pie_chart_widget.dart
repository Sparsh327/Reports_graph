import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/context_utils.dart';

class PieChartWidget extends ConsumerWidget {
  const PieChartWidget({
    required this.title,
    required this.data,
    super.key,
  });

  final Map<String, int> data;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = data.values
        .toList()
        .fold(0, (previousValue, element) => previousValue + element);

    Color getColor(int i) {
      return kColorList[i % kColorList.length];
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: 296,
        child: DecoratedBox(
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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                if (total == 0)
                  const Center(
                    child: Text('No Data Present'),
                  )
                else
                  AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 1,
                        sections: [
                          for (int i = 0; i < data.keys.length; i++)
                            PieChartSectionData(
                              color: getColor(i),
                              value: data.values.elementAt(i).toDouble(),
                              title:
                                  "${((data.values.elementAt(i) / total) * 100).toStringAsFixed(0)} %",
                              titleStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                for (int i = 0; i < data.keys.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Indicator(
                      color: getColor(i),
                      text:
                          "${data.keys.elementAt(i)}: ${NumberFormat.compact().format(data.values.elementAt(i))}",
                    ),
                  ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    this.size = 12,
    this.textColor,
  });
  final Color color;
  final String text;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
