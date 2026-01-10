import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../localization/controllers/localization_controller.dart';
import 'months_names.dart';

// ignore: avoid_classes_with_only_static_members
class DateConverter {
  static String formateDateWithMonthAsString(String? date) {
    // example: 2021-07-25T07:29:26.888491Z
    if (date == null) {
      return '';
    }
    if (date.isEmpty) {
      return '';
    }
    final DateTime dateTime = DateTime.parse(date);

    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    if (locale == const Locale('ar')) {
      return '${dateTime.day} ${MonthsNames.getMonthName(dateTime.month.toString(), true)!}، ${dateTime.year}';
    } else {
      return '${MonthsNames.getMonthName(dateTime.month.toString(), false)!} ${dateTime.day}, ${dateTime.year}';
    }
  }

  static String formateTimeWithStartDateAndEndDateAsString({
    required String? startDate,
    required String? endDate,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    if (startDate == null || endDate == null) {
      return '';
    }
    if (startDate.isEmpty || endDate.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime startDateTime = DateTime.parse(startDate);

    final DateTime endDateTime = DateTime.parse(endDate);

    final String startTimeFormated = DateFormat(
      'h.mm a',
      locale.languageCode,
    ).format(startDateTime);

    final String endTimeFormated = DateFormat(
      'h.mm a',
      locale.languageCode,
    ).format(endDateTime);

    return '$startTimeFormated - $endTimeFormated';
    // 10.00 AM - 4.00 PM
  }

  static String formateDateWithMonthAndDayAsString({required String? date}) {
    // example: 2021-07-25T07:29:26.888491Z
    if (date == null) {
      return '';
    }
    if (date.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime dateTime = DateTime.parse(date);

    final String monthAndDayFormated = DateFormat(
      'MMMM d',
      locale.languageCode,
    ).format(dateTime);

    return monthAndDayFormated;
    // February 4
  }

  static String formateDateWithMonthAndYearAsString({required DateTime date}) {
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    // final DateTime dateTime = DateTime.now();

    final String monthAndyearFormated = DateFormat(
      'MMMM yyyy',
      locale.languageCode,
    ).format(date);

    return monthAndyearFormated;
    // February 2023
  }

  static String formateDateWithMonthAndDayAndYearAsString({
    required String? date,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    if (date == null) {
      return '';
    }
    if (date.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime dateTime = DateTime.parse(date);

    final String monthAndDayFormated = DateFormat(
      'MM/dd/yyyy',
      locale.languageCode,
    ).format(dateTime);

    return monthAndDayFormated;
    // 7/01/2022
  }

  static String formateDateWithMonthAndDayAndYearDashSepratedAsString({
    required DateTime date,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final String monthAndDayFormated = DateFormat(
      'dd-MM-yyyy',
      locale.languageCode,
    ).format(date);

    return monthAndDayFormated;
    // 25-11-2022
  }

  static String formateDateWithYearAndMonthAndDayAsString({
    required String? date,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    if (date == null) {
      return '';
    }
    if (date.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime dateTime = DateTime.parse(date);

    final String monthAndDayFormated = DateFormat(
      'yyyy-MM-dd',
      locale.languageCode,
    ).format(dateTime);

    return monthAndDayFormated;
    // 7/01/2022
  }

  static String dateToString(DateTime? dateTime, String format) {
    return dateTime == null ? '' : DateFormat(format).format(dateTime);
  }

  static DateTime stringToDate(String date, String format) {
    final formatter = DateFormat(format);
    final dateTimeFromStr = formatter.parse(date);
    return dateTimeFromStr;
  }

  static String formatDate(String? date, String dataFormat, String format) {
    if (date == null) {
      return '';
    }
    final formatter = DateFormat(dataFormat);
    final dateTimeFromStr = formatter.parse(date);
    return DateFormat(format).format(dateTimeFromStr);
  }

  static String formateTimeWithStartDateAndEndDateAsStringwithTwoDots({
    required String? startDate,
    required String? endDate,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    if (startDate == null || endDate == null) {
      return '';
    }
    if (startDate.isEmpty || endDate.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime startDateTime = DateTime.parse(startDate);

    final DateTime endDateTime = DateTime.parse(endDate);

    final String startTimeFormated = DateFormat(
      'h:mm a',
      locale.languageCode,
    ).format(startDateTime);

    final String endTimeFormated = DateFormat(
      'h:mm a',
      locale.languageCode,
    ).format(endDateTime);

    return '$startTimeFormated - $endTimeFormated';
    // 10:00 AM - 4:00 PM
  }

  static String formateDateWithYearAndMonthAndDayAsStringJustYearTwoNum({
    required String? date,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    if (date == null) {
      return '';
    }
    if (date.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime dateTime = DateTime.parse(date);

    final String monthAndDayFormated = DateFormat(
      'dd/MM/yy',
      locale.languageCode,
    ).format(dateTime);

    return monthAndDayFormated;
    // 7/01/22
  }

  static String formateDateWithYearAndMonthAndDayAsStringJustYear({
    required String? date,
  }) {
    // example: 2021-07-25T07:29:26.888491Z
    if (date == null) {
      return '';
    }
    if (date.isEmpty) {
      return '';
    }
    final Locale locale =
        LocalizationController.to.currentLocale ?? const Locale('en');

    final DateTime dateTime = DateTime.parse(date);

    final String monthAndDayFormated = DateFormat(
      'dd/MM/yyyy',
      locale.languageCode,
    ).format(dateTime);

    return monthAndDayFormated;
    // 7/01/2022
  }
}
