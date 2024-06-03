import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converter/timestamp_converter.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
abstract class ReportModel with _$ReportModel {
  @TimestampJsonConverter()
  const factory ReportModel({
    @JsonKey(name: "id") required String? id,
    // aloUsersCount
    @JsonKey(name: 'aloUsersCount') required int? aloUsersCount,
    // aloUsersVsAge
    @JsonKey(name: 'aloUsersVsAge') required Map<String, int>? aloUsersVsAge,
    // aloUsersVsCity
    @JsonKey(name: 'aloUsersVsCity') required Map<String, int>? aloUsersVsCity,
    // aloUsersVsCountry
    @JsonKey(name: 'aloUsersVsCountry')
    required Map<String, int>? aloUsersVsCountry,
    // aloUsersVsGender
    @JsonKey(name: 'aloUsersVsGender')
    required Map<String, int>? aloUsersVsGender,
    // aloUsersVsGenderAndAge
    @JsonKey(name: 'aloUsersVsGenderAndAge')
    required Map<String, int>? aloUsersVsGenderAndAge,
    // aloUsersVsGenderAndAgeAndState
    @JsonKey(name: 'aloUsersVsGenderAndAgeAndState')
    required Map<String, int>? aloUsersVsGenderAndAgeAndState,
    //aloUsersVsGenderAndState
    @JsonKey(name: 'aloUsersVsGenderAndState')
    required Map<String, int>? aloUsersVsGenderAndState,
    // aloUsersVsIsInActiveDate
    @JsonKey(name: 'aloUsersVsIsInActiveDate')
    required Map<String, int>? aloUsersVsIsInActiveDate,
    // aloUsersVsIsInReview
    @JsonKey(name: 'aloUsersVsIsInReview')
    required Map<String, int>? aloUsersVsIsInReview,
    // aloUsersVsIsIncognitoDate
    @JsonKey(name: 'aloUsersVsIsIncognitoDate')
    required Map<String, int>? aloUsersVsIsIncognitoDate,
    // aloUsersVsIsPauseDate
    @JsonKey(name: 'aloUsersVsIsPauseDate')
    required Map<String, int>? aloUsersVsIsPauseDate,
    // aloUsersVsIsProfileGood
    @JsonKey(name: 'aloUsersVsIsProfileGood')
    required Map<String, int>? aloUsersVsIsProfileGood,
    // aloUsersVsIsStudent
    @JsonKey(name: 'aloUsersVsIsStudent')
    required Map<String, int>? aloUsersVsIsStudent,
    // aloUsersVsNoFieldIsProfileGoodAndUid
    @JsonKey(name: 'aloUsersVsNoFieldIsProfileGoodAndUid')
    required Map<String, int>? aloUsersVsNoFieldIsProfileGoodAndUid,
    // aloUsersVsNoPlanAndUid
    @JsonKey(name: 'aloUsersVsNoPlanAndUid')
    required Map<String, int>? aloUsersVsNoPlanAndUid,
    // aloUsersVsPlan
    @JsonKey(name: 'aloUsersVsPlan') required Map<String, int>? aloUsersVsPlan,
    // aloUsersVsPlatform
    @JsonKey(name: 'aloUsersVsPlatform')
    required Map<String, int>? aloUsersVsPlatform,
    // aloUsersVsPreffAge
    @JsonKey(name: 'aloUsersVsPreffAge')
    required Map<String, int>? aloUsersVsPreffAge,
    // aloUsersVsState
    @JsonKey(name: 'aloUsersVsState')
    required Map<String, int>? aloUsersVsState,
    // newUsersCount
    @JsonKey(name: 'newUsersCount') required int? newUsersCount,
    // newUsersVsAge
    @JsonKey(name: 'newUsersVsAge') required Map<String, int>? newUsersVsAge,
    // newUsersVsCity
    @JsonKey(name: 'newUsersVsCity') required Map<String, int>? newUsersVsCity,
    // newUsersVsCountry
    @JsonKey(name: 'newUsersVsCountry')
    required Map<String, int>? newUsersVsCountry,
    // newUsersVsGender
    @JsonKey(name: 'newUsersVsGender')
    required Map<String, int>? newUsersVsGender,
    // newUsersVsGenderAndAge
    @JsonKey(name: 'newUsersVsGenderAndAge')
    required Map<String, int>? newUsersVsGenderAndAge,
    // newUsersVsGenderAndAgeAndState
    @JsonKey(name: 'newUsersVsGenderAndAgeAndState')
    required Map<String, int>? newUsersVsGenderAndAgeAndState,
    // newUsersVsGenderAndState
    @JsonKey(name: 'newUsersVsGenderAndState')
    required Map<String, int>? newUsersVsGenderAndState,
    // newUsersVsIsInActiveDate
    @JsonKey(name: 'newUsersVsIsInActiveDate')
    required Map<String, int>? newUsersVsIsInActiveDate,
    // newUsersVsIsInReview
    @JsonKey(name: 'newUsersVsIsInReview')
    required Map<String, int>? newUsersVsIsInReview,
    // newUsersVsIsIncognitoDate
    @JsonKey(name: 'newUsersVsIsIncognitoDate')
    required Map<String, int>? newUsersVsIsIncognitoDate,
    // newUsersVsIsPauseDate
    @JsonKey(name: 'newUsersVsIsPauseDate')
    required Map<String, int>? newUsersVsIsPauseDate,
    // newUsersVsIsProfileGood
    @JsonKey(name: 'newUsersVsIsProfileGood')
    required Map<String, int>? newUsersVsIsProfileGood,
    // newUsersVsIsStudent
    @JsonKey(name: 'newUsersVsIsStudent')
    required Map<String, int>? newUsersVsIsStudent,
    // newUsersVsNoFieldIsProfileGoodAndUid
    @JsonKey(name: 'newUsersVsNoFieldIsProfileGoodAndUid')
    required Map<String, int>? newUsersVsNoFieldIsProfileGoodAndUid,
    // newUsersVsNoPlanAndUid
    @JsonKey(name: 'newUsersVsNoPlanAndUid')
    required Map<String, int>? newUsersVsNoPlanAndUid,
    // newUsersVsPlan
    @JsonKey(name: 'newUsersVsPlan') required Map<String, int>? newUsersVsPlan,
    // newUsersVsPlatform
    @JsonKey(name: 'newUsersVsPlatform')
    required Map<String, int>? newUsersVsPlatform,
    // newUsersVsPreffAge
    @JsonKey(name: 'newUsersVsPreffAge')
    required Map<String, int>? newUsersVsPreffAge,
    // newUsersVsState
    @JsonKey(name: 'newUsersVsState')
    required Map<String, int>? newUsersVsState,
    // oldUsersAppOpenedUsersCount
    @JsonKey(name: 'oldUsersAppOpenedUsersCount')
    required int? oldUsersAppOpenedUsersCount,

    ///
    @JsonKey(name: 'endDate') required DateTime? endDate,
    @JsonKey(name: 'startDate') required DateTime? startDate,
    @JsonKey(name: 'type') required ReportType? type,
  }) = _ReportModel;
  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);
}

enum ReportType {
  @JsonValue('Daily Report')
  dailyReport,

  @JsonValue('Weekly Report')
  weeklyReport,

  @JsonValue('Monthly Report')
  monthlyReport,
}

extension ReportTypeX on ReportType {
  String get inString {
    switch (this) {
      case ReportType.dailyReport:
        return 'Daily Report';

      case ReportType.weeklyReport:
        return 'Weekly Report';

      case ReportType.monthlyReport:
        return 'Monthly Report';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case ReportType.dailyReport:
        return Colors.blue;

      case ReportType.weeklyReport:
        return Colors.pink;

      case ReportType.monthlyReport:
        return Colors.deepPurpleAccent;
    }
  }
}

extension ReportModelX on ReportModel {
  ReportType get reportType {
    final duration = endDate?.difference(startDate ?? DateTime.now());

    switch (duration) {
      case null:
        return ReportType.dailyReport;

      case > const Duration(days: 25):
        return ReportType.monthlyReport;

      case > const Duration(days: 6):
        return ReportType.weeklyReport;

      default:
        return ReportType.dailyReport;
    }
  }
}
