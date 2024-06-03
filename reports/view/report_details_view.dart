import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../dashboard/model/dashboard_model.dart';
import '../../dashboard/widget/dashboard_widget.dart';
import '../model/report_model.dart';
import '../widget/report_detail_graph_widget.dart';

class ReportDetailsView extends HookConsumerWidget {
  ///
  const ReportDetailsView(this.model, {super.key});

  ///
  static const route = 'details';

  final ReportModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          model.reportType.inString,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    DashboardWidget(
                      model: DashboardModel(
                        type: DashboardType.users,
                        count: model.aloUsersCount,
                        title: 'App Last Open Users',
                      ),
                    ),
                    DashboardWidget(
                      model: DashboardModel(
                        type: DashboardType.users,
                        count: model.newUsersCount,
                        title: 'New Users',
                      ),
                    ),
                    DashboardWidget(
                      model: DashboardModel(
                        type: DashboardType.users,
                        count: model.oldUsersAppOpenedUsersCount,
                        title: 'Old Users App Opened Users',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                ReportDetailGraphWidget(
                  title: 'App Last Open Users Vs Age',
                  data: model.aloUsersVsAge ?? {},
                ),
                ReportDetailGraphWidget(
                  title: 'App Last Open Users Vs City',
                  data: model.aloUsersVsCity ?? {},
                ),
                ReportDetailGraphWidget(
                  title: 'App Last Open Users Vs Country',
                  data: model.aloUsersVsCountry ?? {},
                ),
                //aloUsersVsGender
                ReportDetailGraphWidget(
                  title: 'App Last Open Users Vs Gender',
                  data: model.aloUsersVsGender ?? {},
                ),
                // aloUsersVsGenderAndAge
                ReportDetailGraphWidget(
                  title: 'App Last Open Users Vs Gender And Age',
                  data: model.aloUsersVsGenderAndAge ?? {},
                ),
                // aloUsersVsGenderAndAgeAndState
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Gender And Age And State',
                  data: model.aloUsersVsGenderAndAgeAndState ?? {},
                ),
                // aloUsersVsGenderAndState
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Gender And State',
                  data: model.aloUsersVsGenderAndState ?? {},
                ),
                // aloUsersVsIsInActiveDate
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Is In Active Date',
                  data: model.aloUsersVsIsInActiveDate ?? {},
                ),
                // aloUsersVsIsInReview
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Is In Review',
                  data: model.aloUsersVsIsInReview ?? {},
                ),
                // aloUsersVsIsIncognitoDate
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Is Incognito Date',
                  data: model.aloUsersVsIsIncognitoDate ?? {},
                ),
                // aloUsersVsIsPauseDate
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Is Pause Date',
                  data: model.aloUsersVsIsPauseDate ?? {},
                ),
                // aloUsersVsIsProfileGood
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Is Profile Good',
                  data: model.aloUsersVsIsProfileGood ?? {},
                ),
                // aloUsersVsIsStudent
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Is Student',
                  data: model.aloUsersVsIsStudent ?? {},
                ),
                // aloUsersVsNoFieldIsProfileGoodAndUid
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs No Field Is Profile Good And Uid',
                  data: model.aloUsersVsNoFieldIsProfileGoodAndUid ?? {},
                ),
                // aloUsersVsNoPlanAndUid
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs No Plan And Uid',
                  data: model.aloUsersVsNoPlanAndUid ?? {},
                ),
                // aloUsersVsPlan
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Plan',
                  data: model.aloUsersVsPlan ?? {},
                ),
                // aloUsersVsPlatform
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Platform',
                  data: model.aloUsersVsPlatform ?? {},
                ),
                // aloUsersVsPreffAge
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs Preff Age',
                  data: model.aloUsersVsPreffAge ?? {},
                ),
                // aloUsersVsState
                ReportDetailGraphWidget(
                  title: 'App Last Open Vs State',
                  data: model.aloUsersVsState ?? {},
                ),
                // newUsersVsAge
                ReportDetailGraphWidget(
                  title: 'New Users Vs Age',
                  data: model.newUsersVsAge ?? {},
                ),
                // newUsersVsCity
                ReportDetailGraphWidget(
                  title: 'New Users Vs City',
                  data: model.newUsersVsCity ?? {},
                ),
                // newUsersVsCountry
                ReportDetailGraphWidget(
                  title: 'New Users Vs Country',
                  data: model.newUsersVsCountry ?? {},
                ),
                // newUsersVsGender
                ReportDetailGraphWidget(
                  title: 'New Users Vs Gender',
                  data: model.newUsersVsGender ?? {},
                ),
                // newUsersVsGenderAndAge
                ReportDetailGraphWidget(
                  title: 'New Users Vs Gender And Age',
                  data: model.newUsersVsGenderAndAge ?? {},
                ),
                // newUsersVsGenderAndAgeAndState
                ReportDetailGraphWidget(
                  title: 'New Users Vs Gender And City And State',
                  data: model.newUsersVsGenderAndAgeAndState ?? {},
                ),
                // newUsersVsGenderAndState
                ReportDetailGraphWidget(
                  title: 'New Users Vs Gender And State',
                  data: model.newUsersVsGenderAndState ?? {},
                ),
                // newUsersVsIsInActiveDate
                ReportDetailGraphWidget(
                  title: 'New Users Vs Is In Active Date',
                  data: model.newUsersVsIsInActiveDate ?? {},
                ),
                // newUsersVsIsInReview
                ReportDetailGraphWidget(
                  title: 'New Users Vs Is In Review',
                  data: model.newUsersVsIsInReview ?? {},
                ),
                // newUsersVsIsIncognitoDate
                ReportDetailGraphWidget(
                  title: 'New Users Vs Is Incognito Date',
                  data: model.newUsersVsIsIncognitoDate ?? {},
                ),

                // newUsersVsIsPauseDate
                ReportDetailGraphWidget(
                  title: 'New Users Vs Is Pause Date',
                  data: model.newUsersVsIsPauseDate ?? {},
                ),

                // newUsersVsIsProfileGood
                ReportDetailGraphWidget(
                  title: 'New Users Vs Is Profile Good',
                  data: model.newUsersVsIsProfileGood ?? {},
                ),

                // newUsersVsIsStudent
                ReportDetailGraphWidget(
                  title: 'New Users Vs Is Student',
                  data: model.newUsersVsIsStudent ?? {},
                ),
                // newUsersVsNoFieldIsProfileGoodAndUid
                ReportDetailGraphWidget(
                  title: 'New Users Vs No Field Is Profile Good And Uid',
                  data: model.newUsersVsNoFieldIsProfileGoodAndUid ?? {},
                ),
                // newUsersVsNoPlanAndUid
                ReportDetailGraphWidget(
                  title: 'New Users Vs No Plan And Uid',
                  data: model.newUsersVsNoPlanAndUid ?? {},
                ),
                // newUsersVsPlan
                ReportDetailGraphWidget(
                  title: 'New Users Vs Plan',
                  data: model.newUsersVsPlan ?? {},
                ),
                // newUsersVsPlatform
                ReportDetailGraphWidget(
                  title: 'New Users Vs Platform',
                  data: model.newUsersVsPlatform ?? {},
                ),
                // newUsersVsPreffAge
                ReportDetailGraphWidget(
                  title: 'New Users Vs Preff Age',
                  data: model.newUsersVsPreffAge ?? {},
                ),
                // newUsersVsState
                ReportDetailGraphWidget(
                  title: 'New Users Vs State',
                  data: model.newUsersVsState ?? {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
