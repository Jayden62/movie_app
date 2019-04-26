import 'package:intl/intl.dart';

class DateUtil {
  static String time;

  static const formatHour = 'hh:mm';

  String getDate() {
    var date = DateTime.parse(time);
    return '${date.day}/${date.month}/${date.year}';
  }

  String getTime() {
    var date = DateTime.parse(time).toUtc();
    return '${date.hour}h${date.minute}';
  }

  String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat(' EEEEE MMM dd yyyy ');
    String currentDate = formatter.format(now);
    return currentDate;
  }
}
