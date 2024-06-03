import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/constant.dart';
import '../../_global/enum/pagination_enum.dart';
import '../../_global/enum/sort_enum.dart';
import '../model/report_filter_model.dart';
import '../model/report_model.dart';
import '../repository/report_repository.dart';

part 'report_provider.g.dart';

@riverpod
class Report extends _$Report {
  @override
  FutureOr<List<ReportModel>> build() {
    return _getData();
  }

  Future<List<ReportModel>> _getData() async {
    Query<ReportModel> queryRes = ref
        .read(reportRepositoryProvider)
        .orderBy('createdAt', descending: true);

    final limit = ref.read(limitReportProvider);

    final res = await queryRes.limit(limit).get();

    final list = res.docs.map((e) => e.data()).toList();

    if (list.isNotEmpty) {
      _lastDoc = res.docs.last;
    }

    _resetPagination(res.docs);

    return list;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getData());
  }

  final _list = <ReportModel>[];

  Future<void> searchByQuery(String query) async {
    final filter = ref.read(reportFilterProvider);

    if (query.trim().isNotEmpty || filter.isFilterApplied) {
      if (_list.isEmpty) {
        _list.addAll(state.value ?? []);
      }
      state = const AsyncLoading();
      Query<ReportModel> queryRes = ref.read(reportRepositoryProvider);

      if (filter.sort != null) {
        queryRes = queryRes.orderBy(
          'createdAt',
          descending: filter.sort! == SortType.descendingOrderBasedOnDates,
        );
      }
      final res = await queryRes.get();
      var list = res.docs.map((e) => e.data()).toList();

      if (filter.types?.isNotEmpty ?? false) {
        list = list.where((e) => filter.types!.contains(e.reportType)).toList();
      }

      state = AsyncData(list);
      ref.read(loadMoreReportProvider.notifier).setState(PaginationEnum.empty);
    } else {
      if (_list.isNotEmpty) {
        state = AsyncData([..._list]);
        _resetPagination(_list);
        _list.clear();
      }
    }
  }

  void _resetPagination(List res) {
    final limit = ref.read(limitReportProvider);

    if (res.length < limit) {
      ref.read(loadMoreReportProvider.notifier).setState(PaginationEnum.empty);
      _lastDoc = null;
    } else {
      ref
          .read(loadMoreReportProvider.notifier)
          .setState(PaginationEnum.initial);
    }
  }

  QueryDocumentSnapshot<ReportModel>? _lastDoc;

  Future<void> loadMore() async {
    ref.read(loadMoreReportProvider.notifier).setState(PaginationEnum.loading);

    Query<ReportModel> queryRes = ref.read(reportRepositoryProvider);

    final limit = ref.read(limitReportProvider);
    final res = await queryRes
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .startAfterDocument(_lastDoc!)
        .get();

    var list = res.docs.map((e) => e.data()).toList();

    _lastDoc = res.docs.last;

    state = AsyncData([...?state.value, ...list]);

    if (res.docs.length < limit) {
      ref.read(loadMoreReportProvider.notifier).setState(PaginationEnum.empty);
      _lastDoc = null;
    } else {
      ref
          .read(loadMoreReportProvider.notifier)
          .setState(PaginationEnum.initial);
    }
  }
}

@Riverpod(keepAlive: true)
class LimitReport extends _$LimitReport {
  @override
  int build() {
    return kLimits.first;
  }

  void setLimit(int limit) {
    state = limit;
    ref.read(reportProvider.notifier).refresh();
  }
}

@Riverpod(keepAlive: true)
class LoadMoreReport extends _$LoadMoreReport {
  @override
  PaginationEnum build() {
    return PaginationEnum.initial;
  }

  void setState(PaginationEnum val) {
    state = val;
  }
}

@riverpod
class ReportFilter extends _$ReportFilter {
  @override
  ReportFilterModel build() {
    return ReportFilterModel.empty();
  }

  void set(ReportFilterModel model) {
    state = model;
    ref.read(reportProvider.notifier).searchByQuery('');
  }

  void clear() {
    state = ReportFilterModel.empty();
    ref.read(reportProvider.notifier).searchByQuery('');
  }
}
