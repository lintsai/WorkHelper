import 'package:intl/intl.dart';

class DateTool{
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  static String formatDate(DateTime date){
    return formatter.format(date);
  }
}