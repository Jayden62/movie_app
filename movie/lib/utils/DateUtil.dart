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
    var formatter = DateFormat('dd/MM/yyyy');
    String currentDate = formatter.format(now);
    return currentDate;
  }

  String getCurrentDayNumber() {
    var now = DateTime.now();
    var formatter = DateFormat('dd');
    String currentDate = formatter.format(now);
    return currentDate;
  }

  String getCurrentDay() {
    var now = DateTime.now();
    var fmt = DateFormat('EEE');
    String currentDay = fmt.format(now);
    return currentDay;
  }

  String getCurrentDayEng() {
    var now = DateTime.now();
    var fmt = DateFormat('EEEE');
    String currentDay = fmt.format(now);
    return currentDay;
  }

  String convertShortDay(String value) {
    if (value.isEmpty) {
      return "";
    }

    switch (value) {
      case "Mon":
        value = "T2";
        break;
      case "Tue":
        value = "T3";
        break;
      case "Wed":
        value = "T4";
        break;
      case "Thu":
        value = "T5";
        break;
      case "Fri":
        value = "T6";
        break;
      case "Sat":
        value = "T7";
        break;
      case "Sun":
        value = "CN";
        break;
    }
    return value;
  }

  String convertDayNumber(int value) {
    switch (value) {
      case 2:
        value = int.parse('2');
        break;
      case 3:
        value = int.parse('3');
        break;
      case 4:
        value = int.parse('4');
        break;
      case 5:
        value = int.parse('5');
        break;
      case 6:
        value = int.parse('6');
        break;
      case 0:
        value = int.parse('7');
        break;
      case 1:
        value = int.parse('8');
        break;
    }
    return value.toString();
  }

  String convertVnToEng(String text) {
    if (text.isEmpty) {
      return "";
    }
    switch (text) {
      case 'T2':
        text = 'Mon';
        break;
      case 'T3':
        text = 'Tue';
        break;
      case 'T4':
        text = 'Wed';
        break;
      case 'T5':
        text = 'Thu';
        break;
      case 'T6':
        text = 'Fri';
        break;
      case 'T7':
        text = 'Sta';
        break;
      case 'CN':
        text = 'Sun';
        break;
    }
    return text;
  }
}
