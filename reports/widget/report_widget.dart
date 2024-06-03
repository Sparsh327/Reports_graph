import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/date_time_utils.dart';
import '../model/report_model.dart';
import '../view/report_details_view.dart';
import '../view/report_view.dart';

class ReportWidget extends StatelessWidget {
  ///
  const ReportWidget({super.key, required this.model});

  final ReportModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.isMobile ? 4 : 12),
      child: GestureDetector(
        onTap: () {
          context.go(
            '${ReportsView.route}/${ReportDetailsView.route}',
            extra: model,
          );
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(context.isMobile ? 12 : 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: model.reportType.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  child: Text(
                    model.reportType.inString,
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '(${model.startDate?.inString} - ${model.endDate?.inString})',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
