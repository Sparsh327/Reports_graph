import 'package:freezed_annotation/freezed_annotation.dart';

import '../../_global/enum/sort_enum.dart';
import 'report_model.dart';

part 'report_filter_model.freezed.dart';
part 'report_filter_model.g.dart';

@freezed
abstract class ReportFilterModel with _$ReportFilterModel {
  const factory ReportFilterModel({
    required List<ReportType>? types,
    required SortType? sort,
  }) = _ReportFilterModel;
  factory ReportFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ReportFilterModelFromJson(json);

  factory ReportFilterModel.empty() => const ReportFilterModel(
        types: null,
        sort: null,
      );
}

extension ReportFilterModelX on ReportFilterModel {
  bool get isFilterApplied {
    return (types?.isNotEmpty ?? false) || sort != null;
  }
}
