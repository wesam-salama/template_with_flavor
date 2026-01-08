// ignore_for_file: avoid_classes_with_only_static_members

class MonthsNames {
  static const Map<String, String> _englishMonths = <String, String>{
    '1': 'Jan',
    '2': 'Feb',
    '3': 'Mar',
    '4': 'Apr',
    '5': 'May',
    '6': 'Jun',
    '7': 'Jul',
    '8': 'Aug',
    '9': 'Sep',
    '10': 'Oct',
    '11': 'Nov',
    '12': 'Dec'
  };

  static const Map<String, String> _arabicMonths = <String, String>{
    '1': 'يناير',
    '2': 'فبراير',
    '3': 'مارس',
    '4': 'أبريل',
    '5': 'مايو',
    '6': 'يونيو',
    '7': 'يوليو',
    '8': 'أغسطس',
    '9': 'سبتمبر',
    '10': 'أكتوبر',
    '11': 'نوفمبر',
    '12': 'ديسمبر'
  };

  static String? getMonthName(String monthNumber, bool isArabic) {
    if (isArabic) {
      return _arabicMonths[monthNumber];
    } else {
      return _englishMonths[monthNumber];
    }
  }
}
