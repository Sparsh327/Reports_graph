// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportFilterModelImpl _$$ReportFilterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportFilterModelImpl(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ReportTypeEnumMap, e))
          .toList(),
      sort: $enumDecodeNullable(_$SortTypeEnumMap, json['sort']),
    );

Map<String, dynamic> _$$ReportFilterModelImplToJson(
        _$ReportFilterModelImpl instance) =>
    <String, dynamic>{
      'types': instance.types?.map((e) => _$ReportTypeEnumMap[e]!).toList(),
      'sort': _$SortTypeEnumMap[instance.sort],
    };

const _$ReportTypeEnumMap = {
  ReportType.dailyReport: 'Daily Report',
  ReportType.weeklyReport: 'Weekly Report',
  ReportType.monthlyReport: 'Monthly Report',
};

const _$SortTypeEnumMap = {
  SortType.ascendingOrderBasedOnDates: 'ascendingOrderBasedOnDates',
  SortType.descendingOrderBasedOnDates: 'descendingOrderBasedOnDates',
};
