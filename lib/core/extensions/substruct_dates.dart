import 'package:habita/core/constants/date_format.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  int dateDifference(String beginDate) {
    final formatter = DateFormat(dateFormat);
    final parsedEnd = formatter.parse(this);
    return parsedEnd.difference(formatter.parse(beginDate)).inDays;
  }
}
