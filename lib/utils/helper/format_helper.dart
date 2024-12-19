import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class FormatHelper{
  static String dateFormat(String dateTimeString){
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('EEEE, d MMM, yyy').format(dateTime).toString();
  }

  static String timeAgoFormat(String dateTimeString){
    DateTime dateTime = DateTime.parse(dateTimeString);
    return timeago.format(dateTime,allowFromNow:true,locale:'en');
  }
}