// import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/context_utils.dart';
import '../../_global/widget/dropdown_widget.dart';
import '../../_global/widget/filter_button.dart';
import '../../_global/widget/loading_widget.dart';
import '../../_global/widget/message_widget.dart';
// import '../../_global/widget/action_widget.dart';
import '../../_global/widget/pagination_widget.dart';
import '../model/report_filter_model.dart';
// import '../provider/dashboard_provider.dart';
import '../provider/report_provider.dart';
import '../widget/report_filter_dialog.dart';
import '../widget/report_widget.dart';
// import '../widget/dashboard_widget.dart';

class ReportsView extends HookConsumerWidget {
  ///
  const ReportsView({super.key});

  ///
  static const route = '/reports';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = useTextEditingController();

    // /// for searching data
    // void onSubmit(String val) {
    //   // ref.read(orderProvider.notifier).searchByQuery(val);
    //   controller.text = val;
    // }

    // void refresh() {
    //   ref
    //     ..refresh(barGraphProvider.notifier).refresh()
    //     ..refresh(dashboardProvider.notifier).refresh();
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: context.isDesktop
            ? null
            : IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu_rounded),
              ),
        titleSpacing: context.isMobile ? -4 : null,
        title: const Text(
          "Reports",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // actions: [
        //   if (context.isDesktop || context.isLargeTab) ...[
        //     if (ref.read(canEditProductsProvider)) ...[
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 12),
        //         child: FilledButton(
        //           onPressed: () {
        //             // generateExcel();
        //           },
        //           child: const Text("Generate Report"),
        //         ),
        //       ),
        //       RefreshButton(onRefresh: refresh),
        //     ],
        //   ] else if (context.isMobile || context.isMiniTab) ...[
        //     IconButton(
        //       onPressed: () {
        //         // generateExcel();
        //       },
        //       icon: const Icon(Icons.auto_graph_rounded),
        //     ),
        //     IconButton(
        //       onPressed: refresh,
        //       icon: const Icon(Icons.refresh),
        //     )
        //   ]
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Wrap(
            //       spacing: 24,
            //       runSpacing: 24,
            //       children: [
            //         for (final i in res.value ?? []) DashboardWidget(model: i),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 18),
            // Consumer(builder: (context, ref, child) {
            //   final barGraph = ref.watch(barGraphProvider);
            //   return barGraph.map(
            //     data: (data) {
            //       final list = data.value;
            //       if (data.value.isEmpty) {
            //         return const MessageWidget(title: "No data found");
            //       } else {
            //         if (context.isMobile || context.isMiniTab) {
            //           return Padding(
            //             padding: const EdgeInsets.all(40),
            //             child: Container(
            //               constraints: const BoxConstraints(maxWidth: 340),
            //               child: Column(
            //                 children: [
            //                   for (int i = 0; i < list.length; i++) ...[
            //                     BarGraphWidget(
            //                       data: list[i].graphData,
            //                       barGraphName: list[i].graphName!,
            //                     ),
            //                     const SizedBox(
            //                       height: 50,
            //                     ),
            //                   ]
            //                 ],
            //               ),
            //             ),
            //           );
            //         } else {
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(
            //               horizontal: 160,
            //               vertical: 20,
            //             ),
            //             child: GridView.count(
            //               crossAxisCount: 2,
            //               childAspectRatio: 1,
            //               crossAxisSpacing: 60,
            //               mainAxisSpacing: 80,
            //               shrinkWrap: true,
            //               primary: false,
            //               scrollDirection: Axis.vertical,
            //               children: [
            //                 for (int i = 0; i < list.length; i++) ...[
            //                   SideWaysBarGraphWidget(
            //                     graphModel: list[i],
            //                   ),
            //                 ]
            //               ],
            //             ),
            //           );
            //         }
            //       }
            //     },
            //     error: (error) {
            //       return const MessageWidget(title: kSomethingWentWrong);
            //     },
            //     loading: (loading) => const LoadingWidget(),
            //   );
            // }),
            SizedBox(height: context.isMobile ? 12 : 24),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.isMobile ? 18 : 36,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, child) {
                      final isFilter =
                          ref.watch(reportFilterProvider).isFilterApplied;
                      return FilterButton(
                        onTap: () {
                          showReportFilterDialog(context);
                        },
                        isFilter: isFilter,
                      );
                    },
                  ),
                  const SizedBox(width: 24),
                  Consumer(
                    builder: (context, ref, child) {
                      final selected = ref.watch(limitReportProvider);
                      final isFilter =
                          ref.watch(reportFilterProvider).isFilterApplied;
                      if (isFilter) {
                        return const SizedBox();
                      }
                      return DropDownWidget<int>(
                        title: null,
                        list: kLimits,
                        selected: selected,
                        onChange:
                            ref.read(limitReportProvider.notifier).setLimit,
                        getString: (p0) => 'View $p0',
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Consumer(
              builder: (context, ref, child) {
                final pagination = ref.watch(loadMoreReportProvider);
                final data = ref.watch(reportProvider);
                return data.map(
                  data: (data) {
                    if (data.value.isEmpty) {
                      return const MessageWidget(title: "No data found");
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.isMobile ? 18 : 36,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final i in data.value) ReportWidget(model: i),
                          const SizedBox(height: 12),
                          Center(
                            child: PaginationWidget(
                              paginationEnum: pagination,
                              onLoadMore:
                                  ref.read(reportProvider.notifier).loadMore,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    );
                  },
                  error: (error) {
                    return const MessageWidget(
                      title: kSomethingWentWrong,
                    );
                  },
                  loading: (loading) => const LoadingWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
