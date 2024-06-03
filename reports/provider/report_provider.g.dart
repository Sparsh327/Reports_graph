// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportHash() => r'f82a1f2686b4aebc2dfc4990c6ca33e7a034153c';

/// See also [Report].
@ProviderFor(Report)
final reportProvider =
    AutoDisposeAsyncNotifierProvider<Report, List<ReportModel>>.internal(
  Report.new,
  name: r'reportProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$reportHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Report = AutoDisposeAsyncNotifier<List<ReportModel>>;
String _$limitReportHash() => r'c2f61f3384c6f63e846909b91909a0a0b3a1a7e1';

/// See also [LimitReport].
@ProviderFor(LimitReport)
final limitReportProvider = NotifierProvider<LimitReport, int>.internal(
  LimitReport.new,
  name: r'limitReportProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$limitReportHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LimitReport = Notifier<int>;
String _$loadMoreReportHash() => r'f01d8062e4c74b3102d89c61dc05a9c1acc428e4';

/// See also [LoadMoreReport].
@ProviderFor(LoadMoreReport)
final loadMoreReportProvider =
    NotifierProvider<LoadMoreReport, PaginationEnum>.internal(
  LoadMoreReport.new,
  name: r'loadMoreReportProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadMoreReportHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadMoreReport = Notifier<PaginationEnum>;
String _$reportFilterHash() => r'7efc36512bed0130864af65a8b7480000a694b34';

/// See also [ReportFilter].
@ProviderFor(ReportFilter)
final reportFilterProvider =
    AutoDisposeNotifierProvider<ReportFilter, ReportFilterModel>.internal(
  ReportFilter.new,
  name: r'reportFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$reportFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReportFilter = AutoDisposeNotifier<ReportFilterModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
