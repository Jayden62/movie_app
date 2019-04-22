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


}
