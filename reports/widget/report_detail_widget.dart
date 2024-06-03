import 'package:flutter/material.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/context_utils.dart';
import '../../dashboard/model/dashboard_model.dart';

class ReportDetailWidget extends StatelessWidget {
  const ReportDetailWidget({
    super.key,
    required this.data,
    required this.title,
    required this.showGraph,
  });
  final Map<String, int> data;
  final String title;
  final bool showGraph;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final key = data.keys.elementAt(index);
                    final value = data.values.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: _DashboardWidget(
                        model: DashboardModel(
                          type: null,
                          count: value,
                          title: key,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardWidget extends StatelessWidget {
  ///
  const _DashboardWidget({required this.model});

  ///
  final DashboardModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      width: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.logoColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              border: Border.all(color: AppColors.logoColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SelectableText(
                      model.title ?? model.type!.inString,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    model.count.toString(),
                    style: context.textTheme.headlineSmall,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
