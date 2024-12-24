import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class FormatHelper{
  static String dateFormat(String dateTimeString){
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('EEEE, d MMM, yyy').format(dateTime).toString();
  }

  static String subtractOneMonth(DateTime date) {
    int previousMonth = date.month - 1;

    if (previousMonth == 0) {
      previousMonth = 12;
      date = DateTime(date.year - 1, previousMonth, date.day);
    } else {
      date = DateTime(date.year, previousMonth, date.day);
    }

    if (date.month != previousMonth) {
      date = DateTime(date.year, date.month, 0);
    }

    return date.toString();
  }

  static String subtractOneDay(DateTime date) {
    int yesterday = date.day - 1;
    date = DateTime(date.year, date.month, yesterday);
    return date.toString();
  }


  static String timeAgoFormat(String dateTimeString){
    DateTime dateTime = DateTime.parse(dateTimeString);
    return timeago.format(dateTime,allowFromNow:true,locale:'en');
  }
}