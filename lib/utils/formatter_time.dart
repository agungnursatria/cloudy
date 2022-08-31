import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class FormatterTime {
  /// Formats date time according to the given format.
  static String formatStringDate(
    String date, {
    String format = 'd MMMM yyyy (kk:mm WIB)',
    String locale = 'id',
    String emptyDate = '',
  }) {
    initializeDateFormatting();
    final DateTime dateToFormat = DateTime.parse(date);
    final DateFormat formatter = DateFormat(format, locale);
    return formatter.format(dateToFormat);
  }
}
