import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatString({
    DateFormatEnum pattern = DateFormatEnum.defaultDate,
    String locale = 'en',
  }) {
    initializeDateFormatting(locale);
    return DateFormat(pattern.value, locale).format(toLocal());
  }
}

enum DateFormatEnum {
  calendarHeader,
  defaultDate,
}

extension DateFormatExtension on DateFormatEnum {
  String get value {
    switch (this) {
      case DateFormatEnum.calendarHeader:
        return 'MMMM yyyy';
      case DateFormatEnum.defaultDate:
        return 'dd MMMM yyyy - hh:mm a';
      default:
        return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    }
  }
}
